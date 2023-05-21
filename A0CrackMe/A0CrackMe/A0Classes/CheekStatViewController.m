//
//  CheekStatViewController.m
//  A0CrackMe
//
//  Created by andyhah on 2023/5/21.
//

//设备的宽
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define FLAG @"jailBreakCheekStat"

#import <Foundation/Foundation.h>

#import "CheekStatViewController.h"
#import "JailBreakCheek.h"
#import "CrackArrayDefaults.h"
#import "Tools.h"

@interface CheekStatViewController ()

@end

@implementation CheekStatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel* desc = [[UILabel alloc] initWithFrame:CGRectMake((SCREENWIDTH-400)/2, 100, 400, 50)];
    [desc setText:@"利用stat检测一些敏感路径，去过掉这些检测"];
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
    
    Boolean result = [JailBreakCheek isStatPath];
    if (!result){
        // 改变值
        [[CrackArrayDefaults alloc] modifyCrackIsPass:nil flag:FLAG is_pass:true];
    }
    [Tools printTipAtResult:!result View:self];
    
    
}

@end
