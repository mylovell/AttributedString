//
//  LFTabOneCell.m
//  LFAttribute
//
//  Created by wen on 2017/3/16.
//  Copyright © 2017年 LuoFengcompany. All rights reserved.
//

#import "LFTabOneCell.h"

@interface LFTabOneCell ()



@end

@implementation LFTabOneCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UILabel *rightLabel = [[UILabel alloc] init];
        [self addSubview:rightLabel];
        self.rightLabel = rightLabel;
        [rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(space);
            make.centerY.equalTo(self.mas_centerY);
            make.height.equalTo(@40);
            make.width.equalTo(@100);
        }];
        
    }
    return self;
}

@end
