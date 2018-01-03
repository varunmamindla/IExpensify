//
//  ExpensesListViewController.m
//  Expenses
//
//  Created by  on 10/15/16.
//  Copyright © 2016 uhcl. All rights reserved.
//

#import "ExpensesListViewController.h"
#import "Bill.h"
#import "Friend.h"

@interface ExpensesListViewController ()

@end

@implementation ExpensesListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    self.nameLabel.text=_nameLabeltxt;
    [self loadBillstableData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void) loadBillstableData {
    
    _billsData=[Bill fetchAllBillsData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [_billsData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    Bill *billObj=[_billsData objectAtIndex:indexPath.row];
    
    UIImageView *img=(UIImageView *)[cell.contentView viewWithTag:5];
    UILabel* categoryLabel = (UILabel *)[cell.contentView viewWithTag:1];
    UILabel* paidLabel = (UILabel *)[cell.contentView viewWithTag:2];
    UILabel* oweLabel = (UILabel *)[cell.contentView viewWithTag:3];
    UILabel* amountLabel = (UILabel *)[cell.contentView viewWithTag:4];
    
    img.image=[UIImage imageNamed:[NSString stringWithFormat:@"Groceries"]];
    categoryLabel.text=billObj.category;
    if(billObj.friendId==0) {
        paidLabel.text=[NSString stringWithFormat:@"you paid $%.2f",[billObj.amount floatValue]];
        oweLabel.text= @"You lent";
        oweLabel.textColor=[UIColor colorWithRed:37/255.0 green:147/255.0 blue:8/255.0 alpha:1.0];
        float lentAmount=[billObj.amount floatValue]- ([billObj.amount floatValue]/4);
        amountLabel.text=[NSString stringWithFormat:@"$%.2f", lentAmount];
        amountLabel.textColor=[UIColor colorWithRed:37/255.0 green:147/255.0 blue:8/255.0 alpha:1.0];
    }else {
        NSString *paidName=[Friend getFriendNameWhoseId:billObj.friendId];
        paidLabel.text=[NSString stringWithFormat:@"%@ paid $%.2f",paidName,[billObj.amount floatValue]];
        oweLabel.text= @"You borrowed";
        oweLabel.textColor=[UIColor orangeColor];
        float borrowedAmount=([billObj.amount floatValue]/4);
        amountLabel.text=[NSString stringWithFormat:@"$%.2f", borrowedAmount];
        amountLabel.textColor=[UIColor orangeColor];
    }
    
    return cell;
}


- (IBAction)deleteFriendBtnClicked:(id)sender {
}

- (IBAction)settleupBtnClicked:(id)sender {
}
- (IBAction)backbtnClicked:(id)sender {
    UINavigationController *navigationController = self.navigationController;
    [navigationController popViewControllerAnimated:YES];
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
}
@end
