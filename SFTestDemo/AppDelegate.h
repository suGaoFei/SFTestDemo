//
//  AppDelegate.h
//  SFTestDemo
//
//  Created by 黄云高 on 2016/12/22.
//  Copyright © 2016年 SugarFree. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseNavigationController.h"
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

