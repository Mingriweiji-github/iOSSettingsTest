//
//  DataService.m
//  Weibo
//
//  Created by imac on 26/9/14.
//  Copyright (c) 2015年 yiyuejun. All rights reserved.
//

#import "DataService.h"

//#define BASE_URL @"https://api.liwushuo.com/"


@implementation DataService

+ (AFHTTPRequestOperation *)requestWithURL:(NSString *)url
                                    params:(NSMutableDictionary *)params
                                httpMethod:(NSString *)httpMethod
                            finishDidBlock:(FinishDidBlock)finishDidBlock
                              failureBloak:(FailureBlock)failureBlock
{
    if (params == nil) {
        params = [NSMutableDictionary dictionary];
    }
    //如果需要拼接拼接URL
//    NSMutableString *urlStr = [NSMutableString stringWithFormat:@"%@%@", BASE_URL, url];
    

    
    //创建请求管理对象
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    AFHTTPRequestOperation *operation = nil;
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    //判断请求类型
    if ([httpMethod isEqualToString:@"GET"]) {
        operation = [manager GET:urlStr
                      parameters:params
                         success:^(AFHTTPRequestOperation *operation, id responseObject) {
                             //...
                             //请求成功
                             NSLog(@"AF-GET请求成功");
                             if (finishDidBlock) {
                                 finishDidBlock(operation, responseObject);
                             }
                         }
                         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                             //...
                             //请求成功
                             NSLog(@"AF-GET请求失败:%@", error);
                             failureBlock(operation, error);
                         }];
    }else if ([httpMethod isEqualToString:@"POST"]){
        //POST请求
        //判断是否有文件发送
        BOOL isFile = NO;
        for (NSString *key in params) {
            id value = params[key];
            if ([value isKindOfClass:[NSData class]]) {
                isFile = YES;
                break;
            }
        }
        if (!isFile) {
            //没有文件
            operation = [manager POST:urlStr
                           parameters:params
                              success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                  //...请求成功
                                  NSLog(@"AF-POST(非文件)请求成功");
                                  if (finishDidBlock) {
                                      finishDidBlock(operation, responseObject);
                                  }
                              } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                  //...请求失败
                                  NSLog(@"AF-POST(非文件)请求失败:%@", error);
                                  if (failureBlock) {
                                      failureBlock(operation, error);
                                  }
                              }];
        }else if (isFile){
            //有文件
            operation = [manager POST:urlStr
                           parameters:params
            constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
                //...
                for (NSString *key in params) {
                    id value = params[key];
                    if ([value isKindOfClass:[NSData class]]) {
                        //往form表单中添加data数据
                        [formData appendPartWithFileData:value
                                                    name:key
                                                fileName:key
                                                mimeType:@"image/jpeg"];
                        
                    }
                }
            } success:^(AFHTTPRequestOperation *operation, id responseObject) {
                //请求成功
                NSLog(@"AF-POST(带文件)请求成功");
                if (finishDidBlock) {
                    finishDidBlock(operation, responseObject);
                }
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                //请求失败
                NSLog(@"AF-POST(带文件)请求失败:%@", error);
                if (finishDidBlock) {
                    finishDidBlock(operation, error);
                }
            }];
        }
    }
    
    //设置返回数据的解析方式
    operation.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    
    return operation;
}

@end
