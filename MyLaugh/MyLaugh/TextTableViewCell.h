//
//  TextTableViewCell.h
//  
//
//  Created by qinxianjin on 2017/8/31.
//
//

#import <UIKit/UIKit.h>

@interface TextTableViewCell : UITableViewCell

@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *content;
@property(nonatomic,strong)NSString *date;
- (CGFloat) getHeight;
- (void) setContentLabelHeight:(CGFloat) height;

@end
