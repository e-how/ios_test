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
        self.lab = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 200, 50)];
        [self addSubview:self.lab];
    }
    return self;
}

- (void)setModel:(tModel *)model{
    self.model = model;
//    self.lab.text = model.title1;
//    self.lab.text = self.model.title;
}


@end
