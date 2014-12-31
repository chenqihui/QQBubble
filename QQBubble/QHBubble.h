//
//  QHBubble.h
//  QQBubble
//
//  Created by chen on 14-12-29.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QHBubble;

@protocol QHBubbleDelegate <NSObject>

- (void)removeBubble:(QHBubble *)bubble;

- (void)movePoint:(CGPoint)point;

@end

@interface QHBubble : UIView

@property (nonatomic, assign) id<QHBubbleDelegate> delegate;

- (instancetype)initWithRadius:(CGFloat)radius color:(UIColor *)color content:(NSString *)title font:(UIFont *)font forSuper:(UIView *)superView;

- (void)setValueForBubble:(NSString *)content;

- (NSString *)getValueForBubble;

- (void)show;

- (void)hidden;

@end
