//
//  LFViewController2.m
//  LFAttribute
//
//  Created by LuoFeng on 2017/3/4.
//  Copyright © 2017年 LuoFengcompany. All rights reserved.
//

#import "LFViewController2.h"
#import "LFTabOneCell.h"

@interface LFViewController2 ()<UITableViewDataSource,UITableViewDelegate>

@property(weak, nonatomic) UITableView *tableView;

@property (nonatomic ,strong) NSMutableArray *titleDataArray;

@end

static NSString *tabOneCell = @"tabOneCell";
@implementation LFViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpBaseConfigure];
    [self setUpTableView];
    
}

- (void)setUpBaseConfigure{
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Storage";
    
    
}

- (void)setUpTableView{
    
    CGRect rect = CGRectMake(0, 64, screenWidth, screenHeight - 64 - 49);
    UITableView *tableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStylePlain];//UITableViewStylePlain、UITableViewStyleGrouped
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    
    [tableView registerClass:[LFTabOneCell class] forCellReuseIdentifier:tabOneCell];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.titleDataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Storage"];
//    cell.textLabel.text = self.titleDataArray[indexPath.row];
    
    LFTabOneCell *cell = [tableView dequeueReusableCellWithIdentifier:tabOneCell];
    cell.rightLabel.text = self.titleDataArray[indexPath.row];
    
    
    return cell;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 0;
//}


#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40;
}

#pragma mark - 初始化
-(NSMutableArray *)titleDataArray{
    if (!_titleDataArray) {
        _titleDataArray = [NSMutableArray arrayWithObjects:
                           @"FMDB",
                           @"Preference",
                           nil];
        
    }
    return _titleDataArray;
}


@end
