//
//  GFButton.h
//  SFTestDemo
//
//  Created by 黄云高 on 2018/3/7.
//  Copyright © 2018年 SugarFree. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GFButtonDelegate<NSObject>
- (void)clickTheGFButton;
@end

@interface GFButton : UIButton
@property (nonatomic, weak) id<GFButtonDelegate> GFDelegate;
@end
