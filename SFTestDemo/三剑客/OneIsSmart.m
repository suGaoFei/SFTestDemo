//
//  OneIsSmart.m
//  SFTestDemo
//
//  Created by 黄云高 on 2016/12/22.
//  Copyright © 2016年 SugarFree. All rights reserved.
//

#import "OneIsSmart.h"

@interface OneIsSmart ()<iCarouselDelegate, iCarouselDataSource, SDCycleScrollViewDelegate>

@property (nonatomic, strong)SDCycleScrollView *niceView;
@property (nonatomic, strong)iCarousel *icarousel;

@property (nonatomic, strong)UIView *headerView;
@property (nonatomic, strong)UIPageControl *pageControl;
@property (nonatomic, strong)NSTimer *timer;
@property (nonatomic, strong)NSArray *photoArray;

@property (nonatomic, strong)UIView *pigView;  //猪猪侠  悬停效果

@end
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

@implementation OneIsSmart

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpHeadView];
    
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self addTimer];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self removeTimer];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark View
- (void)setUpHeadView{
    [self.icarousel addSubview:self.pageControl];
    
    [self.headerView addSubview:self.icarousel];
    
    [self.headerView addSubview:self.niceView];
    
    self.tableView.tableHeaderView = self.headerView;

    [self.view addSubview:self.pigView];

    
}


//TODO:iCarousel Data Source

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return 5;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (view == nil) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 0, ScreenWidth - 60 - 20, ScreenWidth / 1.6 - 20)];
        view = imageView;
    }
    
    UIImageView *bannerView=(UIImageView *)view;
    
    bannerView.contentMode=UIViewContentModeScaleAspectFill;
    bannerView.layer.cornerRadius=0;
    bannerView.layer.masksToBounds=YES;
    
    bannerView.image = [UIImage imageNamed:self.photoArray[index]];
    
    return view;
    
}

- (void)carouselDidScroll:(iCarousel *)carousel{
    _pageControl.currentPage = carousel.currentItemIndex;
}
- (void)carouselWillBeginDragging:(iCarousel *)carousel{
    [self removeTimer];
}
- (void)carouselDidEndDragging:(iCarousel *)carousel
                willDecelerate:(BOOL)decelerate{
    //    开启定时器
    [self addTimer];
}
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap)
    {
        return YES;
    }
    return value;
}

- (void)addTimer{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                      target:self
                                                    selector:@selector(nextImage)
                                                    userInfo:nil
                                                     repeats:YES];
        //添加到runloop中
        [[NSRunLoop mainRunLoop]addTimer:_timer
                                 forMode:NSRunLoopCommonModes];
    }
}
- (void)removeTimer{
    if ([_timer isValid]) {
        [_timer invalidate];
        _timer = nil;
    }
}

- (void)nextImage{
    
    NSInteger index = _icarousel.currentItemIndex + 1;
    if (index > self.photoArray.count) {
        index = 0;
    }
    
    [_icarousel scrollToItemAtIndex:index
                              animated:YES];
}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01f;
}

#pragma mark Lazy Loading
- (UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 2*ScreenWidth/1.6 + 10)];
    }
    return _headerView;
}
- (SDCycleScrollView *)niceView{
    if (!_niceView) {
        _niceView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
        _niceView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
        _niceView.currentPageDotImage = [UIImage imageNamed:@"ic_point_selected"];
        _niceView.pageDotImage = [UIImage imageNamed:@"ic_point_normal"];
        _niceView.frame = CGRectMake(0, ScreenWidth/1.6 + 10, ScreenWidth, ScreenWidth/1.6);
        _niceView.localizationImageNamesGroup = [self.photoArray subarrayWithRange:NSMakeRange(2, 3)];
    }
    return _niceView;
}
- (iCarousel *)icarousel{
    if (!_icarousel) {
        _icarousel = [[iCarousel alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenWidth/1.6)];
        _icarousel.backgroundColor = [UIColor colorFromHexRGB:@"4495ea"];
        _icarousel.type = iCarouselTypeRotary;
        _icarousel.pagingEnabled = YES;
        _icarousel.delegate = self;
        _icarousel.dataSource = self;
        _icarousel.scrollEnabled = YES;
    }
    return _icarousel;
}
- (UIPageControl *)pageControl{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc]init];
        _pageControl.currentPageIndicatorTintColor = [UIColor yellowColor];
        _pageControl.center = CGPointMake(ScreenWidth/2.0, ScreenWidth/1.6 - 10);
        _pageControl.numberOfPages = 5;
    }
    return _pageControl;
}
- (NSArray *)photoArray{
    if (!_photoArray) {
        _photoArray = @[@"黑鸟", @"女王", @"BM", @"PA", @"SV"];
    }
    return _photoArray;
}
- (UIView *)pigView{
    if (!_pigView) {
        _pigView = [[UIView alloc]initWithFrame:CGRectMake(100, 200, 50, 50)];
        _pigView.backgroundColor = [UIColor redColor];
        UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(keepMove:)];
        [_pigView addGestureRecognizer:panGR];
    }
    return _pigView;
}
- (void)keepMove:(UIPanGestureRecognizer *)recognizer{
    CGPoint translation = [recognizer translationInView:self.view];
    CGPoint newCenter = CGPointMake(recognizer.view.center.x+ translation.x,
                                    recognizer.view.center.y + translation.y);
    //    限制屏幕范围：
    newCenter.y = MAX(recognizer.view.frame.size.height/2, newCenter.y);
    newCenter.y = MIN(self.view.frame.size.height - recognizer.view.frame.size.height/2 - 50 - 64, newCenter.y);
    newCenter.x = MAX(recognizer.view.frame.size.width/2, newCenter.x);
    newCenter.x = MIN(self.view.frame.size.width - recognizer.view.frame.size.width/2,newCenter.x);
    recognizer.view.center = newCenter;
    [recognizer setTranslation:CGPointZero inView:self.view];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

//    CGRect rect = _pigView.frame;
//    rect = CGRectMake(_pigView.frame.origin.x, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
//    if (scrollView.contentOffset.y > -64) {
//        _pigView.frame = CGRectMake(_pigView.frame.origin.x, _pigView.frame.origin.y + scrollView.contentOffset.y + 64, _pigView.frame.size.width, _pigView.frame.size.height);
//    }
    
}
@end
