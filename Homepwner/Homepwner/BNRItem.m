//
//  BNRItem.m
//  Objective C Learning
//
//  Created by Tawhid Joarder on 3/6/19.
//  Copyright © 2019 Tawhid Joarder. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem
+(instancetype)randomItem{
    NSArray *randomAdjective = @[@"Fluppy",@"Rusty",@"Shinny"];
    NSArray *randomNoun = @[@"Bear",@"Spork",@"Mark"];
    NSInteger adjectiveIndex = arc4random() % [randomAdjective count];
    NSInteger nounIndex = arc4random() % [randomNoun count];
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",randomAdjective[adjectiveIndex],randomNoun[nounIndex]];
    int randomValue = arc4random() % 100 ;
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
            '0'+arc4random()% 10,'A'+arc4random()% 26,'0'+arc4random() % 10,'A'+arc4random() % 26,'0'+arc4random() % 10 ];
    BNRItem *newItem = [[self alloc] initWithItemName:randomName valueInDollars:randomValue serialNumber:randomSerialNumber];
    return newItem;
}
-(instancetype)initWithItemName:(NSString *)name  valueInDollars:(int)value serialNumber:(NSString *)sNumber{
    self = [super init ];
    if(self){
        _itemName=name;
        _valueInDollars=value;
        _serialNumber=sNumber;
        _dateCreated =[ [NSDate alloc] init ];
    }
    return self ;
}

-(instancetype)init{
    return [self initWithItemName:@"ok man"];
}
-(instancetype)initWithItemName:(NSString *)name{
    return [self initWithItemName:@"ggg" valueInDollars:93434 serialNumber:@""];
}
-(void)setItemName:(NSString *)str{
    _itemName = str ;
}
-(NSString *)itemName{
    return _itemName;
}
-(void)setSerialNumber:(NSString *)str{
    _serialNumber = str ;
}
-(NSString *)serialNumber{
    return  _serialNumber;
}
-(void)setValueInDollars:(int)v{
    _valueInDollars = v ;
}
-(int)valueInDollars{
    return _valueInDollars ;
}
-(NSDate *)dateCreated{
    return _dateCreated;
}
- (NSString *) description {
    NSString *des=[ [NSString alloc] initWithFormat:@"%@ %@ %@ %d",self.itemName,self.serialNumber,self.dateCreated,self.valueInDollars];
    return des ;
}
@end
