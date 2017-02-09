//
//  BMShowViewController.m
//  SFTestDemo
//
//  Created by 黄云高 on 2016/12/22.
//  Copyright © 2016年 SugarFree. All rights reserved.
//

#import "BMShowViewController.h"

//#import "JSShowEntity+CoreDataClass.h"

@interface BMShowViewController ()

@end

#define ScreenWidth [UIScreen mainScreen].bounds.size.width


@implementation BMShowViewController{
    UITextView *_textView;
    FMDatabase *_db;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setUpFmdb];
    [self setUpUi];
    
    // Do any additional setup after loading the view.
}
- (void)setUpFmdb{
    //创建  fmdb；
    NSString *doc=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *fileName=[doc stringByAppendingPathComponent:@"bmshow.sqlite"];
    _db=[FMDatabase databaseWithPath:fileName];
    
    [_db open];
    BOOL isSuccess = [_db executeUpdate:@"create table if not exists bmshow (show text)"];
    if (!isSuccess) {
        NSLog(@"创建失败: %@", [_db lastError]);
    }
    [_db close];

}

- (void)setUpUi{
    self.title = @"FMDB";
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor yellowColor];
    
    //add textView
    _textView = [[UITextView alloc]initWithFrame:CGRectMake(50, 200, ScreenWidth - 100, 200)];
    _textView.layer.shadowOpacity = 3;
    _textView.layer.shadowOffset = CGSizeMake(-3, 3);
    _textView.layer.masksToBounds = NO;
    _textView.layer.shadowColor = [UIColor redColor].CGColor;
    
    [self getTheText];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    [self.view addSubview:_textView];
    
    UIButton *deleteBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 100, ScreenWidth/2.0, 50)];
    UIButton *saveBtn = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth/2.0, 100, ScreenWidth/2.0, 50)];
    
    [deleteBtn setTitle:@"Delete" forState:UIControlStateNormal];
    [saveBtn setTitle:@"Save" forState:UIControlStateNormal];
    
    deleteBtn.backgroundColor = [UIColor grayColor];
    saveBtn.backgroundColor = [UIColor greenColor];
    
    [deleteBtn addTarget:self action:@selector(deleteTheText) forControlEvents:UIControlEventTouchUpInside];
    [saveBtn addTarget:self action:@selector(saveTheText) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:deleteBtn];
    [self.view addSubview:saveBtn];
    
}

- (void)backKeyboard{
    [_textView resignFirstResponder];
}
- (void)getTheText{
    [_db open];
    _textView.text = nil;
    FMResultSet *result = [_db executeQuery:@"select * from bmshow"];
    if ([result next]) {
        _textView.text = [result stringForColumn:@"show"];
    }
    [_db close];
}
- (void)deleteTheText{
    [_db open];
    BOOL isSuccess = [_db executeUpdate:@"delete from bmshow"];
    if (!isSuccess) {
        NSLog(@"删除失败: %@", [_db lastError]);
    }
    _textView.text = nil;
    [_db close];

}
- (void)saveTheText{
    
    [_db open];
    
    BOOL isSuccess = [_db executeUpdate:@"delete from bmshow"];
    if (!isSuccess) {
        NSLog(@"删除失败: %@", [_db lastError]);
        [_db close];
        
    }else{
        BOOL isSuccess2 = [_db executeUpdate:@"insert into bmshow (show) values (?)", _textView.text];
        if (!isSuccess2) {
            NSLog(@"保存失败: %@", [_db lastError]);
        }
        [_db close];
        
    }
    
    
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
