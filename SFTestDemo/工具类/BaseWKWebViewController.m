//
//  BaseWKWebViewController.m
//  SFTestDemo
//
//  Created by 黄云高 on 2018/3/19.
//  Copyright © 2018年 SugarFree. All rights reserved.
//

#import "BaseWKWebViewController.h"

@interface BaseWKWebViewController ()<WKUIDelegate, WKNavigationDelegate>

@end

@implementation BaseWKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBaseWK];
}
- (void)setBaseWK{
    if (!self.wkConfiguration) {
        self.wkConfiguration = [[WKWebViewConfiguration alloc]init];
        //设置一些属性
    }
    self.wkWebView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) configuration:self.wkConfiguration];
    self.wkWebView.UIDelegate = self;
    self.wkWebView.navigationDelegate = self;
    self.wkWebView.allowsBackForwardNavigationGestures = YES;
    [self.view addSubview:self.wkWebView];
//    if (self.urlString) {
//        <#statements#>
//    }
    [self.wkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlString]]];
    [self.wkWebView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:NULL];
}
- (void)backButtonAction:(UIBarButtonItem *)item{
    if ([self.wkWebView canGoBack]) {
        [self.wkWebView goBack];
    }else {
        [self.navigationController popViewControllerAnimated:YES];
    }
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
#pragma mark wkWebView UIDelegate
- (WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures{
    if (self.wkWebDelegate && [self.wkWebDelegate respondsToSelector:@selector(GF_webView:createWebViewWithConfiguration:forNavigationAction:windowFeatures:)]) {
        [self.wkWebDelegate GF_webView:webView createWebViewWithConfiguration:configuration forNavigationAction:navigationAction windowFeatures:windowFeatures];
    }
    
    
    if (!navigationAction.targetFrame.isMainFrame) {
        [webView loadRequest:navigationAction.request];
    }
    return nil;
}
#pragma mark wkWebView NavigationDeleagte
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    if (self.wkWebDelegate && [self.wkWebDelegate respondsToSelector:@selector(GF_webView:didFinishNavigation:)]) {
        [self.wkWebDelegate GF_webView:webView didFinishNavigation:navigation];
    }
}
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    if (navigationAction.navigationType == WKNavigationTypeBackForward) {
        [self addCloseItemAction];
    }
    decisionHandler(WKNavigationActionPolicyAllow);
    
    
    if (self.wkWebDelegate && [self.wkWebDelegate respondsToSelector:(@selector(GF_webView:decidePolicyForNavigationAction:decisionHandler:))]) {
        [self.wkWebDelegate GF_webView:webView decidePolicyForNavigationAction:navigationAction decisionHandler:decisionHandler];
    }
}
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    decisionHandler(WKNavigationResponsePolicyAllow);
    if (self.wkWebDelegate && [self.wkWebDelegate respondsToSelector:@selector(GF_webView:decidePolicyForNavigationResponse:decisionHandler:)]) {
        [self.wkWebDelegate GF_webView:webView decidePolicyForNavigationResponse:navigationResponse decisionHandler:decisionHandler];
    }
}
#pragma mark KVO Delegate
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"title"]) {
        if (object == self.wkWebView) {
            self.title = self.wkWebView.title;
        }else {
            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
    }else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}
- (void)dealloc{
    [self.wkWebView removeObserver:self forKeyPath:@"title"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
