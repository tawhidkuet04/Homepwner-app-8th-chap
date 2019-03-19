//
//  BNRItemsViewController.m
//  Homepwner
//
//  Created by Tawhid Joarder on 3/18/19.
//  Copyright © 2019 Tawhid Joarder. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"
#import "BNRDetailViewController.h"

@interface BNRItemsViewController()
@property (nonatomic,strong) IBOutlet UIView *headerView;
@end;

@implementation BNRItemsViewController
#pragma mark view life cycle
-(void)viewDidLoad{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    UIView *header = self.headerView;
    [self.tableView setTableHeaderView:header];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark table view
-(instancetype)init {
    self = [ super initWithStyle:UITableViewStylePlain];
    self = [super initWithStyle:UITableViewStylePlain];
        if(self){
            UINavigationItem *navItem = self.navigationItem;
            navItem.title = @"Homepwner";
            UIBarButtonItem *bbi = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewItem:)];
            navItem.rightBarButtonItem=bbi;
            navItem.leftBarButtonItem=self.editButtonItem;
        }
    return self ;

}
-(instancetype)initWithStyle:(UITableViewStyle)style{
    return [ self init ];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[[BNRItemStore sharedStore]allItems]count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    NSArray *items = [[BNRItemStore sharedStore]allItems];
    BNRItem *item = items[indexPath.row];
    cell.textLabel.text = [item description];
    
    return cell ;
}
-(IBAction)addNewItem:(id)sender{
    BNRItem *newItem = [[BNRItemStore sharedStore]createItem];
    NSInteger lastRow = [[[BNRItemStore sharedStore]allItems]indexOfObject:newItem];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(editingStyle == UITableViewCellEditingStyleDelete){
        NSArray *items = [[BNRItemStore sharedStore]allItems];
        BNRItem *item = items[indexPath.row];
        [[BNRItemStore sharedStore]removeItem:item];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    [[BNRItemStore sharedStore]moveItemAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BNRDetailViewController *deatilViewController = [[BNRDetailViewController alloc]init];
    NSArray *items=[[BNRItemStore sharedStore]allItems];
    BNRItem *selectedItem = items[indexPath.row];
    deatilViewController.item = selectedItem;
    [self.navigationController pushViewController:deatilViewController animated:YES];
}

@end
