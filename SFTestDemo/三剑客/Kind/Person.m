//
//  Person.m
//  SFTestDemo
//
//  Created by 黄云高 on 2017/5/15.
//  Copyright © 2017年 SugarFree. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (Person *)eat{
    Person *Bill = [[Person alloc]init];
    NSLog(@"%@ can eat", Bill);
    return Bill;
}

+ (Person *)run{
    Person *Hellen = [[Person alloc]init];
    NSLog(@"%@ can run", Hellen);
    return Hellen;
}

@end
