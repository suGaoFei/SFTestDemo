//
//  HospitalTableViewCell.h
//  SFTestDemo
//
//  Created by 黄云高 on 2017/1/4.
//  Copyright © 2017年 SugarFree. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HospitalTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *hospitalImageView;
@property (weak, nonatomic) IBOutlet UILabel *hospitalNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *hospitalRankLabel;
@end
