//
//  MyNetworking.m
//  MyLaugh
//
//  Created by qinxianjin on 2017/8/31.
//  Copyright © 2017年 qinxianjin. All rights reserved.
//

#import "MyNetworking.h"
#import <AFNetworking.h>

@implementation MyNetworking

+(MyNetworking *) sharedNetWorking
{
    static MyNetworking *networking = nil;
    static dispatch_once_t predicate;
    static dispatch_once_t onceToken;
    dispatch_once(&predicate, ^{
        networking = [[MyNetworking alloc]init];
    });
    
    return networking;
}

+(void) getRequestWithURLString:(NSString *)urlStr finish:(void (^)(BOOL, NSData *))finish
{
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    if ([MyNetworking sharedNetWorking].HTTPHeaderDic) {
        for (NSString *key in [MyNetworking sharedNetWorking].HTTPHeaderDic) {
            [manager.requestSerializer setValue:[MyNetworking sharedNetWorking].HTTPHeaderDic[key] forKey:key];
        }
    }
    [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        finish(YES,responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        finish(NO,nil);
    }];
}

+(void) postRequestWithURLString:(NSString *)urlStr paramDic:(NSDictionary *)param finish:(void (^)(BOOL, NSData *))finish
{
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    if ([MyNetworking sharedNetWorking].HTTPHeaderDic) {
        for (NSString *key in [MyNetworking sharedNetWorking].HTTPHeaderDic) {
            [manager.requestSerializer setValue:[MyNetworking sharedNetWorking].HTTPHeaderDic[key] forKey:key];
        }
    }
    [manager POST:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        finish(YES,responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        finish(NO,nil);
    }];
}


@end
