//
//  AttributteString.m
//  图文混排
//
//  Created by LuoFeng on 2017/2/26.
//  Copyright © 2017年 LuoFengcompany. All rights reserved.
//

#import "AttributteStringVC.h"

@interface AttributteStringVC ()
/**<#属性名#> */
@property(nonatomic, strong)UITableView *tableView;

@end

@implementation AttributteStringVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, screenWidth, screenHeight-64-49) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    
    
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



@end
