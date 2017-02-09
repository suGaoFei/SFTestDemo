//
//  FindViewController.m
//  SFTestDemo
//
//  Created by 黄云高 on 2016/12/30.
//  Copyright © 2016年 SugarFree. All rights reserved.
//

#import "FindViewController.h"

@interface FindViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UIImageView *headView;
@property (strong, nonatomic) UIVisualEffectView *effectView;
@end

#define ScreenWidth [UIScreen mainScreen].bounds.size.width

@implementation FindViewController{
    UITableView *_tablewView;
    float imageHeight;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUi];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.alpha = 0.4;
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.alpha = 1;
    
}
- (void)setUpUi{
    self.title = @"简单点";
    self.view.backgroundColor = [UIColor colorFromHexRGB:@"f0f0f0"];
    imageHeight = 375/1.6;
    
    [self setTableView];
    [self setHead];
}
- (void)setHead{
    self.headView = [[UIImageView alloc]initWithFrame:CGRectMake(0, -imageHeight, self.view.bounds.size.width, imageHeight)];
    self.headView.image = [UIImage imageNamed:@"全家福"];
    self.headView.contentMode = UIViewContentModeScaleAspectFill;
    self.headView.clipsToBounds = YES;
    [_tablewView addSubview:self.headView];
    
    
    self.effectView = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight]];
    self.effectView.frame = CGRectMake(0, -imageHeight, self.view.bounds.size.width, imageHeight);
    self.effectView.alpha = 0.5;
    [_tablewView addSubview:self.effectView];
}
- (void)setTableView{
//    self.navigationController.navigationBar.backgroundColor =
    
    
    _tablewView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];

    _tablewView.delegate = self;
    _tablewView.dataSource = self;
    
    _tablewView.contentInset = UIEdgeInsetsMake(imageHeight, 0, 0, 0);
    
    [self.view addSubview:_tablewView];
    
//    self.automaticallyAdjustsScrollViewInsets = NO;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Scroll 
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat off_y = scrollView.contentOffset.y;
//    CGFloat kHeight = [UIScreen mainScreen].bounds.size.height;
    if (off_y < - imageHeight) {
        self.headView.frame = CGRectMake(0, off_y, ScreenWidth, -off_y);
    }
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
