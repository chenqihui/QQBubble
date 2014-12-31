//
//  ViewController.m
//  QQBubble
//
//  Created by chen on 14-12-29.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "ViewController.h"

#import "QHBubble.h"

@interface ViewController ()<QHBubbleDelegate>
{
    QHBubble *_bubbleV;
    int _messages;
    UIButton *_btn;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _messages = 0;
    
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn.frame = CGRectMake(0, 0, 150, 60);
    _btn.center = self.view.center;
    [_btn setTitle:@"消息" forState:UIControlStateNormal];
    [_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _btn.layer.borderColor = [UIColor orangeColor].CGColor;
    _btn.layer.borderWidth = 1;
    _btn.layer.cornerRadius = 8;
    [self.view addSubview:_btn];
    
    [self sendMessageAction];
    
    UIButton *sendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sendBtn.frame = CGRectMake(_btn.frame.origin.x, _btn.frame.origin.y - _btn.frame.size.height - 30, _btn.frame.size.width, _btn.frame.size.height);
    [sendBtn setTitle:@"发送消息" forState:UIControlStateNormal];
    [sendBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    sendBtn.layer.borderColor = [UIColor orangeColor].CGColor;
    sendBtn.layer.borderWidth = 1;
    sendBtn.layer.cornerRadius = 8;
    [self.view addSubview:sendBtn];
    [sendBtn addTarget:self action:@selector(sendMessageAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)sendMessageAction
{
    _messages++;
    if (_bubbleV == nil)
    {
        UIFont *font = [UIFont systemFontOfSize:10];
        CGSize s = [@"陈" sizeWithAttributes:@{NSFontAttributeName:font}];
        _bubbleV = [[QHBubble alloc] initWithRadius:s.width*2.5 color:nil content:[NSString stringWithFormat:@"%d", _messages] font:font forSuper:_btn];
        [_bubbleV show];
        _bubbleV.delegate = self;
    }else
    {
        [_bubbleV setValueForBubble:[NSString stringWithFormat:@"%d", _messages]];
    }
    [_bubbleV show];
}

#pragma mark - QHBubbleDelegate

- (void)removeBubble:(QHBubble *)bubble
{
    _messages = 0;
    [_bubbleV hidden];
    _bubbleV = nil;
}

- (void)movePoint:(CGPoint)point
{
//    NSLog(@"%@", NSStringFromCGPoint(point));
}

@end
