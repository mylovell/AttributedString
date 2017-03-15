//
//  Macro(常用宏).m
//  LFAttribute
//
//  Created by LuoFeng on 2017/2/25.
//  Copyright © 2017年 LuoFengcompany. All rights reserved.
//

#import "Macro.h"

@implementation Macro

//手机屏幕宽高
#define screenWith [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height


//快速设置颜色
#define RGB(a,b,c) [UIColor colorWithRed:(a)/255.0 green:(b)/255.0 blue:(c)/255.0 alpha:1.0]
#define RGBA(a,b,c,d) [UIColor colorWithRed:(a)/255.0 green:(b)/255.0 blue:(c)/255.0 alpha:(d)]
#define randomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]



@end
