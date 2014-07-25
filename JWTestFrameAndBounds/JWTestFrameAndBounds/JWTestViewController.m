//
//  JWTestViewController.m
//  JWTestFrameAndBounds
//
//  Created by JackWong on 14/7/25.
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
    
    UIView *parentView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 280, 250)];
    parentView.bounds = CGRectMake(-20, -20, 280, 250);
    parentView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:parentView];
    
    UIView *childView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 100, 100)];
    childView.backgroundColor = [UIColor yellowColor];
    [parentView addSubview:childView];
    
    NSLog(@"parentView frame :%@ ###### parentView bounds :%@",NSStringFromCGRect(parentView.frame),NSStringFromCGRect(parentView.bounds));
    NSLog(@"childView frame :%@ ###### childView bounds :%@",NSStringFromCGRect(childView.frame),NSStringFromCGRect(childView.bounds));
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
