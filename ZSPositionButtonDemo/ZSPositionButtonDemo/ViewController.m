//
//  ViewController.m
//  ZSPositionButtonDemo
//
//  Created by 周顺 on 16/4/26.
//  Copyright © 2016年 AIRWALK. All rights reserved.
//

#import "ViewController.h"
#import "ZSPositionButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createButtonWithFrame:CGRectMake(100, 100, 200, 30) title:@"默认" fontSize:15 positionType:ZSPositionTypeNomal];
    
    [self createButtonWithFrame:CGRectMake(100, 150, 200, 30) title:@"正常左对齐" fontSize:15 positionType:ZSPositionTypeNomalLeft];
    
    [self createButtonWithFrame:CGRectMake(100, 200, 200, 30) title:@"正常右对齐" fontSize:15 positionType:ZSPositionTypeNomalRight];
    
     [self createButtonWithFrame:CGRectMake(100, 250, 200, 30) title:@"交换左对齐" fontSize:18 positionType:ZSPositionTypeLeft];
    
     [self createButtonWithFrame:CGRectMake(100, 300, 200, 30) title:@"交换右对齐" fontSize:15 positionType:ZSPositionTypeRight];

     [self createButtonWithFrame:CGRectMake(100, 350, 200, 30) title:@"交换中心对齐" fontSize:14 positionType:ZSPositionTypeCenter];
    
     [self createButtonWithFrame:CGRectMake(100, 400, 150, 50) title:@"文本在上，图标在下" fontSize:16 positionType:ZSPositionTypeTop];
    
     [self createButtonWithFrame:CGRectMake(100, 470, 200, 80) title:@"文本在下，图标在上" fontSize:15 positionType:ZSPositionTypeBottom];
}

- (void)createButtonWithFrame:(CGRect)frame title:(NSString *)title fontSize:(CGFloat)fontSize positionType:(ZSPositionType)positionType{
    ZSPositionButton *button = [ZSPositionButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setBackgroundColor:[UIColor brownColor]];
    [button setImage:[UIImage imageNamed:@"image"] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    button.positionType = positionType;//位置属性
//    [button sizeToFit];
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
