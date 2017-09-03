//
//  RootDataModel.h
//  MyLaugh
//
//  Created by qinxianjin on 2017/8/31.
//  Copyright © 2017年 qinxianjin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface RootDataModel : NSObject

@property(nonatomic,assign)int allNum;
@property(nonatomic,assign)int allPages;
@property(nonatomic,assign)int currentPage;
@property(nonatomic,assign)int maxResult;
@property(nonatomic,strong)NSArray *contentlist;

@end


@interface DataContentlistModel : NSObject

@property(nonatomic,strong)NSString *ct;
@property(nonatomic,strong)NSString *text;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,assign)int type;
@property(nonatomic,strong)NSString *img;
@property(nonatomic,assign)CGFloat height;


@end
