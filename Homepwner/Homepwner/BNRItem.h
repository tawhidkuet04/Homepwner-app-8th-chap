//
//  BNRItem.h
//  Objective C Learning
//
//  Created by Tawhid Joarder on 3/6/19.
//  Copyright © 2019 Tawhid Joarder. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BNRItem : NSObject{
    int _valueInDollars;
    NSString *_itemName;
    NSString *_serialNumber;
    NSDate *_dateCreated;
    
}
+(instancetype)randomItem;
-(instancetype)initWithItemName:(NSString *)name  valueInDollars:(int)value serialNumber:(NSString *)sNumber;
-(instancetype)initWithItemName:(NSString *)name;
-(void)setItemName:(NSString *)str;
-(NSString *)itemName;
-(void)setSerialNumber:(NSString *)str;
-(NSString *)serialNumber;
-(void)setValueInDollars:(int)v;
-(int)valueInDollars;
-(NSDate *)dateCreated;

@end

NS_ASSUME_NONNULL_END
