//
//  BaseViewController.h
//  SFTestDemo
//
//  Created by 黄云高 on 2018/3/19.
//  Copyright © 2018年 SugarFree. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

/**
 *@brief指定返回页面
 */
@property (nonatomic, copy) NSString *backController;

/**
 *@brief返回方法
 */
- (void)backButtonAction:(UIBarButtonItem *)item;
@end
