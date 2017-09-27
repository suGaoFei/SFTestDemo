//
//  BaseNavigationController.m
//  SFTestDemo
//
//  Created by 黄云高 on 2017/7/28.
//  Copyright © 2017年 SugarFree. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1]];
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor whiteColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:21], NSFontAttributeName, nil]];
//#warning 下回分解
    /*
    UIBarButtonItem *backBarItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"title_new_back"]
                                                                    style:UIBarButtonItemStylePlain
                                                                   target:self
                                                                   action:@selector(backButtonAction:)];
    
    NSUInteger index = [self.navigationController.viewControllers indexOfObject:self];
    
    if (index != 0) {
        self.navigationItem.leftBarButtonItem = backBarItem;
    }
     */
    
    
    UIImage *backButtonImage = [[UIImage imageNamed:@"title_new_back"] resizableImageWithCapInsets:UIEdgeInsetsMake(0,30, 0, 0)];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
- (void)backButtonAction:(UIBarButtonItem*)item
{
    Class backController = NSClassFromString(self.backController);
    
    NSArray * reverseArray = [[self.navigationController.viewControllers reverseObjectEnumerator] allObjects];
    
    if (self.backController==nil) {
        
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        
        for (UIViewController * controller in reverseArray) {
            
            if ([controller isKindOfClass:backController]) {
                [self.navigationController popToViewController:controller animated:YES];
                break;
            }
        }
    }
}
 */
- (void)showViewController:(UIViewController *)vc sender:(nullable id)sender {
    
    [self pushViewController:vc animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
