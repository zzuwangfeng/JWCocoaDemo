//
//  JWTestViewController.m
//  JWDemoCocoaFrame
//
//  Created by JackWong on 14/7/27.
//  Copyright (c) 2014年 Jack Wong. All rights reserved.
//

#import "JWTestViewController.h"

@interface JWTestViewController ()

@end

@implementation JWTestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    UIView *oneView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 280, 250)];
//    parentView.bounds = CGRectMake(-20, -20, 280, 250);
    oneView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:oneView];
    
    UIView *secondView = [[UIView alloc] initWithFrame:CGRectInset(oneView.frame, 20, 20)];
    secondView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:secondView];
    
    
    UIView *thirdView = [[UIView alloc] initWithFrame:CGRectOffset(secondView.frame, 20, 20)];
    thirdView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:thirdView];
    
    UIView *fiveView = [[UIView alloc] initWithFrame:CGRectIntersection(secondView.frame, thirdView.frame)];
    fiveView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:fiveView];
    
    
    UIView *sixView = [[UIView alloc] initWithFrame:CGRectUnion(secondView.frame, thirdView.frame)];
    sixView.alpha = 0.5;
    sixView.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:sixView];
    
    CGRect standardize = CGRectMake(50, 50, -100, -100);
    UIView *fourView = [[UIView alloc] initWithFrame:CGRectStandardize(standardize)];
    fourView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:fourView];
    
    NSLog(@"%@",NSStringFromCGRect(fourView.frame));

    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
