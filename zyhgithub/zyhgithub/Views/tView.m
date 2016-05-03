//
//  tView.m
//  zyhgithub
//
//  Created by 张益豪 on 16/5/3.
//  Copyright © 2016年 张益豪. All rights reserved.
//

#import "tView.h"

@implementation tView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.lab = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 200, 100)];
        [self addSubview:self.lab];
    }
    return self;
}

@end
