//
//  ThreeIsKind.m
//  SFTestDemo
//
//  Created by 黄云高 on 2016/12/22.
//  Copyright © 2016年 SugarFree. All rights reserved.
//

#import "ThreeIsKind.h"
#import "BMShowViewController.h"
#import "RTimeViewController.h"
#import "PhotoWebViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "WMViedoAlterView.h"

@interface ThreeIsKind ()
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;

@end

@implementation ThreeIsKind

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //tableviewcell分割线到头
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.title = @"";
    
    self.tableView.showsVerticalScrollIndicator = NO;
    
    //毛玻璃效果
//    UIVisualEffectView *visualEffect = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight]];
//    visualEffect.frame = CGRectMake(0, 0, SCREEN_WIDTH, 40);
//    visualEffect.alpha = 0.5;
//    [self.view addSubview:visualEffect];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jumpFMDB) name:@"3DtouchOne" object:nil];
    
    if ([ShareData shareInstrance].ThreeDTouchModel.is3DTouch) {
        //修改单例
        ThreeDTouchModel * threeDtouch = [[ThreeDTouchModel alloc]init];
        threeDtouch.is3DTouch = NO;
        threeDtouch.goWhere = @"nothing";
        threeDtouch.goindex = 0;
        threeDtouch.threeDCount = 0;
        [ShareData shareInstrance].ThreeDTouchModel = threeDtouch;
        
        BMShowViewController *nextVc = [[BMShowViewController alloc]init];
        nextVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController showViewController:nextVc sender:nil];
    }
    
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    } else {
        // Fallback on earlier versions
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}
- (void)jumpFMDB{
    BMShowViewController *nextVc = [[BMShowViewController alloc]init];
    nextVc.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController showViewController:nextVc sender:nil];
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
//    return UIStatusBarStyleDefault;
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    //GrowingIO测试
    [Growing setCS1Value:@"100324" forKey:@"user_id"];
    [Growing setCS2Value:@"943123" forKey:@"company_id"];
    [Growing setCS3Value:@"王同学" forKey:@"user_name"];
    [Growing setCS4Value:@"GrowingIO" forKey:@"company_name"];
    [Growing setCS5Value:@"销售员小王" forKey:@"sales_name"];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.navigationController.navigationBar lt_reset];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        

        NSString *data = @"https://www.baidu.com/你好，北京！";
        
        //转换成UTF-8
        NSString *dataUTF8 = [data stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        NSLog(@"%@",dataUTF8);
        
        //转换成中文
        NSString *dataGBK = [dataUTF8 stringByRemovingPercentEncoding];
        NSLog(@"%@",dataGBK);
    }
    
    if (indexPath.section == 0 && indexPath.row == 1) {
        WMViedoAlterView *alterView = [[WMViedoAlterView alloc]initWithTitle:@"你确定要退出吗" message:nil sureBtn:@"确定" cancleBtn:@"取消"];
        alterView.resultIndex = ^(NSInteger index){
            if (index == 0) {
                NSLog(@"哈哈哈");
            }else if (index == 1) {
                NSLog(@"嘿嘿嘿");
            }
        };
        [alterView showXLAlertView];
    }
    
    
    if (indexPath.section == 0 && indexPath.row == 2) {
        UIAlertController *alterController = [UIAlertController alertControllerWithTitle:@"警告" message:@"CNDota，BestDota！" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *actionOne = [UIAlertAction actionWithTitle:@"Agree" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {

        }];
        UIAlertAction *actionTwo = [UIAlertAction actionWithTitle:@"DisAgree" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alterController addAction:actionOne];
        [alterController addAction:actionTwo];
        
        [self presentViewController:alterController animated:YES completion:nil];
    }
    
    if (indexPath.section == 1 && indexPath.row == 0) {
        BMShowViewController *nextVc = [[BMShowViewController alloc]init];
        nextVc.hidesBottomBarWhenPushed = YES;

        [self.navigationController showViewController:nextVc sender:nil];
    }
    
    if (indexPath.section == 1 && indexPath.row == 1) {
        RTimeViewController *nextVC = [[RTimeViewController alloc]init];
        nextVC.hidesBottomBarWhenPushed = YES;
        
        [self.navigationController showViewController:nextVC sender:nil];
    }
    
    if (indexPath.section == 1 && indexPath.row == 2) {
        PhotoWebViewController *nextVC = [[PhotoWebViewController alloc]init];
        nextVC.UrlString = @"https://www.baidu.com/";
        nextVC.hidesBottomBarWhenPushed = YES;
        
        [self.navigationController showViewController:nextVC sender:nil];
    }
    
    if (indexPath.section == 2 && indexPath.row == 0) {
        NSLog(@"播放语音");
//        AVSpeechSynthesizer
    }
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
