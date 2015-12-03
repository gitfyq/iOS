//
//  THNetWorkManager.m
//  3HDoctorClient
//
//  Created by 范英强 on 15/11/30.
//  Copyright (c) 2015年 fyq. All rights reserved.
//

#import "THNetWorkManager.h"
@interface THNetWorkManager ()
{
    NSString *URLPath;
}
@property (nonatomic,strong) AFHTTPSessionManager *httpSessionManager;
//  保存上一个请一个对象
@property (nonatomic,strong) NSURLSessionDataTask *previousURLSessionDataTask;

@end

static THNetWorkManager *thNetWorkManager = nil;
@implementation THNetWorkManager

+ (id)shareNetWork
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        thNetWorkManager = [[THNetWorkManager alloc] init];
    });
    return thNetWorkManager;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        thNetWorkManager = [super allocWithZone:zone];
    });
    return thNetWorkManager;
}

- (instancetype)init
{
    thNetWorkManager = [super init];
    if (thNetWorkManager) {
        
    }
    return thNetWorkManager;
}

- (id)copy
{
    return [[self class] shareNetWork];
}

- (id)mutableCopy
{
    return [[self class] shareNetWork];
}

- (AFHTTPSessionManager *)httpSessionManager
{
    if (!_httpSessionManager) {
        _httpSessionManager = [AFHTTPSessionManager manager];
        
        //返回json
        _httpSessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
        _httpSessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
        
        //   配置响应序列化器的可接受内容类型acceptableContentTypes
        _httpSessionManager.responseSerializer.acceptableContentTypes = [_httpSessionManager.responseSerializer.acceptableContentTypes setByAddingObjectsFromSet:[NSSet setWithObjects:@"text/plain", @"text/html", nil]];
        _httpSessionManager.securityPolicy = [AFSecurityPolicy defaultPolicy];
        _httpSessionManager.securityPolicy.allowInvalidCertificates = YES;//  不验证ssl证书
        
        _httpSessionManager.requestSerializer.timeoutInterval = 10;
        
    }
    return _httpSessionManager;
}

- (void)addHeadFieldParamsDic:(NSDictionary *)headerFieldParamsDic
{
    if (headerFieldParamsDic) {
        for (NSString *key in headerFieldParamsDic.allKeys) {
            [self.httpSessionManager.requestSerializer setValue:[headerFieldParamsDic stringForKey:key] forHTTPHeaderField:key];
        }
    }
}

- (NSDictionary *)defaultHeaderField
{
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:Token];
    if (token == nil) {
        token = @"aaa";
    }
    return @{@"token":token,@"uuid":UUID};
}

//POST一个请求
- (void)POSTRequestOperationWithUrlPort:(NSString *)urlPort
                                 params:(NSDictionary *)params
                           successBlock:(CompletionBlockWithSuccess)successBlock
                           failureBlock:(FailureBlock)failureBlock
{
    NSString *urlPath = [thServerHost stringByAppendingString:urlPort];
    
    [self requestOperation:urlPath andParams:params andHeaderFieldParams:nil andHttpRequestMethod:HttpRequestMethodPOST andCompletionBlockWithSuccess:^(NSURLSessionDataTask *urlSessionDataTask,THHttpResponse *response){
        
        if (successBlock) {
            successBlock(urlSessionDataTask,response);
        }
    } andFailure:^(NSURLSessionDataTask *urlSessionDataTask,NSError *error){
        if (failureBlock) {
            failureBlock(urlSessionDataTask,error);
        }
    }];
}

