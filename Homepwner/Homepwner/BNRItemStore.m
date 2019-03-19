//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Tawhid Joarder on 3/18/19.
//  Copyright © 2019 Tawhid Joarder. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"
#import "BNRImageStore.h"
@interface BNRItemStore()

@property (nonatomic) NSMutableArray *privateItems;

@end;

@implementation BNRItemStore
+(instancetype)sharedStore{
    static BNRItemStore *sharedStore = nil ;
    if(!sharedStore){
        sharedStore = [ [self alloc] initPrivate];
    }
    return sharedStore;
}
-(instancetype)initPrivate{
    self = [ super init ];
    if(self){
        _privateItems = [[NSMutableArray alloc]init];
    }
    return self ;
}
-(NSArray *) allItems{
    return [self.privateItems copy];
}
-(BNRItem *)createItem{
    BNRItem *item = [BNRItem randomItem];
    [self.privateItems addObject:item];
    return item ;
}
-(void)removeItem:(BNRItem *)item{
    NSString *key = item.itemKey;
    [[BNRImageStore sharedstore]deleteImageForKey:key];
    [self.privateItems removeObjectIdenticalTo:item];
}

-(void)moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex{
    if(fromIndex == toIndex){
        return ;
    }
    BNRItem *item = self.privateItems[fromIndex];
    [self.privateItems removeObjectAtIndex:fromIndex];
    [self.privateItems insertObject:item atIndex:toIndex];
    
}
@end
