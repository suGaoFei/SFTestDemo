//
//  BaseWKWebViewController.h
//  SFTestDemo
//
//  Created by 黄云高 on 2018/3/19.
//  Copyright © 2018年 SugarFree. All rights reserved.
//

#import "BaseViewController.h"

@protocol GFWKWebViewDelegate;

@interface BaseWKWebViewController : BaseViewController

/**
 *@briefwkWebview
 */
@property (nonatomic, strong) WKWebView                 *wkWebView;

/**
 *@briefwkConfiguration配置
 */
@property (nonatomic, strong) WKWebViewConfiguration    *wkConfiguration;

/**
 *@briefwebUrl
 */
@property (nonatomic, copy) NSString                    *urlString;

/**
 *@briefGFwkWebDelegate
 */
@property (nonatomic, weak) id<GFWKWebViewDelegate>     wkWebDelegate;


@end

@protocol GFWKWebViewDelegate <NSObject>
@optional
//wkUIDelegate
- (WKWebView *)GF_webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures;
//wkNavigationDelegate
- (void)GF_webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation;
- (void)GF_webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler;
- (void)GF_webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler;
@end
