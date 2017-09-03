//
//  TextTableViewCell.m
//  
//
//  Created by qinxianjin on 2017/8/31.
//
//

#import "TextTableViewCell.h"

@implementation TextTableViewCell
{
    UILabel *_titleLabel;
    UILabel *_contentLabel;
    UILabel *_dateLabel;
}

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 5, self.frame.size.width, 21)];
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textColor = [UIColor purpleColor];
    _titleLabel.font = [UIFont italicSystemFontOfSize:17];
    
    _contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, self.frame.size.width, 21)];
    _contentLabel.backgroundColor = [UIColor clearColor];
    _contentLabel.numberOfLines = 0;
    
    _dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, self.frame.size.width, 21)];
    _dateLabel.textAlignment = NSTextAlignmentRight;
    
    [self.contentView addSubview:_titleLabel];
    [self.contentView addSubview:_contentLabel];
    [self.contentView addSubview:_dateLabel];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return self;
}

- (void) setTitle:(NSString *)title
{
    _title = title;
    _titleLabel.text = title;
}
- (void) setContent:(NSString *)content
{
    _content = content;
    _contentLabel.text = content;
}
- (void) setDate:(NSString *)date
{
    _date = date;
    _dateLabel.text = date;
}
- (void) setContentLabelHeight:(CGFloat)height
{
    _contentLabel.frame = CGRectMake(0, 30, _contentLabel.frame.size.width, height);
    _dateLabel.frame
    = CGRectMake(0, 35+height, _dateLabel.frame.size.width, 21);
}
- (CGFloat) getHeight
{
    //计算文字高度
    NSDictionary *attribute = @{NSFontAttributeName: _contentLabel.font};
    CGSize retSize = [_contentLabel.text boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT)
                                                      options:
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                                   attributes:
                      attribute
                                                       context:nil].size ;
    _contentLabel.frame = CGRectMake(0, 30, _contentLabel.frame.size.width, retSize.height);
    _dateLabel.frame = CGRectMake(0, 35+_contentLabel.frame.size.height, _dateLabel.frame.size.width, 21);
    
    return 30+_contentLabel.frame.size.height+10+21+5;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
