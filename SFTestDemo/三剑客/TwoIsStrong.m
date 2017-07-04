//
//  TwoIsStrong.m
//  SFTestDemo
//
//  Created by 黄云高 on 2016/12/22.
//  Copyright © 2016年 SugarFree. All rights reserved.
//

#import "TwoIsStrong.h"

#import "TitleTableViewCell.h"

#import "FindViewController.h"
#import "FindTableViewController.h"
#import "HealthTableViewController.h"

#import "TestTableViewController.h"

@interface TwoIsStrong ()

@end
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

@implementation TwoIsStrong

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self registerXib];
    
    [self setUpHeadView];
    
    [self setBarItem];
    
    //3Dtouch 进入
    if ([ShareData shareInstrance].ThreeDTouchModel.is3DTouch) {
        //修改单例
        ThreeDTouchModel * threeDtouch = [[ThreeDTouchModel alloc]init];
        threeDtouch.is3DTouch = NO;
        threeDtouch.goWhere = @"nothing";
        threeDtouch.goindex = 0;
        threeDtouch.threeDCount = 0;
        [ShareData shareInstrance].ThreeDTouchModel = threeDtouch;
        
        FindViewController *nextVC = [[FindViewController alloc]init];
        nextVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController showViewController:nextVC sender:nil];
    }
}
- (void)setBarItem{
    NSString *title = NSLocalizedString(@"某改", nil);
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(nextView)];
    self.navigationItem.rightBarButtonItem = right;
    
    UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithTitle:@"loser" style:UIBarButtonItemStyleDone target:self action:@selector(nextTableView)];
    self.navigationItem.leftBarButtonItem = left;
}
- (void)nextTableView{
    FindTableViewController *nextVC = [[FindTableViewController alloc]init];
    nextVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController showViewController:nextVC sender:nil];
}
- (void)nextView{
    FindViewController *nextVC = [[FindViewController alloc]init];
    nextVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController showViewController:nextVC sender:nil];
    
}
- (void)registerXib{
    [self.tableView registerNib:[UINib nibWithNibName:(NSStringFromClass([TitleTableViewCell class])) bundle:nil] forCellReuseIdentifier:@"titleCell"];
    
                                                       
}
- (void)setUpHeadView{
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 100)];
    headView.backgroundColor = [UIColor grayColor];
//    self.tableView.tableHeaderView = headView;
    
    self.tableView.backgroundColor = [UIColor colorFromHexRGB:@"f0f0f0"];
    
    self.tableView.separatorInset = UIEdgeInsetsZero;
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 8;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section != 7) {
        return 1;
    }
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    if (indexPath.section == 0 || indexPath.section == 2 || indexPath.section == 4 || indexPath.section == 6) {
        TitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"titleCell"];
        if (indexPath.section == 0) {
            cell.titleLabel.text = @"健康知识库";
        }else if (indexPath.section == 2){
            cell.titleLabel.text = @"小工具";
        }else if (indexPath.section == 2){
            cell.titleLabel.text = @"增值服务";
        }else{
            cell.titleLabel.text = @"热门服务";
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.section == 1 || indexPath.section == 3 || indexPath.section == 5){
        static NSString *cellIdentifier = @"bigIdentifier";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        if (indexPath.section == 1) {
            //addViewOne
        }else if (indexPath.section == 3){
            //addViewTwo
        }else{
            //addVoewThree
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        static NSString *cellIdentifier = @"identifier";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        if (indexPath.row == 0) {
            cell.textLabel.text = @"健康";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else if (indexPath.row == 1) {
            cell.textLabel.text = @"就医";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else if (indexPath.row == 0) {
            cell.textLabel.text = @"发现";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        
        
        return cell;
    }
    
    

    
    
    
//    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 7 && indexPath.row == 0) {
        //跳转3.10.0健康首页
        HealthTableViewController *nextVC = [[HealthTableViewController alloc]init];
        nextVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController showViewController:nextVC sender:nil];
    }
    
    if (indexPath.section == 7 && indexPath.row == 1) {
        //测试 封装
        TestTableViewController *nextVC = [[TestTableViewController alloc]init];
        nextVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController showViewController:nextVC sender:nil];
    }
    
    if (indexPath.section == 7 && indexPath.row == 2) {
        //测试 封装
        TestTableViewController *nextVC = [[TestTableViewController alloc]init];
        nextVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController showViewController:nextVC sender:nil];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.50f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 || indexPath.section == 2 || indexPath.section == 4 || indexPath.section == 6) {
        return 44;
    }else if (indexPath.section == 1 || indexPath.section == 3 || indexPath.section == 5){
        return 100;
    }else{
        return 100;
    }
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
