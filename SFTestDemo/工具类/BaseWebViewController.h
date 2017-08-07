//
//  BaseWebViewController.h
//  SFTestDemo
//
//  Created by 黄云高 on 2017/7/28.
//  Copyright © 2017年 SugarFree. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewJavascriptBridge.h"
@interface BaseWebViewController : UIViewController
/***************
/
/加载的网页地址
/
****************/
@property (nonatomic, copy) NSString *UrlString;
@end
