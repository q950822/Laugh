//
//  MyNetworking.h
//  MyLaugh
//
//  Created by qinxianjin on 2017/8/31.
//  Copyright © 2017年 qinxianjin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyNetworking : NSObject

@property (nonatomic,strong) NSDictionary *HTTPHeaderDic;
+(MyNetworking *) sharedNetWorking;
+(void) getRequestWithURLString:(NSString *)urlStr finish:(void(^) (BOOL success,NSData *data))finish;
+(void) postRequestWithURLString:(NSString *)urlStr paramDic:(NSDictionary *) param finish:(void(^) (BOOL success,NSData *data))finish;

@end
