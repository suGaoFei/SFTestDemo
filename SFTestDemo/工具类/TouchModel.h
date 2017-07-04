//
//  TouchModel.h
//  SFTestDemo
//
//  Created by 黄云高 on 2017/6/27.
//  Copyright © 2017年 SugarFree. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface TouchModel : JSONModel

@end

@interface ThreeDTouchModel : NSObject
//是否使用3DTouch进入
@property (nonatomic,assign) BOOL is3DTouch;
//进入页面
@property (nonatomic,copy) NSString * goWhere;
//进入的NavigationContrllor 的索引
@property (nonatomic,assign) int goindex;
//3DTouch计数
@property (nonatomic,assign) int threeDCount;

@end
