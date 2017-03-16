//
//  FMDB_Queue_ViewController.m
//  LFAttribute
//
//  Created by LuoFeng on 2017/3/16.
//  Copyright © 2017年 LuoFengcompany. All rights reserved.
//

#import "FMDB_Queue_ViewController.h"
#import "FMDB.h"

@interface FMDB_Queue_ViewController ()
@property (nonatomic, strong) FMDatabaseQueue *queue;

@end

@implementation FMDB_Queue_ViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 0.获取沙盒地址
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *sqlFilePath = [path stringByAppendingPathComponent:@"student.sqlite"];
    
    
    // 1.创建一个FMDatabaseQueue对象
    // 只要创建数据库队列对象, FMDB内部就会自动给我们加载数据库对象
    self.queue = [FMDatabaseQueue databaseQueueWithPath:sqlFilePath];
    
    // 2.执行操作
    // 会通过block传递队列中创建好的数据库给我们
    [self.queue inDatabase:^(FMDatabase *db) {
        // 编写需要执行的代码
        // 2.1创建表(在FMDB框架中, 增加/删除/修改/创建/销毁都统称为更新)
        BOOL success = [db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_student (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, score REAL DEFAULT 1);"];
        
        if (success) {
            NSLog(@"创建表成功");
        }else
        {
            NSLog(@"创建表失败");
        }
        
    }];
    
    /*
     // 1.加载数据库对象
     self.db = [FMDatabase databaseWithPath:sqlFilePath];
     
     // 2.打开数据库
     if([self.db open])
     {
     NSLog(@"打开成功");
     // 2.1创建表(在FMDB框架中, 增加/删除/修改/创建/销毁都统称为更新)
     BOOL success = [self.db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_student (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, score REAL DEFAULT 1);"];
     
     if (success) {
     NSLog(@"创建表成功");
     }else
     {
     NSLog(@"创建表失败");
     }
     
     }else
     {
     NSLog(@"打开失败");
     }
     */
}

- (IBAction)insertOnClick
{
    /*
     // FMDB中可以用?当作占位符, 但是需要注意: 如果使用问号占位符, 以后只能给占位符传递对象
     BOOL success = [self.db executeUpdate:@"INSERT INTO t_student(score, name) VALUES (?, ?);", @(20), @"Jack"];
     if (success) {
     NSLog(@"插入成功");
     }else
     {
     NSLog(@"插入失败");
     }
     */
    
    [self.queue inDatabase:^(FMDatabase *db) {
        BOOL success = [db executeUpdate:@"INSERT INTO t_student(score, name) VALUES (?, ?);", @(20), @"jackson"];
        if (success) {
            NSLog(@"插入成功");
        }else
        {
            NSLog(@"插入失败");
        }
        
    }];
    
}
- (IBAction)deleteOnClick
{
    
}
- (IBAction)updateOnClick
{
    /*
     [self.queue inDatabase:^(FMDatabase *db) {
     
     // 开启事务
     [db beginTransaction];
     
     [db executeUpdate:@"UPDATE t_student SET score = 1500 WHERE name = 'zs';"];
     
     NSArray *array = @[@"abc"];
     array[1];
     
     [db executeUpdate:@"UPDATE t_student SET score = 500 WHERE name = 'ls';"];
     // 提交事务
     [db commit];
     }];
     */
    
    [self.queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        [db executeUpdate:@"UPDATE t_student SET score = 1500 WHERE name = 'zs';"];
        
        NSArray *array = @[@"abc"];
        array[1];
        
        [db executeUpdate:@"UPDATE t_student SET score = 500 WHERE name = 'ls';"];
    }];
}
- (IBAction)queryOnClick
{
    /*
     // FMDB框架中查询用executeQuery方法
     // FMResultSet结果集, 结果集其实和tablevivew很像
     FMResultSet *set = [self.db executeQuery:@"SELECT id, name, score FROM t_student;"];
     while ([set next]) { // next方法返回yes代表有数据可取
     int ID = [set intForColumnIndex:0];
     //        NSString *name = [set stringForColumnIndex:1];
     NSString *name = [set stringForColumn:@"name"]; // 根据字段名称取出对应的值
     double score = [set doubleForColumnIndex:2];
     NSLog(@"%d %@ %.1f", ID, name, score);
     }
     */
    
    [self.queue inDatabase:^(FMDatabase *db) {
        // FMResultSet结果集, 结果集其实和tablevivew很像
        FMResultSet *set = [db executeQuery:@"SELECT id, name, score FROM t_student;"];
        while ([set next]) { // next方法返回yes代表有数据可取
            int ID = [set intForColumnIndex:0];
            //        NSString *name = [set stringForColumnIndex:1];
            NSString *name = [set stringForColumn:@"name"]; // 根据字段名称取出对应的值
            double score = [set doubleForColumnIndex:2];
            NSLog(@"%d %@ %.1f", ID, name, score);
        }
    }];
    
    
}




@end
