//
//  PWTabBarController.m
//  WeChat
//
//  Created by PhaseWong on 15/11/7.
//  Copyright © 2015年 PhaseWong. All rights reserved.
//

#import "PWTabBarController.h"
#import "PWTabBar.h"
#import "PWNavigationController.h"

#define PWColorA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define PWColor(r, g, b) PWColorA((r), (g), (b), 255)
#define PWRandomColor PWColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

@interface PWTabBarController ()

@end

@implementation PWTabBarController

#pragma mark - 初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**** 设置所有UITabBarItem的文字属性 ****/
    [self setupItemTitleTextAttributes];
    
    /**** 添加所有子控制器 ****/
    [self setupAllChildViewController];
    
    /**** 更换TabBar ****/
    [self setValue:[[PWTabBar alloc]init] forKey:@"tabBar"];
}

/**
 *  设置所有UITabBarItem的文字属性
 */
- (void)setupItemTitleTextAttributes{
    /**** 设置所有UITabBarItem的文字属性 ****/
    UITabBarItem *item = [UITabBarItem appearance];
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = PWColor(41, 178, 10);
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

/**
 *   添加所有子控制器 
 */
- (void)setupAllChildViewController{
    /**** 添加子控制器 ****/
//    [self setupOneChildViewController:[[PWNavigationController alloc]initWithRootViewController:[[UIViewController alloc]init]] image:@"tabbar_mainframe" selectedImage:@"tabbar_mainframeHL" title:@"微信"];
//    [self setupOneChildViewController:[[PWNavigationController alloc]initWithRootViewController:[[UIViewController alloc]init]] image:@"tabbar_contacts" selectedImage:@"tabbar_contactsHL" title:@"通讯录"];
//    
//    [self setupOneChildViewController:[[PWNavigationController alloc]initWithRootViewController:[[UIViewController alloc]init]] image:@"tabbar_discover" selectedImage:@"tabbar_discoverHL" title:@"发现"];
//    [self setupOneChildViewController:[[PWNavigationController alloc]initWithRootViewController:[[UIViewController alloc]init]] image:@"tabbar_me" selectedImage:@"tabbar_meHL" title:@"我"];
    
    [self setupOneChildViewController:[UIViewController class] image:@"tabbar_mainframe" selectedImage:@"tabbar_mainframeHL" title:@"微信"];
    [self setupOneChildViewController:[UITableViewController class] image:@"tabbar_contacts" selectedImage:@"tabbar_contactsHL" title:@"通讯录"];
    [self setupOneChildViewController:[UIViewController class] image:@"tabbar_discover" selectedImage:@"tabbar_discoverHL" title:@"发现"];
    [self setupOneChildViewController:[UITableViewController class] image:@"tabbar_me" selectedImage:@"tabbar_meHL" title:@"我"];
    
}

/**
 *  添加子控制器
 *
 *  @param vc            子控制器
 *  @param image         tabBarItem图片
 *  @param selectedImage tabBarItem选中图片
 *  @param title         tabBarItem文字
 */
//- (void)setupOneChildViewController:(UIViewController *)vc image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title{
//    vc.view.backgroundColor = PWRandomColor;
//    if (image.length) { // 如果图片名有值才赋值
//        vc.tabBarItem.title = title;
//        vc.tabBarItem.image = [UIImage imageNamed:image];
//        vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
//    }
//    [self addChildViewController:vc];
//}

- (void)setupOneChildViewController:(Class )clazz image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title{
    UIViewController *vc = [[clazz alloc]init];
    vc.view.backgroundColor = PWRandomColor;
    if (image.length) { // 如果图片名有值才赋值
        vc.tabBarItem.title = title;
        vc.tabBarItem.image = [UIImage imageNamed:image];
        vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    }
    PWNavigationController *nav = [[PWNavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];
}



@end
