//
//  ShareData.m
//  SFTestDemo
//
//  Created by 黄云高 on 2017/6/27.
//  Copyright © 2017年 SugarFree. All rights reserved.
//

#import "ShareData.h"

@implementation ShareData

+ (ShareData *)shareInstrance
{
    static ShareData * instace = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instace = [[ShareData alloc] init];
    });
    return instace;
}
@end
