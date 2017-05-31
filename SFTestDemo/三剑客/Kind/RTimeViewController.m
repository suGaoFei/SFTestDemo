//
//  RTimeViewController.m
//  SFTestDemo
//
//  Created by 黄云高 on 2017/5/15.
//  Copyright © 2017年 SugarFree. All rights reserved.
//

#import "RTimeViewController.h"
#import "Person.h"

#import <objc/runtime.h>

@interface RTimeViewController ()

@end

@implementation RTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"RunTimeTest";
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.tintColor = [UIColor blackColor];
    
    [self testOne];
    [self testTwo];
    
    [self testThree];
}
- (void)testOne{
    NSLog(@"testOne : run first, then eat");
    [Person run];
    [Person eat];
    
}
- (void)testTwo{
    Method methodOne = class_getClassMethod([Person class], @selector(run));
    Method methodTwo = class_getClassMethod([Person class], @selector(eat));
    
    method_exchangeImplementations(methodOne, methodTwo);
    
    NSLog(@"testTwo : run first then eat");
    [Person run];
    [Person eat];
    
}

- (void)testThree{
    unsigned int outCount = 0;
    Ivar *ivars = class_copyIvarList([Person class], &outCount);
    
    // 遍历所有成员变量
    for (int i = 0; i < outCount; i++) {
        // 取出i位置对应的成员变量
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        const char *type = ivar_getTypeEncoding(ivar);
        NSLog(@"成员变量名：%s 成员变量类型：%s",name,type);
    }
    // 注意释放内存！
    free(ivars);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
