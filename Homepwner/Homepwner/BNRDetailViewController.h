//
//  BNRDetailViewController.h
//  Homepwner
//
//  Created by Tawhid Joarder on 3/19/19.
//  Copyright © 2019 Tawhid Joarder. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class BNRItem;
@interface BNRDetailViewController : UIViewController
@property (nonatomic,strong) BNRItem *item;
@end

NS_ASSUME_NONNULL_END
