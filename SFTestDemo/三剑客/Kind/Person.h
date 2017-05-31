//
//  Person.h
//  SFTestDemo
//
//  Created by 黄云高 on 2017/5/15.
//  Copyright © 2017年 SugarFree. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

+ (Person *)eat;
+ (Person *)run;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int age;
@property (nonatomic, copy) NSNumber *heigth;
@property (nonatomic, assign) float weight;


@end
