//
//  LFTabBarViewController.m
//  LFAttribute
//
//  Created by LuoFeng on 2017/3/4.
//  Copyright © 2017年 LuoFengcompany. All rights reserved.
//

#import "LFTabBarViewController.h"
#import "AttributteStringVC.h"
#import "LFViewController1.h"
#import "LFViewController2.h"

#import "LFTabOneNC.h"
#import "LFTabTwoNC.h"
#import "LFTabThreeNC.h"


#import "UIImage+Image.h"

@interface LFTabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation LFTabBarViewController

+(void)load{
    
    
    UITabBarItem *item =  [UITabBarItem appearanceWhenContainedIn:self, nil];
    
    NSMutableDictionary *attrSel = [NSMutableDictionary dictionary];
    attrSel[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    attrSel[NSForegroundColorAttributeName] = [UIColor yellowColor];
    
    NSMutableDictionary *attrNor = [NSMutableDictionary dictionary];
    attrNor[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    attrSel[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    
    
    [item setTitleTextAttributes:attrSel forState:UIControlStateNormal];
    [item setTitleTextAttributes:attrNor forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self setupViewControllers];

    [self setSelectedIndex:1];
}

- (void)setupViewControllers{
    
    LFViewController1 *vc1 = [[LFViewController1 alloc] init];
    vc1.tabBarItem.title = @"列表";
    vc1.tabBarItem.image = [UIImage imageNamed:@"tabBar_essence_icon"];
    vc1.tabBarItem.selectedImage = [UIImage imageNamedWithOriganlMode:@"tabBar_essence_click_icon"];
    LFTabOneNC *oneNC = [[LFTabOneNC alloc] initWithRootViewController:vc1];
    [self addChildViewController:oneNC];
    
    LFViewController2 *vc2 = [[LFViewController2 alloc] init];
    vc2.tabBarItem.title = @"本地存储";
    vc2.tabBarItem.image = [UIImage imageNamed:@"tabBar_me_icon"];
    vc2.tabBarItem.selectedImage = [UIImage imageNamedWithOriganlMode:@"tabBar_me_click_icon"];
    LFTabTwoNC *twoNC = [[LFTabTwoNC alloc] initWithRootViewController:vc2];
    [self addChildViewController:twoNC];
    
    //[self setViewControllers:@[vc1,vc2]];
}


#pragma mark - UITabBarControllerDelegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
//    NSLog(@"shouldSelectViewController-->%@",viewController);
    return YES;
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
//    NSLog(@"didSelectViewController-->%@",viewController);
}


//CustomizingViewControllers(在more选卡)
//将要开始编辑，viewControllers-->哪些参与了编辑，以及他们的顺序
- (void)tabBarController:(UITabBarController *)tabBarController willBeginCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers{
//    NSLog(@"willBeginCustomizingViewControllers-->%@",viewControllers);
}
//将要结束编辑，viewControllers-->哪些参与了编辑，以及他们的顺序
- (void)tabBarController:(UITabBarController *)tabBarController willEndCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers changed:(BOOL)changed{
//    NSLog(@"willEndCustomizingViewControllers-->%@,changed-->%i",viewControllers,changed);
}
//已经结束编辑，viewControllers-->哪些参与了编辑，以及他们的顺序，changed-->实际编辑为1
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers changed:(BOOL)changed{
//    NSLog(@"didEndCustomizingViewControllers-->%@,changed-->%i",viewControllers,changed);
}





//允许哪些方向
- (UIInterfaceOrientationMask)tabBarControllerSupportedInterfaceOrientations:(UITabBarController *)tabBarController{
    return UIInterfaceOrientationMaskLandscapeRight | UIInterfaceOrientationMaskPortrait;
}
//首选方向
- (UIInterfaceOrientation)tabBarControllerPreferredInterfaceOrientationForPresentation:(UITabBarController *)tabBarController{
    return UIInterfaceOrientationPortrait;
}


//控制器动画切换（暂时还不会）
- (nullable id <UIViewControllerInteractiveTransitioning>)tabBarController:(UITabBarController *)tabBarController
                               interactionControllerForAnimationController: (id <UIViewControllerAnimatedTransitioning>)animationController{
//NSLog(@"animationController-->%@",animationController);
    return nil;
}
//点击选卡触发
- (nullable id <UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController
                     animationControllerForTransitionFromViewController:(UIViewController *)fromVC
                                                       toViewController:(UIViewController *)toVC{
    //NSLog(@"fromVC-->%@,toVC-->%@",fromVC,toVC);
    return nil;
}


@end
