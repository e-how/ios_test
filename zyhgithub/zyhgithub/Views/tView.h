//
//  tView.h
//  zyhgithub
//
//  Created by 张益豪 on 16/5/3.
//  Copyright © 2016年 张益豪. All rights reserved.
//

#import <UIKit/UIKit.h>
@class tModel;
@interface tView : UIView

@property (nonatomic,strong) UILabel* lab;
@property (nonatomic,strong) tModel* model;
@property (nonatomic) SEL sel;

@end
