//
//  TestView.h
//  SFTestDemo
//
//  Created by 黄云高 on 2017/1/4.
//  Copyright © 2017年 SugarFree. All rights reserved.
//

#import <UIKit/UIKit.h>


//@protocol WeatherBarDelegate <NSObject>
//
//@required
//- (void)didTapWeatherBar:(xxModel *)model;
//
//@end

@class TestView;

@protocol ClickMoreDelegate <NSObject>

//@required
- (void)didTapMore:(TestView *)testView;

@end

@interface TestView : UIView

@property (nonatomic, strong) UILabel *rigthLabel;

@property (nonatomic, strong) UILabel *leftLabel;

@property (nonatomic, strong) UIImageView *rightArrowImageView;

@property (nonatomic, strong) UIView *rightTapView;

@property (nonatomic, copy) UICollectionView *showCollectionView;

@property (nonatomic, assign) NSInteger showHeight;

@property (nonatomic, assign) NSInteger flag;//暂时：1是医生xib   2是服务xib

@property (nonatomic, assign) CGFloat viewHeight;


//@property (nonatomic, weak) id<WeatherBarDelegate> delegate;

@property (nonatomic,weak)id<ClickMoreDelegate>clickMoreDelegate;

- (void)setValueWithModelArray:(NSArray *)modelArray;


@end
