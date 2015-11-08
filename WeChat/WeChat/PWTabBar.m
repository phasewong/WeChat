//
//  PWTabBar.m
//  WeChat
//
//  Created by PhaseWong on 15/11/7.
//  Copyright © 2015年 PhaseWong. All rights reserved.
//

#import "PWTabBar.h"

@implementation PWTabBar

#pragma mark - 初始化
/**
 *  布局子控件
 */
-(void)layoutSubviews{
    [super layoutSubviews];
    /**** 设置所有UITabBarButton的frame ****/
    // 按钮的尺寸
    CGFloat btnY = 0;
    CGFloat btnW = self.frame.size.width / (self.subviews.count - 2);
    CGFloat btnH = self.frame.size.height;
    // 按钮索引
    NSUInteger btnIndex = 0;
    for (UIView *subview in self.subviews) {
        // 过滤掉非UITabBarButton
        //        if (![@"UITabBarButton" isEqualToString:NSStringFromClass(subview.class)]) continue;
        if (subview.class != NSClassFromString(@"UITabBarButton")) continue;
        // 设置frame
        CGFloat btnX = btnW * btnIndex;
        subview.frame = CGRectMake(btnX, btnY, btnW, btnH);
        // 增加索引
        btnIndex++;
    }
}

@end
