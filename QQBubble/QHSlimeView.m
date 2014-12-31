//
//  SlimeView.m
//  QQBubble
//
//  Created by chen on 14-12-30.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "QHSlimeView.h"

@interface QHSlimeView ()
{
    CGPoint _centerHead;
    CGPoint _centerFoot;
    UIColor *_bgColor;
    
    float _widthHead;
    float _widthFoot;
    
    CGPoint _p1;
    CGPoint _p2;
    CGPoint _p3;
    CGPoint _p4;
}

@end

@implementation QHSlimeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [self initWithFrame:frame bgColor:nil];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame bgColor:(UIColor *)bgColor
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        _bgColor = bgColor;
        if (_bgColor == nil)
        {
            _bgColor = [UIColor colorWithRed:41.f/255.f
                                       green:199.f/255.f
                                        blue:165.f/255.f
                                       alpha:1];
        }
    }
    return self;
}

- (void)drawQHPicture:(CGPoint)p1 point2:(CGPoint)p2 point3:(CGPoint)p3 point4:(CGPoint)p4
{
    _p1 = p1;
    _p2 = p2;
    _p3 = p3;
    _p4 = p4;
    
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [_bgColor setStroke];//设置线条颜色
    [_bgColor setFill];
    [self drawInQHPicture];
}

- (void)drawInQHPicture
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGPoint  startPoint      = _p1;
    CGPoint  point1          = _p2;
    CGPoint  point2          = _p3;
    CGPoint  endPoint        = _p4;
    CGContextMoveToPoint(context, startPoint.x, startPoint.y);
    CGContextAddLineToPoint(context, point1.x,point1.y);
    CGContextAddLineToPoint(context, point2.x,point2.y);
    CGContextAddLineToPoint(context, endPoint.x,endPoint.y);
    
    CGContextDrawPath(context, kCGPathFillStroke);
}

@end
