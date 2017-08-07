//
//  BaseNavigationController.h
//  SFTestDemo
//
//  Created by 黄云高 on 2017/7/28.
//  Copyright © 2017年 SugarFree. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseNavigationController : UINavigationController


/**
 *  基于导航下，设置返回到指定的controller
 */
@property (nonatomic,copy) NSString * backController;
@end
