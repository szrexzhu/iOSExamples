//
//  ViewController.m
//  BlockExp
//
//  Created by Abc on 15/11/21.
//  Copyright (c) 2015年 rexzhu. All rights reserved.
//

#import "ViewController.h"

#import "ExamplesFromInternet.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [ExamplesFromInternet exampleB];
    [ExamplesFromInternet exampleC];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
