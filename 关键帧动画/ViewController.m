//
//  ViewController.m
//  关键帧动画
//
//  Created by 刘浩浩 on 16/5/24.
//  Copyright © 2016年 CodingFire. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController ()

@property (nonatomic, strong) CALayer *colorLayer;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //create sublayer
//    self.colorLayer = [CALayer layer];
//    self.colorLayer.frame = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
//    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
//    self.colorLayer.position=CGPointMake(160, 150);
//    //设置动画的方式
//    CATransition *transition = [CATransition animation];
//    transition.type = kCATransitionPush;
//    transition.subtype = kCATransitionFromLeft;
//    self.colorLayer.actions = @{@"backgroundColor": transition};
//    //add it to our view
//    [self.view.layer addSublayer:self.colorLayer];
//    
//    UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
//    btn.frame=CGRectMake(0, 0, 200, 50);
//    btn.center=CGPointMake(160, 300);
//    btn.backgroundColor=[UIColor blueColor];
//    btn.layer.cornerRadius=5;
//    [btn setTitle:@"Change color" forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];
    
    //create a path
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    [bezierPath moveToPoint:CGPointMake(100, 150)];
    [bezierPath addCurveToPoint:CGPointMake(300, 300) controlPoint1:CGPointMake(100, 450) controlPoint2:CGPointMake(200, 600)];
    //draw the path using a CAShapeLayer
     CAShapeLayer *pathLayer = [CAShapeLayer layer];
     pathLayer.path = bezierPath.CGPath;
     pathLayer.fillColor = [UIColor clearColor].CGColor;
     pathLayer.strokeColor = [UIColor redColor].CGColor;
     pathLayer.lineWidth = 3.0f;
     [self.view.layer addSublayer:pathLayer];
     //add the ship
     CALayer *shipLayer = [CALayer layer];
     shipLayer.frame = CGRectMake(0, 0, 32, 32);
     shipLayer.position = CGPointMake(100, 150);
     shipLayer.contents = (__bridge id)[UIImage imageNamed: @"mycenter_favorite.png"].CGImage; [self.view.layer addSublayer:shipLayer];
  
    //create the keyframe animation
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 4.0;
    animation.path = bezierPath.CGPath;
    //设置朝向沿切线方向
    animation.rotationMode = kCAAnimationRotateAuto;
    [shipLayer addAnimation:animation forKey:nil];
    
    
}
- (void)btnAction
{
    //create a keyframe animation
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"backgroundColor";
    animation.duration = 2.0;
    animation.values = @[
                         (__bridge id)[UIColor blueColor].CGColor,
                         (__bridge id)[UIColor redColor].CGColor,
                         (__bridge id)[UIColor greenColor].CGColor,
                         (__bridge id)[UIColor blueColor].CGColor ];
    //apply animation to layer
    [self.colorLayer addAnimation:animation forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
