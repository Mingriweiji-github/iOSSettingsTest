//
//  DataService.h
//  Weibo
//
//  Created by imac on 26/9/14.
//  Copyright (c) 2015年 yiyuejun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^FinishDidBlock) (AFHTTPRequestOperation *opertion, id result);

typedef void(^FailureBlock) (AFHTTPRequestOperation *operation, NSError *error);

@interface DataService : NSObject

+ (AFHTTPRequestOperation *)requestWithURL:(NSString *)url
                                      params:(NSMutableDictionary *)params
                                httpMethod:(NSString *)httpMethod
                            finishDidBlock:(FinishDidBlock)finishDidBlock
                              failureBloak:(FailureBlock)failureBlock;



@end
