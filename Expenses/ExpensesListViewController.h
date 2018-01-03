//
//  ExpensesListViewController.h
//  Expenses
//
//  Created by  on 10/15/16.
//  Copyright © 2016 uhcl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExpensesListViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *_billsData;
}

@property (nonatomic,retain) NSString *nameLabeltxt;
@property (nonatomic,retain) NSNumber *memberID;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *oweDetails;
@property (weak, nonatomic) IBOutlet UITableView *billDetailsTableView;

- (IBAction)deleteFriendBtnClicked:(id)sender;
- (IBAction)settleupBtnClicked:(id)sender;

- (IBAction)backbtnClicked:(id)sender;


@end
