//
//  ViewController.m
//  zyhgithub
//
//  Created by 张益豪 on 15/8/27.
//  Copyright (c) 2015年 张益豪. All rights reserved.
//

#import "ViewController.h"
#import "tModel.h"
#import "tView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    tModel* model = [[tModel alloc] init];
    model.title = @"hell";
    tView * tV = [[tView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    tV.lab.text = model.title;
    
    [self.view addSubview:tV];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
