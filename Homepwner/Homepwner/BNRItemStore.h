//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Tawhid Joarder on 3/18/19.
//  Copyright © 2019 Tawhid Joarder. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BNRItem;
NS_ASSUME_NONNULL_BEGIN

@interface BNRItemStore : NSObject
+(instancetype)sharedStore;
-(BNRItem *)createItem;
-(void)removeItem:(BNRItem *)item;
-(NSArray *) allItems;
-(void)moveItemAtIndex:(NSUInteger )fromIndex toIndex:(NSUInteger)toIndex;
@end

NS_ASSUME_NONNULL_END
