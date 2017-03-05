//
//  LFBaseViewController.h
//  LFAttribute
//
//  Created by LuoFeng on 2017/3/4.
//  Copyright © 2017年 LuoFengcompany. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LFBaseViewController : UIViewController{
@public NSString *testValue;
}

//@property (strong, nonatomic) NSString *testValue;

- (void)setSuper_testValue:(NSString *)value;

- (NSString *)getSuper_testValue;

@end
