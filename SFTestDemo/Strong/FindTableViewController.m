//
//  FindTableViewController.m
//  SFTestDemo
//
//  Created by 黄云高 on 2016/12/30.
//  Copyright © 2016年 SugarFree. All rights reserved.
//

#import "FindTableViewController.h"

@interface FindTableViewController ()

@end

@implementation FindTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpUi];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)setUpUi{
    self.title = @"headView_版";
    
    self.tableView.backgroundColor = [UIColor colorFromHexRGB:@"f0f0f0"];
    self.tableView.separatorInset = UIEdgeInsetsZero;
    
    [self setHeadView];
    
}
- (void)setHeadView{
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 500)];//500需要计算
    
    //头一
    UIView *titleOneView = [[UIView alloc]initWithFrame:CGRectMake(0, 10, ScreenWidth, 30)];
    titleOneView.backgroundColor = [UIColor whiteColor];
    UILabel *labelOne = [[UILabel alloc]initWithFrame:CGRectMake(15, (30 - 14)/2.0, ScreenWidth - 15, 14)];
    labelOne.textColor = [UIColor colorFromHexRGB:@"1a1a1a"];
    labelOne.text = @"健康知识库";
    labelOne.font = [UIFont systemFontOfSize:14];
    [titleOneView addSubview:labelOne];
    
    [headView addSubview:titleOneView];
    
    //模块一
    UIView *moduleOneView = [[UIView alloc]initWithFrame:CGRectMake(0, 40, ScreenWidth, 80)];//整体布局动态的话需要算，固定大写80也需要算
    UIView *oneOneView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth/3.0, 80)];
    oneOneView.backgroundColor = [UIColor redColor];
    UIView *oneTwoView = [[UIView alloc]initWithFrame:CGRectMake(ScreenWidth/3.0, 0, ScreenWidth/3.0, 80)];
    oneTwoView.backgroundColor = [UIColor blackColor];
    UIView *oneThreeView = [[UIView alloc]initWithFrame:CGRectMake(ScreenWidth*2/3.0, 0, ScreenWidth/3.0, 80)];
    oneThreeView.backgroundColor = [UIColor blueColor];
    [moduleOneView addSubview:oneOneView];
    [moduleOneView addSubview:oneTwoView];
    [moduleOneView addSubview:oneThreeView];
    
    [headView addSubview:moduleOneView];
    
    //头二
    UIView *titleTwoView = [[UIView alloc]initWithFrame:CGRectMake(0, 130, ScreenWidth, 30)];
    titleTwoView.backgroundColor = [UIColor whiteColor];
    UILabel *labelTwo = [[UILabel alloc]initWithFrame:CGRectMake(15, (30 - 14)/2.0, ScreenWidth - 15, 14)];
    labelTwo.textColor = [UIColor colorFromHexRGB:@"1a1a1a"];
    labelTwo.text = @"小工具";
    labelTwo.font = [UIFont systemFontOfSize:14];
    [titleTwoView addSubview:labelTwo];
    
    [headView addSubview:titleTwoView];
    
    
    //模块二
    UIView *moduleTwoView = [[UIView alloc]initWithFrame:CGRectMake(0, 160, ScreenWidth, 80)];
    moduleTwoView.backgroundColor = [UIColor whiteColor];
    UIView *twoOneView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth/3.0, 80)];
    twoOneView.backgroundColor = [UIColor redColor];
    UIView *twoTwoView = [[UIView alloc]initWithFrame:CGRectMake(ScreenWidth/3.0, 0, ScreenWidth/3.0, 80)];
    twoTwoView.backgroundColor = [UIColor blackColor];
    [moduleTwoView addSubview:twoOneView];
    [moduleTwoView addSubview:twoTwoView];
    
    [headView addSubview:moduleTwoView];
    
    //头三
    UIView *titleThreeView = [[UIView alloc]initWithFrame:CGRectMake(0, 250, ScreenWidth, 30)];
    titleThreeView.backgroundColor = [UIColor whiteColor];
    UILabel *labelThree = [[UILabel alloc]initWithFrame:CGRectMake(15, (30 - 14)/2.0, ScreenWidth - 15, 14)];
    labelThree.textColor = [UIColor colorFromHexRGB:@"1a1a1a"];
    labelThree.text = @"增值服务";
    labelThree.font = [UIFont systemFontOfSize:14];
    [titleThreeView addSubview:labelThree];
    [headView addSubview:titleThreeView];
    
    //模块三
    UIView *moduleThreeView = [[UIView alloc]initWithFrame:CGRectMake(0, 280, ScreenWidth, 80)];
    moduleThreeView.backgroundColor = [UIColor whiteColor];
    UIView *threeOneView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth/3.0, 80)];
    threeOneView.backgroundColor = [UIColor redColor];
    [moduleThreeView addSubview:threeOneView];
    [headView addSubview:moduleThreeView];
    
    
    
    
    
    
    
    
    self.tableView.tableHeaderView = headView;
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
    return 10;
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
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01f;
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
