//
//  RecommendFirstViewController.m
//  Recommend
//
//  Created by 展恒 on 15/12/4.
//  Copyright © 2015年 赵百川. All rights reserved.
//

#import "RecommendFirstViewController.h"
#import "RecommendViewController.h"
@interface RecommendFirstViewController ()
@property (strong, nonatomic) IBOutlet UINavigationBar *totalNav;

@end

@implementation RecommendFirstViewController
- (IBAction)nextView:(id)sender {
    RecommendViewController *recommend = [[RecommendViewController alloc]init];

    [self.navigationItem setRightBarButtonItems:self animated:YES];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *rightItem = [[UIButton alloc]init];
    // Do any additional setup after loading the view from its nib.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma RequestData
-(void)requestData{
    
}
@end
