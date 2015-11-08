//
//  PWNavigationController.m
//  WeChat
//
//  Created by PhaseWong on 15/11/8.
//  Copyright © 2015年 PhaseWong. All rights reserved.
//

#import "PWNavigationController.h"

@interface PWNavigationController ()

@end

@implementation PWNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航条背景
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"bottleMaskBkg"] forBarMetrics:UIBarMetricsDefault];
}

/**
 *  重写push方法的目的 : 拦截所有push进来的子控制器
 *
 *  @param viewController 刚刚push进来的子控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count == 0){ // 只在根控制器创建
        UIBarButtonItem *addItem = [self itemWithImage:@"fts_barbutton_search_icon"  title:nil target:self action:@selector(searchClick)];
        UIBarButtonItem *searchItem = [self itemWithImage:@"barbuttonicon_add"  title:nil target:self action:@selector(addClick)];
        viewController.navigationItem.rightBarButtonItems = @[addItem,searchItem];
        
        viewController.navigationItem.leftBarButtonItem = [self itemWithImage:nil title:@"微信" target:self action:nil];
    }else{ // 统一设置返回按钮
//        viewController.navigationItem.leftBarButtonItem = [self itemWithImage:@"fts_search_backicon" title:self.tabBarItem.title target:self action:@selector(back)];
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setImage:[UIImage imageNamed:@"fts_search_backicon"] forState:UIControlStateNormal];
        [backButton setTitle:self.tabBarItem.title forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [backButton sizeToFit];
        // 这句代码放在sizeToFit后面
        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        [backButton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        
        // 隐藏底部的工具条
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    // 所有设置搞定后, 再push控制器
    [super pushViewController:viewController animated:animated];
}

// 监听添加按钮点击
- (void)addClick{
    NSLog(@"点击了%@界面的添加按钮",self.tabBarItem.title);
    UITableViewController *VC = [[UITableViewController alloc]init];
    [self pushViewController:VC animated:YES];
}

// 监听搜索按钮点击
- (void)searchClick{
    NSLog(@"点击了%@界面的搜索按钮",self.tabBarItem.title);
}
// 监听返回按钮点击
- (void)backClick{
    [self popViewControllerAnimated:YES];
}

// 设置UIBarButtonItem
- (UIBarButtonItem *)itemWithImage:(NSString *)image title:(NSString *)title target:(id)target action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (image.length) { // 如果图片名有值才赋值
        [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    }
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [button sizeToFit];
    return [[UIBarButtonItem alloc]initWithCustomView:button];
}

// 设置状态栏样式
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end