- (NSURLSessionDataTask *)requestOperation:(NSString *)requestUrl andParams:(NSDictionary *)paramDic andHeaderFieldParams:(NSDictionary *)headerFieldParamsDic andHttpRequestMethod:(HttpRequestMethod)httpRequestMethod andCompletionBlockWithSuccess:(CompletionBlockWithSuccess) success andFailure:(FailureBlock) failure;
{
    
    //  添加header请求头
    if (headerFieldParamsDic) {
        [self addHeadFieldParamsDic:headerFieldParamsDic];
    }
    
    //  默认添加UUID和token参数
    [self addHeadFieldParamsDic:[self defaultHeaderField]];
    
    NSURLSessionDataTask *urlSessionDataTask = nil;
    if (httpRequestMethod == HttpRequestMethodPOST) {
        
        urlSessionDataTask = [self.httpSessionManager POST:requestUrl parameters:paramDic success:^(NSURLSessionDataTask *task, id responseObject) {
            
            if (success) {
                
                THHttpResponse *response = [THHttpResponse kyHttpResponseParse:responseObject];
                WeakSelf(THNetWorkManager);
                //访问所有接口，如果返回 {"data":"","info":"…","status":"-99"} status为 -99 则表示需要登录或重新登录
                
                //所有鉴权接口，每次请求需要传入token参数。
                if ([response.responseCode isEqualToString:@"-99"]) {
                    //  保存上一次请求
                    self.previousURLSessionDataTask = urlSessionDataTask;
                    
                    [weakSelf getTokenForCompletionBlockWithSuccess:^(NSURLSessionDataTask *urlSessionDataTask, THHttpResponse *response) {
                        
                        if ([response.responseCode isEqualToString:@"1"]) {
                            [weakSelf.previousURLSessionDataTask resume];
                        }
                        self.previousURLSessionDataTask = nil;
                        
                    } andFailure:^(NSURLSessionDataTask *urlSessionDataTask, NSError *error) {
                        if (failure) {
                            failure(urlSessionDataTask,error);
                        }
                    }];
                    return ;
                    
                }
                success(task,response);
            }
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            if (failure) {
                failure(task,error);
            }
        }];
        
    } else if (httpRequestMethod == HttpRequestMethodGET) {
        
        urlSessionDataTask = [self.httpSessionManager GET:requestUrl parameters:paramDic success:^(NSURLSessionDataTask *task, id responseObject) {
            
            if (success) {
                THHttpResponse *response = [THHttpResponse kyHttpResponseParse:responseObject];
                
                WeakSelf(THNetWorkManager);
                //访问所有接口，如果返回 {"data":"","info":"…","status":"-99"} status为 -99 则表示需要登录或重新登录
                
                //所有鉴权接口，每次请求需要传入token参数。
                if ([response.responseCode isEqualToString:@"-99"]) {
                    //  保存上一次请求
                    self.previousURLSessionDataTask = urlSessionDataTask;
                    
                    [weakSelf getTokenForCompletionBlockWithSuccess:^(NSURLSessionDataTask *urlSessionDataTask, THHttpResponse *response) {
                        
                        if ([response.responseCode isEqualToString:@"1"]) {
                            [weakSelf.previousURLSessionDataTask resume];
                        }
                        self.previousURLSessionDataTask = nil;
                        
                    } andFailure:^(NSURLSessionDataTask *urlSessionDataTask, NSError *error) {
                        if (failure) {
                            failure(urlSessionDataTask,error);
                        }
                    }];
                    return ;
                    
                }
                success(task,response);
            }
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            if (failure) {
                failure(task,error);
            }
        }];
        
    }
    //  请求接口
    //    [urlSessionDataTask resume];
    
    return urlSessionDataTask;
    
}

- (void)getTokenForCompletionBlockWithSuccess:(CompletionBlockWithSuccess) success andFailure:(FailureBlock)failure
{
    NSString *urlPath = [thServerHost stringByAppendingPathComponent:@"getToken.json"];
    
    NSDictionary *headDic = @{@"uuid":UUID};
    
    [self requestOperation:urlPath andParams:nil andHeaderFieldParams:headDic andHttpRequestMethod:HttpRequestMethodPOST andCompletionBlockWithSuccess:^(NSURLSessionDataTask *urlSessionDataTask, THHttpResponse *response) {
        
        //  保存访问token?""
        NSString *token = [response.dataDic stringForKey:@"token"];
        if (token.length>0) {
            [[NSUserDefaults standardUserDefaults] setObject:token forKey:Token];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
        
        if (success) {
            success(urlSessionDataTask,response);
        }
        
    } andFailure:^(NSURLSessionDataTask *urlSessionDataTask, NSError *error) {
        if (failure) {
            failure(urlSessionDataTask,error);
        }
    }];
}


/// 转换枚举类型对应的请求方式
- (NSString *)convertHttpPostMethodEnum:(HttpRequestMethod) httpRequestMethod
{
    if (httpRequestMethod == HttpRequestMethodGET) {
        return @"GET";
    } else if (httpRequestMethod == HttpRequestMethodPOST) {
        return @"POST";
    }
    return @"GET";
}

//GET请求方式

- (void)GETRequestOperationWithUrlPort:(NSString *)urlPort
                                 params:(NSDictionary *)params
                           successBlock:(CompletionBlockWithSuccess)successBlock
                           failureBlock:(FailureBlock)failureBlock
{
    NSString *urlPath = [thServerHost stringByAppendingString:urlPort];
    
    [self requestOperation:urlPath andParams:params andHeaderFieldParams:nil andHttpRequestMethod:HttpRequestMethodGET andCompletionBlockWithSuccess:^(NSURLSessionDataTask *urlSessionDataTask,THHttpResponse *response){
        
        if (successBlock) {
            successBlock(urlSessionDataTask,response);
        }
    } andFailure:^(NSURLSessionDataTask *urlSessionDataTask,NSError *error){
        if (failureBlock) {
            failureBlock(urlSessionDataTask,error);
        }
    }];
}

#pragma mark 获取城市列表
- (void)getCityListCompletionBlockWithSuccess:(CompletionBlockWithSuccess) success andFailure:(FailureBlock) failure{
    NSDictionary *paramDic = @{@"a":@"getcityList"};
    [self GETRequestOperationWithUrlPort:@"" params:paramDic successBlock:success failureBlock:failure];
    
}


@end
