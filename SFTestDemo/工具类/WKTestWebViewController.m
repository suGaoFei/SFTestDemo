//
//  WKTestWebViewController.m
//  SFTestDemo
//
//  Created by 黄云高 on 2018/3/19.
//  Copyright © 2018年 SugarFree. All rights reserved.
//

#import "WKTestWebViewController.h"

@interface WKTestWebViewController ()<GFWKWebViewDelegate>

@end

@implementation WKTestWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTestWK];
}
- (void)setTestWK{
    self.wkWebDelegate = self;
}
#pragma mark GFWKWebView UIDelegate

- (void)GF_webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    NSLog(@"%ld", (long)navigationAction.navigationType);
//    decisionHandler(WKNavigationActionPolicyAllow);
}
//- (void)GF_webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
//
//}
//- (void)GF_webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
//    decisionHandler(WKNavigationResponsePolicyAllow);
//}
//- (WKWebView *)GF_webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures{
//    
//}

- (void)dealloc{
    //父类还是会走。
    NSLog(@"哈哈哈");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
