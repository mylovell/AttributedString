//
//  AttributteString.m
//  LFAttribute
//
//  Created by LuoFeng on 2017/2/26.
//  Copyright © 2017年 LuoFengcompany. All rights reserved.
//

#import "AttributteStringVC.h"
#import "ViewController.h"

@interface AttributteStringVC ()
/**<#属性名#> */
@property(nonatomic, strong)UITableView *tableView;

@end

@implementation AttributteStringVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
//    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, screenWidth, screenHeight-64-49) style:UITableViewStyleGrouped];
//    [self.view addSubview:self.tableView];
    
    NSLog(@"childViewControllers->%@",self.tabBarController.customizableViewControllers);
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    ViewController *vc1 = [[ViewController alloc] init];
    vc1.view.backgroundColor = randomColor;
    vc1.tabBarItem.title = @"vc1";
    
    ViewController *vc2 = [[ViewController alloc] init];
    vc2.view.backgroundColor = randomColor;
    vc2.tabBarItem.title = @"vc2";
    
    ViewController *vc3 = [[ViewController alloc] init];
    vc3.view.backgroundColor = randomColor;
    vc3.tabBarItem.title = @"vc3";
    
//    [self.tabBarController setViewControllers:@[vc1,vc2,vc3] animated:NO];
    
    
}


@end
