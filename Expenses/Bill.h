//
//  Bill.h
//  Expenses
//
//  Created by  on 11/4/16.
//  Copyright © 2016 uhcl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Bill : NSManagedObject

// Insert code here to declare functionality of your managed object subclass
+(bool)addBillWithId:(NSNumber *) billId friendId:(NSNumber *)friendId billCategory:(NSString *)billCategory totalAmount:(NSNumber *) totalAmount image:(NSData *) image ;
+(NSMutableArray *) fetchAllBills ;
+(NSMutableArray *) fetchAllBillsData;
@end

NS_ASSUME_NONNULL_END

#import "Bill+CoreDataProperties.h"
