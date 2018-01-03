//
//  FriendListViewController.h
//  Expenses
//
//  Created by  on 9/28/16.
//  Copyright © 2016 uhcl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendListViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray* _friendListArray;
    
}

@property (weak, nonatomic) IBOutlet UITableView *friendsListTableView;

@end
