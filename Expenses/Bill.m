//
//  Bill.m
//  Expenses
//
//  Created by  on 11/4/16.
//  Copyright © 2016 uhcl. All rights reserved.
//

#import "Bill.h"
#import "AppDelegate.h"


@implementation Bill

// Insert code here to add functionality to your managed object subclass

+ (NSManagedObjectContext *) getManagedObjectContext
{
    AppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
    return appDelegate.managedObjectContext;
}

+(bool)addBillWithId:(NSNumber *) billId friendId:(NSNumber *)friendId billCategory:(NSString *)billCategory totalAmount:(NSNumber *) totalAmount image:(NSData *) image  {
    
    NSManagedObjectContext *context = [[self class] getManagedObjectContext];
    //Create a blank new record
    Bill *addBillObj = (Bill *)[NSEntityDescription insertNewObjectForEntityForName:@"Bill" inManagedObjectContext:context];
    
    [addBillObj setBillId:billId];
    [addBillObj setFriendId:friendId];
    [addBillObj setCategory:billCategory];
    [addBillObj setAmount:totalAmount];
    [addBillObj setImage:image];
    //Save the new record
    NSError *error;
    if(![context save:&error])
    {
        return false;
    }
    else
    {
        NSLog(@"bill added");
        return true;
    }
    
}

+(NSMutableArray *) fetchAllBills{
    //Get managed object context
    NSManagedObjectContext* context =[[self class] getManagedObjectContext];
    // Define our table/entity to use
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Bill" inManagedObjectContext:context];
    // Setup the fetch request
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    
    // Fetch the records and handle an error
    NSError *error;
    NSMutableArray *mutableFetchResults = [[context executeFetchRequest:request error:&error] mutableCopy];
    if (!mutableFetchResults)
    {
        return 0;
    }
    
    return mutableFetchResults;
}


+(NSMutableArray *) fetchAllBillsData{
    //Get managed object context
    NSManagedObjectContext* context =[[self class] getManagedObjectContext];
    // Define our table/entity to use
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Bill" inManagedObjectContext:context];
    // Setup the fetch request
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    
    // Fetch the records and handle an error
    NSError *error;
    NSMutableArray *mutableFetchResults = [[context executeFetchRequest:request error:&error] mutableCopy];
    if (!mutableFetchResults)
    {
        return nil;
    }
    
    return mutableFetchResults;
}


@end
