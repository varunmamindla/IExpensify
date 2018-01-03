//
//  FriendListViewController.m
//  Expenses
//
//  Created by  on 9/28/16.
//  Copyright © 2016 uhcl. All rights reserved.
//

#import "FriendListViewController.h"
#import "ExpensesListViewController.h"
#import "Friend.h"

@interface FriendListViewController ()

@end

@implementation FriendListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
   // _friendListArray = [[NSMutableArray alloc] initWithObjects:@"Friend1", @"Friend2", @"Friend3", nil];
    
    
}

-(void)viewWillAppear:(BOOL)animated {
    _friendListArray= [Friend fetchAllFriendsRecords];
    [self.friendsListTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [_friendListArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    Friend *friendObj=[_friendListArray objectAtIndex:indexPath.row];
    NSLog(@"%@",[friendObj friendId]);
    UIImageView *img=(UIImageView *)[cell.contentView viewWithTag:4];
    UILabel* nameLabel = (UILabel *)[cell.contentView viewWithTag:1];
    UILabel* oweLabel = (UILabel *)[cell.contentView viewWithTag:2];
    UILabel* valueLabel = (UILabel *)[cell.contentView viewWithTag:3];
    UILabel* settleLabel = (UILabel *)[cell.contentView viewWithTag:5];

    
    nameLabel.text=[NSString stringWithFormat:@"%@",friendObj.name];
    if([friendObj.youOwe floatValue] > [friendObj.owesYou floatValue]) {
    oweLabel.text=@"You Owe";
    oweLabel.textColor=[UIColor orangeColor];
        float bal = [friendObj.youOwe floatValue]-[friendObj.owesYou floatValue];
    valueLabel.text=[NSString stringWithFormat:@"$%.2f",bal];
    valueLabel.textColor=[UIColor orangeColor];
        settleLabel.text=@"";
    }else if([friendObj.youOwe floatValue] < [friendObj.owesYou floatValue]) {
        oweLabel.text=@"Owes You";
        oweLabel.textColor=[UIColor greenColor];
        float bal = [friendObj.owesYou floatValue]-[friendObj.youOwe floatValue];
        valueLabel.text=[NSString stringWithFormat:@"$%.2f",bal];
        valueLabel.textColor=[UIColor greenColor];
        settleLabel.text=@"";
    }else {
        settleLabel.text=@"settled up";
        valueLabel.text=@"";
        oweLabel.text=@"";
    }
    
    img.image=[UIImage imageNamed:[NSString stringWithFormat:@"Face"]];
    return cell;
}

- (void)tableView:(UITableView * )tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //[[self navigationController] setNavigationBarHidden:YES animated:YES];
    [self performSegueWithIdentifier:@"Friends2detailExpenses" sender:self];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"Friends2detailExpenses"])
    {
        ExpensesListViewController *expensesVC=[segue destinationViewController];
        NSIndexPath *selectedindex=[self.friendsListTableView indexPathForSelectedRow];
        Friend *friendObj=[_friendListArray objectAtIndex:selectedindex.row];
        expensesVC.nameLabeltxt=friendObj.name;
        expensesVC.memberID=friendObj.friendId;
    }
        
}


@end
