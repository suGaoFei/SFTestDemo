//
//  BaseViewController.m
//  SFTestDemo
//
//  Created by 黄云高 on 2018/3/19.
//  Copyright © 2018年 SugarFree. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBaseView];
}
- (void)setBaseView{
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"title_new_back"] style:UIBarButtonItemStylePlain target:self action:@selector(backButtonAction:)];
    NSInteger index = [self.navigationController.viewControllers indexOfObject:self];
    if (index != 0) {
        self.navigationItem.leftBarButtonItem = item;
    }
}
- (void)backButtonAction:(UIBarButtonItem *)item{
    Class backController = NSClassFromString(self.backController);
    NSArray *reverseArray = [[self.navigationController.viewControllers reverseObjectEnumerator] allObjects];
    if (!self.backController) {
        [self.navigationController popViewControllerAnimated:YES];
    }else {
        for (UIViewController *controller in reverseArray) {
            if ([controller isKindOfClass:backController]) {
                [self.navigationController popToViewController:controller animated:YES];
                break;
            }
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
