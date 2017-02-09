//
//  TestTableViewController.m
//  SFTestDemo
//
//  Created by 黄云高 on 2017/1/4.
//  Copyright © 2017年 SugarFree. All rights reserved.
//

#import "TestTableViewController.h"

#import "TestView.h"
#import "HospitalTableViewCell.h"

@interface TestTableViewController ()<ClickMoreDelegate>

@property (nonatomic, strong) TestView *textView;
@property (nonatomic, strong) TestView *hospitalView;


@end

@implementation TestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //show Height
//    if (account == 0) {
//        0;
//    }else if (account <= 3){
//        145;
//    }else{
//        290;
//    }
    
    
   
    
    
    _textView = [[TestView alloc]initWithFrame:CGRectZero];//计算高度
    _textView.clickMoreDelegate = self;
    _textView.leftLabel.text = @"优质服务";
    _textView.rigthLabel.text = @"更多";
    _textView.rightArrowImageView.image = [UIImage imageNamed:@"rightArrow"];
    _textView.flag = 1;
    [_textView setValueWithModelArray:@[@1,@2,@3,@4,@1,@2,@3,@4]];

    
    _textView.frame = CGRectMake(0, 10, ScreenWidth, _textView.viewHeight);
//    textView.showHeight = 290;
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, _textView.viewHeight  + 20 + 35)];
    headView.backgroundColor = [UIColor colorFromHexRGB:@"f0f0f0"];
    
//    [textView.showCollectionView reloadData];
    
    
    
    _hospitalView = [[TestView alloc]initWithFrame:CGRectMake(0, _textView.viewHeight + 20, ScreenWidth, 35)];
    _hospitalView.clickMoreDelegate = self;
    _hospitalView.leftLabel.text = @"本地医院";
    _hospitalView.rigthLabel.text = @"更多";
    _hospitalView.rightArrowImageView.image = [UIImage imageNamed:@"rightArrow"];
    _hospitalView.showHeight = 0;
    
    
    [headView addSubview:_textView];
    [headView addSubview:_hospitalView];
    

    self.tableView.tableHeaderView = headView;
    
    [self.tableView registerNib:[UINib nibWithNibName:(NSStringFromClass([HospitalTableViewCell class])) bundle:nil] forCellReuseIdentifier:@"hospitalCell"];
    
}
- (void)didTapMore:(TestView *)testView{
    if (testView == _textView) {
        NSLog(@"点亮更多111");
    }else if (testView == _hospitalView){
        NSLog(@"点亮更多222");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    self.tableView.separatorInset = UIEdgeInsetsZero;
    
    HospitalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hospitalCell" forIndexPath:indexPath];
    cell.hospitalImageView.image = [UIImage imageNamed:@"女王"];
    cell.hospitalNameLabel.text = @"Dota妇幼保健院";
    cell.hospitalRankLabel.text = @"二十五级甲等";
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01f;
}


@end
