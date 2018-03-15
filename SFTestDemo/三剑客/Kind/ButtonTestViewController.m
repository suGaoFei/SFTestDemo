//
//  ButtonTestViewController.m
//  SFTestDemo
//
//  Created by 黄云高 on 2018/3/7.
//  Copyright © 2018年 SugarFree. All rights reserved.
//

#import "ButtonTestViewController.h"
#import "GFButton.h"
@interface ButtonTestViewController ()<GFButtonDelegate>
@property (nonatomic, copy) NSArray *titleArray;

@end

@implementation ButtonTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpUi];
    [self setUpData];
}
- (void)setUpData{
    _titleArray = @[@"高飞", @"铁棒有何用", @"abc", @"这是很长的名字哟"];
}
- (void)setUpUi{
    self.view.backgroundColor = [UIColor whiteColor];
    [self addButton];
    [self testForLog];
}
- (void)addButton{
    for (int i = 0; i < _titleArray.count; i++) {
        GFButton *button = [[GFButton alloc]initWithFrame:CGRectMake(10, (50*i) + 150, 60, 20)];
        button.GFDelegate = self;
        [button setTitle:_titleArray[i] forState:UIControlStateNormal];
        [button sizeToFit];
        [self.view addSubview:button];
    }
    
    CGFloat buttonWidth = 0;
    for (int i = 0; i < _titleArray.count; i++) {
        GFButton *button = [[GFButton alloc]initWithFrame:CGRectMake(5 * (i + 1) + buttonWidth, 400, 10, 30)];
        button.tag = i;
//        button.GFDelegate = self;
        [button addTarget:self action:@selector(clickTheButton:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:_titleArray[i] forState:UIControlStateNormal];
        [button sizeToFit];
        buttonWidth += button.width;
        [self.view addSubview:button];
    }
}
- (void)clickTheButton:(UIButton*)btn{
    NSLog(@"点击了第：%ld按钮，名字叫做《%@》", btn.tag, _titleArray[btn.tag]);
}
- (void)clickTheGFButton{
    NSLog(@"这是代理出来的点击事件");
}
- (void)testForLog{
//    for (int i = 0; i < 10000; i++) {
//        NSLog(@"是不是变卡了啊：%d", i);
//    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
