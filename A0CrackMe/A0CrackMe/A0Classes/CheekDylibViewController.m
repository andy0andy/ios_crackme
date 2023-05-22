//
//  CheekDylibViewController.m
//  A0CrackMe
//
//  Created by andyhah on 2023/5/21.
//

//设备的宽
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define FLAG @"jailBreakCheekDylib"

#import <Foundation/Foundation.h>

#import "CheekDylibViewController.h"
#import "JailBreakCheek.h"
#import "CrackArrayDefaults.h"
#import "Tools.h"

@interface CheekDylibViewController ()

@end

@implementation CheekDylibViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel* desc = [[UILabel alloc] initWithFrame:CGRectMake((SCREENWIDTH-400)/2, 100, 400, 50)];
    [desc setText:@"检测是否含有越狱 dylib"];
    desc.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:desc];
    
    
    UIButton* submit = [[UIButton alloc] initWithFrame:CGRectMake((SCREENWIDTH-400)/2, 200, 400, 50)];
    [submit setTitle:@"提交" forState:UIControlStateNormal];
    [submit setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    submit.backgroundColor = [UIColor colorWithRed:255/255.0 green:239/255.0 blue:213/255.0 alpha:1];
    [self.view addSubview:submit];
    
    // 点击事件
    [submit addTarget:self action:@selector(check) forControlEvents:UIControlEventTouchUpInside];
}


- (void)check{
    
    Boolean result = [JailBreakCheek isDebugged];
    if (!result){
        // 改变值
        [[CrackArrayDefaults alloc] modifyCrackIsPass:nil flag:FLAG is_pass:true];
    }
    [Tools printTipAtResult:!result View:self];
    
    
}

@end

