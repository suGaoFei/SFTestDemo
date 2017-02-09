//
//  HealthCollectionViewCell.m
//  SFTestDemo
//
//  Created by 黄云高 on 2017/1/4.
//  Copyright © 2017年 SugarFree. All rights reserved.
//

#import "HealthCollectionViewCell.h"

@implementation HealthCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.headImageView.layer.cornerRadius = 30;
    self.headImageView.layer.borderWidth = 5;
    self.headImageView.layer.borderColor = [UIColor yellowColor].CGColor;
    self.headImageView.layer.masksToBounds = YES;
    
}

@end
