//
//  BNRDetailViewController.m
//  Homepwner
//
//  Created by Tawhid Joarder on 3/19/19.
//  Copyright © 2019 Tawhid Joarder. All rights reserved.
//

#import "BNRDetailViewController.h"
#import "BNRItem.h"
#import "BNRImageStore.h"

@interface BNRDetailViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialNumebrField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLable;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;

@end

@implementation
BNRDetailViewController
- (IBAction)backgroundTapped:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)takePicture:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }else {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    imagePicker.delegate = self ;
    [self presentViewController:imagePicker animated:YES completion:nil];

}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info{
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    [[BNRImageStore sharedstore]setImage:image forKey:self.item.itemKey];
    self.imageView.image = image ;
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    BNRItem *item = self.item ;
    self.nameField.text = item.itemName;
    self.serialNumebrField.text = item.serialNumber;
    self.valueField.text = [NSString stringWithFormat:@"%d",item.valueInDollars];
    static NSDateFormatter *dateFormatter = nil ;
    if(!dateFormatter){
        dateFormatter = [[NSDateFormatter alloc]init];
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        dateFormatter.timeStyle = NSDateFormatterNoStyle;
       
        
    }
     self.dateLable.text = [dateFormatter stringFromDate:item.dateCreated];
    NSString *imageKey = self.item.itemKey;
    UIImage *imageTodisplay = [[BNRImageStore sharedstore]imageForKey:imageKey];
    self.imageView.image = imageTodisplay;
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
    BNRItem *item = self.item ;
    item.itemName = self.nameField.text ;
    item.serialNumber = self.serialNumebrField.text;
    item.valueInDollars = [ self.valueField.text intValue];
    
}
-(void)setItem:(BNRItem *)item{
    _item = item ;
    self.navigationItem.title = _item.itemName;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES ;
}
@end
