//
//  WMViedoAlterView.h
//  SFTestDemo
//
//  Created by 黄云高 on 2017/9/19.
//  Copyright © 2017年 SugarFree. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AlertResult)(NSInteger index);

@interface WMViedoAlterView : UIView

@property (nonatomic,copy) AlertResult resultIndex;

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message sureBtn:(NSString *)sureTitle cancleBtn:(NSString *)cancleTitle;

- (void)showXLAlertView;

@end
