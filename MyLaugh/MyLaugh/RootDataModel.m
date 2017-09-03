//
//  RootDataModel.m
//  MyLaugh
//
//  Created by qinxianjin on 2017/8/31.
//  Copyright © 2017年 qinxianjin. All rights reserved.
//

#import "RootDataModel.h"

@implementation RootDataModel

- (void) setContentlist:(NSArray *)contentlist
{
    NSMutableArray *muArr =[[NSMutableArray alloc]init];
    
    for (int i = 0; i < contentlist.count; i ++) {
        NSDictionary *dic = contentlist[i];
        DataContentlistModel *dataContentModel = [[DataContentlistModel alloc]init];
        [dataContentModel setValuesForKeysWithDictionary:dic];
        [muArr addObject:dataContentModel];
    }
    _contentlist = [muArr copy];
}
- (void)setValue:(id)value forKey:(NSString *)key
{
    
}
@end

@implementation DataContentlistModel

-(void)setValue:(id)value forKey:(NSString *)key
{
    
}
@end
