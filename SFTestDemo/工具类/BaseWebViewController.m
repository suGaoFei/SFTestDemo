//
//  BaseWebViewController.m
//  SFTestDemo
//
//  Created by 黄云高 on 2017/7/28.
//  Copyright © 2017年 SugarFree. All rights reserved.
//

#import "BaseWebViewController.h"


@interface BaseWebViewController ()<UIWebViewDelegate>{
    UIWebView *_mainWebView;
    
}

@end

@implementation BaseWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUi];

}
- (void)setUpUi{
    _mainWebView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_mainWebView];
    _mainWebView.delegate = self;
    NSMutableURLRequest *mutableRequest = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:self.UrlString]];
    [_mainWebView loadRequest:mutableRequest];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jumpNextUrl:) name:@"SchemesCallBack" object:nil];
}
- (void)jumpNextUrl: (NSNotification *)note{
    NSDictionary *dic = [note userInfo];
    NSURL *url = [NSURL URLWithString:dic[@"url"]];
    [_mainWebView loadRequest:[NSURLRequest requestWithURL:url]];
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
#pragma mark WebView Deleagte
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    self.title = [_mainWebView stringByEvaluatingJavaScriptFromString:@"document.title"];
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    if (navigationType==UIWebViewNavigationTypeBackForward) {
        
        [self addCloseItemAction];
    }
    
    return YES;
}
- (BOOL)navigationShouldPopOnBackButton{
    if ([_mainWebView canGoBack]) {
        [_mainWebView goBack];

        return NO;
    }else {
        [self.navigationController popViewControllerAnimated:YES];
    }
    return YES;
    
}

- (void)addCloseItemAction{
    if (self.navigationItem.leftBarButtonItems.count<2) {
        
        UIButton* closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [closeButton setImage:[UIImage imageNamed:@"title_new_close"] forState:UIControlStateNormal];
        closeButton.frame = CGRectMake(0, 0, 30, 30);
        [closeButton addTarget:self action:@selector(closeWeb) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem* closeBarItem = [[UIBarButtonItem alloc] initWithCustomView:closeButton];
        
        self.navigationItem.leftBarButtonItems = @[self.navigationItem.leftBarButtonItem,closeBarItem];
    }
}
- (void)closeWeb{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
