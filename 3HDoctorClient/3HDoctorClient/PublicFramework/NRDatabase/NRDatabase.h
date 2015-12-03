//
//  NRDatabase.h
//  NR
//
//  Created by 范英强 on 15/9/9.
//  Copyright (c) 2015年 范英强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
//通用数据库类,可以根据模型完成以模型的类名为表名的表的创建，以及增删改查
@interface NRDatabase : NSObject

{
    FMDatabase *myDB;
}
//根据指定的文件名获得此文件在自己指定沙盒目录下的全路径
+(NSString*)filePath:(NSString*)fileName;

+(NRDatabase *)sharedDatabase;
//从指定的表tableName中读到从startIndex开始的count条记录,model保存单条结果的模型对象,groupBy是模型中某个属性名，以它来分组,orderBy是模型中某个属性名，以它来排序,whereStr是模型中某个属性名，以它来筛选
-(NSArray *)readData:(NSInteger)startIndex count:(NSInteger)count model:(id)model grounBy:(NSString*)groupBy orderBy:(NSString*)orderBy where:(NSString*)whereStr;
//插入一条记录到表object所属类的类名对应的表中
-(void)insertItem:(id)object;
//插入多条记录到object所属类的类名中
-(void)insertArray:(NSArray*)array;

/**
 *  模糊查询数据库
 *
 *  @param model    传入的模型
 *  @param likeName 模糊词
 *
 *  @return 结果
 */ 
-(NSArray *)readData:(id)model LikeName:(NSString *)likeName;

-(NSArray *)selectData:(NSString*)title subtitle:(NSString*)subtitle keyWord:(NSString*)keyWord model:(id)model;

//使用者必须调用此方法，来完成自己的表的创建
//根据传入的模型类名数组，创建以类名为表名的所有表
-(void)createTable:(NSArray*)modelNameArray;

//查询字段
-(NSString *)readData:(id)model Name:(NSString *)name;
//删除数据
-(void)delete:(NSString *)value;
//查询数据
-(BOOL)select:(NSString *)value;
//根据岗位job查询所有职级
-(NSArray*)selectDataForJobId:(NSInteger)jobId model:(id)model;
//根据具体职级去查对应的名称app_level.id = 5 and app_rank.id = 1
-(NSArray*)selectDataForLevleId:(NSInteger)levleIdId andRankId:(NSInteger)rankId model:(id)model;
@end
