//
//  QHShapeLayerView.m
//  QQBubble
//
//  Created by chen on 15-1-7.
//  Copyright (c) 2015年 chen. All rights reserved.
//

#import "QHShapeLayerView.h"

@interface QHShapeLayerView ()
{
    CAShapeLayer *_shapeLayer;
}

@end

@implementation QHShapeLayerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initLayer];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self initLayer];
    }
    return self;
}

- (void)initLayer
{
    //create shape layer
    _shapeLayer = [CAShapeLayer layer];
//    _shapeLayer.strokeColor = [UIColor orangeColor].CGColor;
    _shapeLayer.fillColor = [UIColor orangeColor].CGColor;
    _shapeLayer.lineWidth = 0;
    _shapeLayer.lineJoin = kCALineJoinRound;
    _shapeLayer.lineCap = kCALineCapRound;
//    _shapeLayer.path = path.CGPath;
    //add it to our view
    [self.layer addSublayer:_shapeLayer];
}

- (void)drawQHPicture:(CGPoint)p1 point2:(CGPoint)p2 point3:(CGPoint)p3 point4:(CGPoint)p4
{
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:p1];
    [path addLineToPoint:p2];
    [path addLineToPoint:p3];
    [path addLineToPoint:p4];
//    [path addLineToPoint:p1];
    
    _shapeLayer.path = path.CGPath;
    [_shapeLayer display];
}

@end
