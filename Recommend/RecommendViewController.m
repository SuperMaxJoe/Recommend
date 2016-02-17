//
//  RecommendViewController.m
//  Recommend
//
//  Created by 展恒 on 15/12/3.
//  Copyright © 2015年 赵百川. All rights reserved.
//

#import "RecommendViewController.h"
#import "RecommendFirstTableViewCell.h"
#import "RecommendContentTableViewCell.h"

@interface RecommendViewController ()<UITableViewDataSource,UITableViewDelegate,RecommendContentProtocol>
@property (strong,nonatomic)RecommendContentTableViewCell *contentCell;
@property (strong,nonatomic)RecommendFirstTableViewCell *firstCell;
@property (assign,nonatomic)CGSize sizeText;
@end

@implementation RecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    
}
-(void)setUI
{
    //设置tableview代理以及cell的id
    self.recommendTable.dataSource = self;
    self.recommendTable.delegate = self;
    [self.recommendTable registerNib:[UINib nibWithNibName:@"RecommendFirstTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"firstCell"];
    [self.recommendTable registerNib:[UINib nibWithNibName:@"RecommendContentTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"contentCell"];
}

#pragma RecommendDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return self.sizeText.height+170;
    }
    return 175;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return 40;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return  nil;
    }
    NSString *titleLabel = @"哪些环保主题基金值得投资";
    return titleLabel;
}
#pragma RecommendDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        RecommendFirstTableViewCell *firstCell = [self.recommendTable dequeueReusableCellWithIdentifier:@"firstCell"];
        [self setFitLabel:firstCell.contentLabel];
        UIFont* tfount = [UIFont systemFontOfSize:16.0];
        NSDictionary* dictS = [NSDictionary dictionaryWithObjectsAndKeys:tfount,NSFontAttributeName, nil];
        self.sizeText = [firstCell.contentLabel.text boundingRectWithSize:CGSizeMake(320, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dictS context:nil].size;
        firstCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return firstCell;
    }
    RecommendContentTableViewCell *contentCell = [self.recommendTable dequeueReusableCellWithIdentifier:@"contentCell"];
    contentCell.selectionStyle = UITableViewCellSelectionStyleNone;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    contentCell.delegate = self;
    
    return contentCell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return 10;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma labelfit
-(void)setFitLabel:(UILabel *)label{
    CGSize size = CGSizeMake(280, 2000);
    UIFont *fonts = [UIFont systemFontOfSize:15.0];
    CGSize msgSie = [label.text sizeWithFont:fonts constrainedToSize:size lineBreakMode: NSLineBreakByCharWrapping];
    [label setFont:[UIFont boldSystemFontOfSize:15]];
    label.frame = CGRectMake(20,70, 280,msgSie.height);
    label.lineBreakMode = NSLineBreakByCharWrapping;//实现文字多行显示
    label.numberOfLines = 0;
}

#pragma RequestData
-(void)requestData
{
    
}
#pragma ContentCellDelegate
-(void)setContentCellData:(RecommendContentTableViewCell *)cell
{
    self.contentCell = cell;
    if ([cell.starBtn.imageView.image isEqual:[UIImage imageNamed:@"star.png"]]) {
         [cell.starBtn setBackgroundImage:[UIImage imageNamed:@"starfull.png"] forState:UIControlStateNormal];
    }else{
        [cell.starBtn setBackgroundImage:[UIImage imageNamed:@"star.png"] forState:UIControlStateNormal];
    }
   
//        [cell.starBtn setImage:nil forState:UIControlStateNormal];
        
//        [cell.starBtn setImage:[UIImage imageNamed:@"starfull.png"] forState:UIControlStateNormal];

    
//    [cell.starBtn setImage:nil forState:UIControlStateNormal];
    
//    [cell.starBtn setImage:[UIImage imageNamed:@"star.png"] forState:UIControlStateNormal];
    

}
@end
