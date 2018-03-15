//
//  GFButton.m
//  SFTestDemo
//
//  Created by 黄云高 on 2018/3/7.
//  Copyright © 2018年 SugarFree. All rights reserved.
//

#import "GFButton.h"

@implementation GFButton

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUi];
    }
    return self;
}
- (void)setUpUi{
    self.backgroundColor = [UIColor whiteColor];
    self.layer.borderWidth = 1.f;
    self.layer.borderColor = [UIColor yellowColor].CGColor;
    self.layer.cornerRadius = self.height/2;
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.titleLabel setFont:[UIFont systemFontOfSize:16.f]];
    [self addTarget:self action:@selector(clickTheGFBtn) forControlEvents:UIControlEventTouchUpInside];
}
- (CGSize)sizeThatFits:(CGSize)size{
    CGFloat totalWidth = 0;
    totalWidth += [self.titleLabel sizeThatFits:size].width;
    totalWidth += 20;
    return CGSizeMake(totalWidth, size.height);
}
- (void)clickTheGFBtn{
    if (self.GFDelegate && [self.GFDelegate respondsToSelector:@selector(clickTheGFButton)]) {
        [self.GFDelegate clickTheGFButton];
    }
}

@end
