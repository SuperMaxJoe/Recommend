//
//  RecommendContentTableViewCell.m
//  Recommend
//
//  Created by 展恒 on 15/12/3.
//  Copyright © 2015年 赵百川. All rights reserved.
//

#import "RecommendContentTableViewCell.h"

@implementation RecommendContentTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    self.fundTypeLabel.layer.cornerRadius = 5;
    // Configure the view for the selected state
}
- (IBAction)starBtn:(id)sender {
    if ([self.delegate respondsToSelector:@selector(setContentCellData:)]) {
        [self.delegate setContentCellData:self];
        
    }
}

@end
