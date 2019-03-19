//
//  BNRImageStore.h
//  Homepwner
//
//  Created by Tawhid Joarder on 3/19/19.
//  Copyright © 2019 Tawhid Joarder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface BNRImageStore : NSObject
+(instancetype)sharedstore;
-(void)setImage:(UIImage *)image forKey:(NSString *)key;
-(UIImage *)imageForKey:(NSString *)key;
-(void)deleteImageForKey:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
