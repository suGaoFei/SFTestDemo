//
//  TestView.m
//  SFTestDemo
//
//  Created by 黄云高 on 2017/1/4.
//  Copyright © 2017年 SugarFree. All rights reserved.
//

#import "TestView.h"

#import "HealthCollectionViewCell.h"
#import "ServiceCollectionViewCell.h"

@interface TestView ()<UICollectionViewDelegate, UICollectionViewDataSource>
{
    NSArray *_array;
}
@end
@implementation TestView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor purpleColor];
        
        //titleView
        UIView *titleVeiw = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 35)];
        titleVeiw.backgroundColor = [UIColor whiteColor];
        
        
        //rightTapView  
        _rightTapView = [[UIView alloc]initWithFrame:CGRectMake(ScreenWidth - 63, 0, 63, 35)];
        _rightTapView.backgroundColor = [UIColor whiteColor];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapMore)];
        _rightTapView.userInteractionEnabled = YES;
        [_rightTapView addGestureRecognizer:tap];
        
        
        //leftLabel
        _leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 150, 16)];
        _leftLabel.textColor = [UIColor colorFromHexRGB:@"1a1a1a"];
        _leftLabel.font = [UIFont systemFontOfSize:16];
        _leftLabel.textAlignment = NSTextAlignmentLeft;

        //rightLabel
        _rigthLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, ScreenWidth - 20 - 15, 14)];//差个图
        _rigthLabel.textColor = [UIColor colorFromHexRGB:@"a7a7a7"];
        _rigthLabel.font = [UIFont systemFontOfSize:14];
        _rigthLabel.textAlignment = NSTextAlignmentRight;
        
        //imageView
        _rightArrowImageView = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth - 25, 10, 15, 15)];
        
        
        [titleVeiw addSubview:_rightTapView];
        [titleVeiw addSubview:_leftLabel];
        [titleVeiw addSubview:_rigthLabel];
        [titleVeiw addSubview:_rightArrowImageView];
        
        
        
        
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.minimumLineSpacing = 0;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        
        _showCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _showCollectionView.backgroundColor = [UIColor whiteColor];
        
        
        [_showCollectionView registerNib:[UINib nibWithNibName:(NSStringFromClass([HealthCollectionViewCell class])) bundle:nil] forCellWithReuseIdentifier:@"doctorCollectionCell"];
        [_showCollectionView registerNib:[UINib nibWithNibName:(NSStringFromClass([ServiceCollectionViewCell class])) bundle:nil] forCellWithReuseIdentifier:@"serviceCollectionCell"];
        
        [self addSubview:_showCollectionView];
        
        
        
        [self addSubview:titleVeiw];
        
        
    }
    return self;
}

//实现代理
- (void)tapMore{
    if (_clickMoreDelegate && [_clickMoreDelegate respondsToSelector:@selector(didTapMore:)]) {
        [self.clickMoreDelegate didTapMore:self];
    }
}


- (void)setValueWithModelArray:(NSArray *)modelArray{
    
    _viewHeight = (modelArray.count/3 + (modelArray.count%3?1:0))*145 + 35;
    _array = modelArray;
    _showCollectionView.frame = CGRectMake(0, 35, ScreenWidth, _viewHeight-35);
    _showCollectionView.delegate = self;
    _showCollectionView.dataSource = self;
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _array.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (_flag == 1) {
        HealthCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"doctorCollectionCell" forIndexPath:indexPath];
        cell.nameLabel.text = @"老司机";
        cell.rankLabel.text = @"国宝级 驾驶员";
        cell.headImageView.image = [UIImage imageNamed:@"黑鸟"];
        
        return cell;
    }else if (_flag == 2) {
        
    }
    
    return nil;
}


//点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了老司机，黑鸟");

//    Model *model = array[indexPath.row];
//    if (_delegate&&[_delegate respondsToSelector:@selector(didTapWeatherBar:)]) {
//        [self.delegate didTapWeatherBar:model];
//    }
    
}

//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(ScreenWidth/3.0,145);
}
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
