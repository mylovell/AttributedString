//
//  StorageVC.m
//  LFAttribute
//
//  Created by LuoFeng on 2017/3/21.
//  Copyright © 2017年 LuoFengcompany. All rights reserved.
//

#import "StorageVC.h"
#import "FMDBViewController.h"

@interface StorageVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;


@property(nonatomic, strong)NSMutableArray *dataArray;

@end

@implementation StorageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
//    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"My Storage";
    [self.dataArray addObjectsFromArray:@[@"FMDB"]];
    
    [self setupTableView];
}

- (void)setupTableView{
    
//    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenWidth - 64) style:UITableViewStylePlain];
    UITableView *tableView = [[UITableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(0);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).offset(-49);
    }];
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}


#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.dataArray[indexPath.row] isEqualToString:@"FMDB"]) {
        FMDBViewController *fmdbVC = [[FMDBViewController alloc] init];
        fmdbVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:fmdbVC animated:YES];
    }
}

#pragma mark - custom
- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}




@end
