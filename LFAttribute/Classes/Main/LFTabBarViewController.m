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
#import "LFViewController3.h"
#import "LFViewController4.h"
#import "LFViewController5.h"
#import "LFViewController6.h"
#import "LFViewController7.h"

@interface LFTabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation LFTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
    [self setupViewControllers];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //NSLog(@"tabBarController-->%@",self.tabBarController);
}

- (void)setupViewControllers{
    AttributteStringVC *attStringVC = [[AttributteStringVC alloc] init];
    attStringVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"富文本" image:nil tag:0];
    
    AttributteStringVC *attStringVC1 = [[AttributteStringVC alloc] init];
    attStringVC1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"富文本1" image:nil tag:1];
    
    AttributteStringVC *attStringVC2 = [[AttributteStringVC alloc] init];
    attStringVC2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"富文本2" image:nil tag:2];
    
    AttributteStringVC *attStringVC3 = [[AttributteStringVC alloc] init];
    attStringVC3.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"富文本3" image:nil tag:3];
    
    AttributteStringVC *attStringVC4 = [[AttributteStringVC alloc] init];
    attStringVC4.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"富文本4" image:nil tag:4];
    
    AttributteStringVC *attStringVC5 = [[AttributteStringVC alloc] init];
    attStringVC5.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"富文本5" image:nil tag:5];
    
    LFViewController1 *lfVC1 = [LFViewController1 new];
    lfVC1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"lfVC1" image:nil tag:1];
    LFViewController2 *lfVC2 = [LFViewController2 new];
    lfVC2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"lfVC2" image:nil tag:2];
    LFViewController3 *lfVC3 = [LFViewController3 new];
    lfVC3.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"lfVC3" image:nil tag:3];
    LFViewController4 *lfVC4 = [LFViewController4 new];
    lfVC4.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"lfVC4" image:nil tag:4];
    LFViewController5 *lfVC5 = [LFViewController5 new];
    lfVC5.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"lfVC5" image:nil tag:5];
    LFViewController6 *lfVC6 = [LFViewController6 new];
    lfVC6.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"lfVC6" image:nil tag:6];
    LFViewController7 *lfVC7 = [LFViewController7 new];
    lfVC7.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"lfVC7" image:nil tag:7];
    
    //    UIViewController *vc1 = [[UIViewController alloc] init];
    //    vc1.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:1];
    //
    //    UIViewController *vc2 = [[UIViewController alloc] init];
    //    vc2.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:2];
    
    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:3];
    
    UIViewController *vc4 = [[UIViewController alloc] init];
    vc4.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:4];
    
    UIViewController *vc5 = [[UIViewController alloc] init];
    vc5.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemRecents tag:5];
    
    UIViewController *vc6 = [[UIViewController alloc] init];
    vc6.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:6];
    
    UIViewController *vc7 = [[UIViewController alloc] init];
    vc7.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:7];
    
    UIViewController *vc8 = [[UIViewController alloc] init];
    vc8.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:8];
    
    UIViewController *vc9 = [[UIViewController alloc] init];
    vc9.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:9];
    
    UIViewController *vc10 = [[UIViewController alloc] init];
    vc10.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemDownloads tag:10];
    
    UIViewController *vc11 = [[UIViewController alloc] init];
    vc11.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMostRecent tag:11];
    
    UIViewController *vc12 = [[UIViewController alloc] init];
    vc12.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMostViewed tag:12];
    
    
    [self setViewControllers:@[lfVC1,lfVC2,lfVC3,lfVC4,lfVC5,lfVC6,lfVC7]];
}

- (void)setSingleViewController:(UIViewController *)vc WithName:(NSString *)name{
    
    [self addChildViewController:vc];
    vc.title = name;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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
