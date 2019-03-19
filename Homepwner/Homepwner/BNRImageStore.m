//
//  BNRImageStore.m
//  Homepwner
//
//  Created by Tawhid Joarder on 3/19/19.
//  Copyright © 2019 Tawhid Joarder. All rights reserved.
//

#import "BNRImageStore.h"
@interface BNRImageStore()
@property (nonatomic,strong) NSMutableDictionary *dictionary;
@end

@implementation BNRImageStore
+(instancetype)sharedstore{
    static BNRImageStore *sharedStore = nil ;
    if(!sharedStore){
        sharedStore = [[self alloc]initPrivate];
    }
    return  sharedStore;
}
-(instancetype)init{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use+[BNRImageStore sharedStore" userInfo:nil];
    return nil;
}
-(instancetype)initPrivate{
    self = [super init];
    if(self){
        _dictionary = [[NSMutableDictionary alloc]init];
    }
    return self ;
    
}
-(void)setImage:(UIImage *)image forKey:(NSString *)key{
    self.dictionary[key]=image;
}
-(UIImage *)imageForKey:(NSString *)key{
    return self.dictionary[key];
}
-(void)deleteImageForKey:(NSString *)key{
    if(!key){
        return ;
    }
    [self.dictionary removeObjectForKey:key];
}
@end
