//
//  SlimeView.h
//  QQBubble
//
//  Created by chen on 14-12-30.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QHSlimeView : UIView

- (instancetype)initWithFrame:(CGRect)frame bgColor:(UIColor *)bgColor;

- (void)drawQHPicture:(CGPoint)p1 point2:(CGPoint)p2 point3:(CGPoint)p3 point4:(CGPoint)p4;

@end
