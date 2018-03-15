//
//  FourIsCute.m
//  SFTestDemo
//
//  Created by 黄云高 on 2017/7/12.
//  Copyright © 2017年 SugarFree. All rights reserved.
//

#import "FourIsCute.h"
#import "ButtonTestViewController.h"
@interface FourIsCute ()

@property (nonatomic, copy) UIScrollView *contentScrollView;    /*内容滚动*/
@property (nonatomic, copy) UIScrollView *titleScrollView;      /*标题滚动*/

@end

@implementation FourIsCute

- (void)viewDidLoad {
    [super viewDidLoad];

    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"before perform");
        [self performSelector:@selector(printLog) withObject:nil afterDelay:0];
        NSLog(@"after perform");
    });
    
    [self setUpUi];
    [self testUrl];
    [self testBtn];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"right" style:UIBarButtonItemStylePlain target:self action:@selector(jumpRight)];
}
- (void)jumpRight{
    ButtonTestViewController *nextVC = [[ButtonTestViewController alloc]init];
    nextVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController showViewController:nextVC sender:nil];
}
- (void)testBtn {
    UIButton *btn = [[UIButton alloc] init];
    [self.view addSubview:btn];
    [btn removeFromSuperview];
    NSLog(@"%@", (btn == nil) ? @"YES" : @"NO");
    
    [self.view addSubview:btn];
    __weak typeof (UIButton *) weakSelf = btn;
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf removeFromSuperview];
        NSLog(@"%@", (weakSelf == nil) ? @"YES" : @"NO");
    });
    
}
- (void)printLog {
    NSLog(@"printLog");
}
- (void)testUrl {
    NSString *path = @"https://www.baidu.com/";
    NSString *path2 = @"http://fanyi.baidu.com/translate?query=#auto/zh/";
    NSString *path3 = @"http://fanyi.baidu.com/translate?query=#zh/en/测试";
    NSURL *url = [NSURL URLWithString:path];
    NSURL *url2 = [NSURL URLWithString:path2];
    NSURL *url3 = [NSURL URLWithString:path3];
    NSLog(@"%@", url);
    NSLog(@"%@", url2);
    NSLog(@"%@", url3);
}

- (void)setUpUi{
//    NSMutableArray *dataArray = [@[] mutableCopy];
    [self.view addSubview:self.titleScrollView];
    [self.view addSubview:self.contentScrollView];
    
    
}

#pragma mark Lazy Loading 
- (UIScrollView *)contentScrollView{
    if (!_contentScrollView) {
        _contentScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64 + 50, SCREEN_WIDTH, SCREEN_HEIGHT - 164)];
        _contentScrollView.backgroundColor = [UIColor redColor];
        _contentScrollView.showsHorizontalScrollIndicator = NO;
        _contentScrollView.pagingEnabled = YES;
        _contentScrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 5, 0);
        for (int i = 0; i < 5; i++) {
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * i, -64, _contentScrollView.frame.size.width, _contentScrollView.frame.size.height)];
            view.backgroundColor = [UIColor colorWithRed:i * 0.2 green:i * 0.2 blue:i * 0.2 alpha:i * 0.1];
            [_contentScrollView addSubview:view];
        }
    }
    return _contentScrollView;
}
- (UIScrollView *)titleScrollView{
    if (!_titleScrollView) {
        _titleScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 50)];
        _titleScrollView.backgroundColor = [UIColor greenColor];
        _titleScrollView.showsHorizontalScrollIndicator = NO;
        _titleScrollView.contentSize = CGSizeMake(500, 0);
        for (int i = 0; i < 5; i++) {
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100 * i, 0, 100, 50)];
            btn.backgroundColor = [UIColor colorWithRed:i * 0.2 green:i * 0.2 blue:i * 0.2 alpha:i * 0.1];
            [_titleScrollView addSubview:btn];
        }
    }
    return _titleScrollView;
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
