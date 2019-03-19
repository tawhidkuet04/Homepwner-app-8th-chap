//
//  BNRDetailViewController.m
//  Homepwner
//
//  Created by Tawhid Joarder on 3/19/19.
//  Copyright © 2019 Tawhid Joarder. All rights reserved.
//

#import "BNRDetailViewController.h"
#import "BNRItem.h"

@interface BNRDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialNumebrField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLable;

@end

@implementation BNRDetailViewController
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
@end
