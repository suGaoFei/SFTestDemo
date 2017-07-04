//
//  ShareData.h
//  SFTestDemo
//
//  Created by 黄云高 on 2017/6/27.
//  Copyright © 2017年 SugarFree. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TouchModel.h"

@interface ShareData : NSObject


+ (ShareData *)shareInstrance;

@property (nonatomic, strong)ThreeDTouchModel *ThreeDTouchModel;
@end
