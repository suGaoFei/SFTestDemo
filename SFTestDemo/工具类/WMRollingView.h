//
//  WMRollingView.h
//  SFTestDemo
//
//  Created by 黄云高 on 2017/2/28.
//  Copyright © 2017年 SugarFree. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WMRollingModel.h"
@interface WMRollingView : UIView

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, copy) void (^clickBlock)(NSInteger index);

- (void)setRollingViewData:(NSMutableArray *)mutableArray;

- (void)stopTimer;
@end
