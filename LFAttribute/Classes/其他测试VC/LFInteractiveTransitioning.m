//
//  LFInteractiveTransitioning.m
//  LFAttribute
//
//  Created by LuoFeng on 2017/3/4.
//  Copyright © 2017年 LuoFengcompany. All rights reserved.
//

#import "LFInteractiveTransitioning.h"

@interface LFInteractiveTransitioning ()<UIViewControllerInteractiveTransitioning>

@end

@implementation LFInteractiveTransitioning

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = randomColor;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






@end
