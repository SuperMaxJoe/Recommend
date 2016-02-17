//
//  RecommendContentTableViewCell.h
//  Recommend
//
//  Created by 展恒 on 15/12/3.
//  Copyright © 2015年 赵百川. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RecommendContentTableViewCell;
@protocol RecommendContentProtocol <NSObject>
-(void)setContentCellData:(RecommendContentTableViewCell *)cell;
-(void)setContentData:(RecommendContentTableViewCell *)cell;
@end
@interface RecommendContentTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *titlefundname;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *titlefundcode;
@property (strong, nonatomic) IBOutlet UILabel *valueLabel;
@property (strong, nonatomic) IBOutlet UILabel *incomeLabel;
@property (strong, nonatomic) IBOutlet UIButton *starBtn;
@property (strong, nonatomic) IBOutlet UILabel *fundTypeLabel;
@property (strong, nonatomic) IBOutlet UILabel *money;

@property (retain, nonatomic) id<RecommendContentProtocol>delegate;
@end
