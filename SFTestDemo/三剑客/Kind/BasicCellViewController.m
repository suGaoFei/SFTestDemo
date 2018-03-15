//
//  BasicCellViewController.m
//  SFTestDemo
//
//  Created by 黄云高 on 2018/3/5.
//  Copyright © 2018年 SugarFree. All rights reserved.
//

#import "BasicCellViewController.h"

@interface BasicCellViewController ()

@end

@implementation BasicCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpUi];
    [self testCopy];
}
- (void)setUpUi{
    self.title = @"知识点";
}
- (void)testCopy{
    NSString *valueOne = @"Hello World";
    NSString *valueTwo = [valueOne copy];
    NSString *valueThree = [valueOne mutableCopy];
    NSLog(@"one: %@---%p, two: %@---%p, three: %@---%p", valueOne, valueOne, valueTwo, valueTwo, valueThree, valueThree);
    valueOne = nil;
    NSLog(@"one: %@---%p, two: %@---%p, three: %@---%p", valueOne, valueOne, valueTwo, valueTwo, valueThree, valueThree);
//    [valueOne relse]
    
    NSArray *array                   = @[@"a", @"b", @"c"];
    NSArray *arrayCopy               = [array copy];
    NSMutableArray *mutableArrayCopy = [array mutableCopy];
    NSLog(@"array: %@---%p, arrayCopy: %@---%p, mutableArratCopy: %@---%p", array, array, arrayCopy, arrayCopy, mutableArrayCopy, mutableArrayCopy);
    [mutableArrayCopy addObject:@"d"];
    NSLog(@"mutableArrayCopy: %@---%p", mutableArrayCopy, mutableArrayCopy);
    
    
    NSMutableArray *mutableArrayTwo = [[NSMutableArray alloc]initWithObjects:@"1", @"2", @"3", nil];
    [mutableArrayTwo addObject:@"4"];
    NSLog(@"%@", mutableArrayTwo);
    NSMutableArray *mutableArrayThree =  [mutableArrayTwo copy];
    NSLog(@"%@---%@", mutableArrayTwo, [mutableArrayThree class]);
    //闪退  copy后变为不可变数组。
//    [mutableArrayThree addObject:@"5"];
    NSLog(@"%@", mutableArrayTwo);
    
    
    NSArray *baseArray = @[@"1", @"2", @"3"];
    NSLog(@"arrayAddress: %p\n, array[0]Address: %p, array[1]Address: %p, array[2]Address: %p", baseArray, baseArray[0], baseArray[1], baseArray[2]);
    NSArray *signCopyArray = [baseArray mutableCopy];
    NSLog(@"arrayAddress: %p\n, array[0]Address: %p, array[1]Address: %p, array[2]Address: %p", signCopyArray, signCopyArray[0], signCopyArray[1], signCopyArray[2]);
    NSArray *fullCopyArray = [baseArray initWithArray:baseArray copyItems:YES];
    NSLog(@"arrayAddress: %p\n, array[0]Address: %p, array[1]Address: %p, array[2]Address: %p", fullCopyArray, fullCopyArray[0], fullCopyArray[1], fullCopyArray[2]);
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
