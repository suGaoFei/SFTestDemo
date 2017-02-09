//
//  HealthTableViewController.m
//  SFTestDemo
//
//  Created by 黄云高 on 2017/1/4.
//  Copyright © 2017年 SugarFree. All rights reserved.
//

#import "HealthTableViewController.h"
#import "HealthCollectionViewCell.h"
#import "HospitalTableViewCell.h"

@interface HealthTableViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation HealthTableViewController{
    UICollectionView * _headCollectionView;//头部collectionView
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpUi];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)setUpUi{
    self.title = @"健康";
    
    //headView
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 380)];//380写死，需要计算
    headView.backgroundColor = [UIColor colorFromHexRGB:@"f0f0f0"];
    
    //本地名医cell
    UIView *doctorCellView = [[UIView alloc]initWithFrame:CGRectMake(0, 10, ScreenWidth, 35)];
    doctorCellView.backgroundColor = [UIColor whiteColor];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 16 * 4 + 10, 16)];
    titleLabel.text = @"本地名医";
    titleLabel.textColor = [UIColor colorFromHexRGB:@"1a1a1a"];
    titleLabel.font = [UIFont systemFontOfSize:16];
    
    UILabel *moreLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, ScreenWidth - 10 - 10, 14)];//需要再减去“>”的宽度
    moreLabel.text = @"更多";
    moreLabel.textColor = [UIColor colorFromHexRGB:@"a7a7a7"];
    moreLabel.font = [UIFont systemFontOfSize:14];
    moreLabel.textAlignment = NSTextAlignmentRight;
    
//    UIImageView *rightImageView = [UIImageView alloc]initWithFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    
    //确实箭头图标
    [doctorCellView addSubview:titleLabel];
    [doctorCellView addSubview:moreLabel];
    
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    _headCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 45, ScreenWidth, 290) collectionViewLayout:flowLayout];
    _headCollectionView.backgroundColor = [UIColor whiteColor];
    
    _headCollectionView.delegate = self;
    _headCollectionView.dataSource = self;

    
    [_headCollectionView registerNib:[UINib nibWithNibName:(NSStringFromClass([HealthCollectionViewCell class])) bundle:nil] forCellWithReuseIdentifier:@"doctorCollectionCell"];

    //本地名医院
    UIView *hospitalView = [[UIView alloc]initWithFrame:CGRectMake(0, 380 - 35, ScreenWidth, 35)];
    hospitalView.backgroundColor = [UIColor whiteColor];
    
    UILabel *hospitalLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 16 * 4 + 10, 16)];
    hospitalLabel.text = @"本地名医";
    hospitalLabel.textColor = [UIColor colorFromHexRGB:@"1a1a1a"];
    hospitalLabel.font = [UIFont systemFontOfSize:16];
    
    UILabel *moreHospitalLabelLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, ScreenWidth - 10 - 10, 14)];//需要再减去“>”的宽度
    moreHospitalLabelLabel.text = @"更多";
    moreHospitalLabelLabel.textColor = [UIColor colorFromHexRGB:@"a7a7a7"];
    moreHospitalLabelLabel.font = [UIFont systemFontOfSize:14];
    moreHospitalLabelLabel.textAlignment = NSTextAlignmentRight;
    
    [hospitalView addSubview:hospitalLabel];
    [hospitalView addSubview:moreHospitalLabelLabel];
    
    //一条分割线
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 379, ScreenWidth, 1)];
    lineView.backgroundColor = [UIColor colorFromHexRGB:@"f0f0f0"];

    [headView addSubview:doctorCellView];
    [headView addSubview:_headCollectionView];
    [headView addSubview:hospitalView];
//    [headView addSubview:lineView];
    
    
    self.tableView.tableHeaderView = headView;
    
    
    //tableview xib register
    [self.tableView registerNib:[UINib nibWithNibName:(NSStringFromClass([HospitalTableViewCell class])) bundle:nil] forCellReuseIdentifier:@"hospitalCell"];
    
    
    
}
#pragma mark _headCollectionView delegate and datasource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HealthCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"doctorCollectionCell" forIndexPath:indexPath];
    cell.nameLabel.text = @"老司机";
    cell.rankLabel.text = @"国宝级 驾驶员";
    cell.headImageView.image = [UIImage imageNamed:@"黑鸟"];
    
    return cell;
}


//点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了老司机，黑鸟");
    
}

//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(ScreenWidth/3.0,145);
}
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
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
    return 5;
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
    return 110.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1.f;
}


@end
