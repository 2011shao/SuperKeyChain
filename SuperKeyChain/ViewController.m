//
//  ViewController.m
//  SuperKeyChain
//
//  Created by ios-少帅 on 16/9/1.
//  Copyright © 2016年 ios-shaoshuai. All rights reserved.
//

#import "ViewController.h"
#import "SuperKeyChain.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [SuperKeyChain saveUserAccount:@"zhanghao" userPswed:@"mima"];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
