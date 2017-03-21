//
//  FMDBViewController.m
//  LFAttribute
//
//  Created by LuoFeng on 2017/3/21.
//  Copyright © 2017年 LuoFengcompany. All rights reserved.
//

#import "FMDBViewController.h"
#import <FMDB.h>

@interface FMDBViewController ()

//@property (strong, nonatomic) IBOutlet UIView *fmdbView;

@end

@implementation FMDBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"FMDBView" owner:self options:nil] firstObject];
    self.view = view;
    
}

- (IBAction)add:(id)sender {
    
    
}

- (IBAction)delegate:(id)sender {
    
    
}

- (IBAction)update:(id)sender {
    
    
}
- (IBAction)query:(id)sender {
    
    
}



@end
