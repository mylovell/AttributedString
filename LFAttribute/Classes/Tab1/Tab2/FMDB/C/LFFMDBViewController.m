//
//  LFFMDBViewController.m
//  LFAttribute
//
//  Created by LuoFeng on 2017/3/16.
//  Copyright © 2017年 LuoFengcompany. All rights reserved.
//

#import "LFFMDBViewController.h"
#import "FMDB.h"


@interface LFFMDBViewController ()

@property (nonatomic, strong) FMDatabase *db;
//@property (nonatomic, strong) FMDatabaseQueue *queue;


@end

@implementation LFFMDBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //打开数据库
    [self openDataBase];
    
    
}

- (void)openDataBase{
    // 0.获取沙盒地址
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    // 数据库名称
    NSString *sqlName = [NSString stringWithFormat:@"student.sqlite"];
    // 数据库地址
    NSString *sqlFilePath = [path stringByAppendingPathComponent:sqlName];
    
    
    // 1.加载数据库对象
    self.db = [FMDatabase databaseWithPath:sqlFilePath];
    
//    // *1.队列的作用是给我们一个db对象
//    self.queue = [FMDatabaseQueue databaseQueueWithPath:sqlFilePath];
    
    
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

}

- (void)insertObject{
    
    BOOL success = [self.db executeUpdate:@"INSERT INTO t_student(score,name) VALUES(?,?);",@(25),@"Tom"];
    if (success) {
        NSLog(@"insert success");
    } else {
        NSLog(@"insert failure");
    }
}

- (void)deleteObject{
    //DELETE FROM t_student WHERE age > 20 AND age < 25;
    BOOL success = [self.db executeUpdate:@"DELETE FROM t_student WHERE score < 25 AND name = Tom"];
    if (success) {
        NSLog(@"delete success");
    } else {
        NSLog(@"delete failure");
    }
}

- (void)updateObject{
    
    BOOL success = [self.db executeUpdate:@"UPDATE t_student SET name = Jim WHERE score > 75"];
    if (success) {
        NSLog(@"update success");
    } else {
        NSLog(@"update failure");
    }
}

- (void)queryObject{
    
    //方法一：
//     FMResultSet结果集, 结果集其实和tablevivew很像
    FMResultSet *set = [self.db executeQuery:@"SELECT id, name, score FROM t_student;"];
    while ([set next]) { // next方法返回yes代表有数据可取
        int ID = [set intForColumnIndex:0];
        //        NSString *name = [set stringForColumnIndex:1];
        NSString *name = [set stringForColumn:@"name"]; // 根据字段名称取出对应的值
        double score = [set doubleForColumnIndex:2];
        NSLog(@"%d %@ %.1f", ID, name, score);
    }
    
    
    //方法二：使用队列
//    [self.queue inDatabase:^(FMDatabase *db) {
//        FMResultSet *set = [db executeQuery:@"SELECT id, name, score FROM t_student;"];
//        while ([set next]) {
//            int ID = [set intForColumnIndex:0];
//            NSString *name = [set stringForColumnIndex:1];
//            double score = [set doubleForColumnIndex:2];
//            NSLog(@"%d %@ %.1f", ID, name, score);
//        }
//    }
}


@end
