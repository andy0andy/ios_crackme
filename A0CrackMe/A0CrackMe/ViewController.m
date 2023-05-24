//
//  ViewController.m
//  A0CrackMe
//
//  Created by andyhah on 2023/5/3.
//

//设备的宽高
#define SCREENWIDTH       [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT      [UIScreen mainScreen].bounds.size.height

#import <UIKit/UIKit.h>

#import "ViewController.h"
#import "A0Classes/Md5ViewController.h"
#import "A0Classes/UIButton+CrackTitle.h"
#import "A0Classes/CrackArrayDefaults.h"
#import "A0Classes/CheekStatViewController.h"
#import "A0Classes/CheekIphoneViewController.h"
#import "A0Classes/CheekDylibViewController.h"
#import "A0Classes/CheekOpenJailAppViewController.h"
#import "A0Classes/CheekOpenJailFileViewController.h"
#import "A0Classes/CheekWritePrivatePathViewController.h"
#import "A0Classes/CheekLstatAtLnkViewController.h"
#import "A0Classes/CheekForkSubViewController.h"
#import "A0Classes/CheekExceptClassViewController.h"
#import "A0Classes/CheekCheekEnvViewController.h"
#import "A0Classes/CheekDebuggedViewController.h"

@interface ViewController ()

@property (retain, nonatomic) UIScrollView* scrollView;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // view will happen
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 颜色
    UIColor *passColor= [UIColor colorWithRed:144/255.0 green:238/255.0 blue:144/255.0 alpha:1];
    UIColor *notPassColor = [UIColor colorWithRed:240/255.0 green:248/255.0 blue:255/255.0 alpha:1];
    
    // crack 数组，遍历展示
    NSMutableArray* crackArr = [[CrackArrayDefaults alloc] crackArray];
    
    // 创建UIScrollView
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    // 设置画布大小，一般比frame大
    _scrollView.contentSize = CGSizeMake(SCREENWIDTH, 80*crackArr.count);
    // 设置内边距 ? 回退导致滚动时图扩大
    _scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    _scrollView.bounces = NO;
    
    [self.view addSubview:_scrollView];
    
    for (NSInteger i=0; i < crackArr.count; i++){
        NSDictionary* arrDict = crackArr[i];
        
        UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(0, i*80, SCREENWIDTH, 80)];
        btn.backgroundColor = [arrDict[@"is_pass"] isEqual:@true] ? passColor : notPassColor; // 按钮颜色
        btn.titleLabel.font = [UIFont systemFontOfSize:18.0]; // 字体大小
        [btn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal]; // 字体颜色
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft; // 文字水平居左
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [btn setTitle:[NSString stringWithFormat:@"%ld. %@",i+1,arrDict[@"desc"]] forState:UIControlStateNormal];
        [btn.layer setCornerRadius:12];  // 设置圆角的半径
        [btn.layer setBorderWidth:1.0]; // 设置边框的粗细

        btn.crackTit = arrDict[@"flag"];  // 传入flag，以便查询跳转指定view
        [btn addTarget:self action:@selector(jumpAction:) forControlEvents:UIControlEventTouchUpInside]; // 跳转视图
        self.navigationItem.hidesBackButton=NO;

        [_scrollView addSubview:btn];
    };
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (void)jumpAction:(UIButton*)btn{
    /*
     jump new view
     */

    // title: view; map
    // 同 arr 增加键值对
    NSDictionary* vcMap = @{
        @"md5String": [[Md5ViewController alloc] init],
        @"jailBreakCheekStat": [[CheekStatViewController alloc] init],
        @"jailBreakCheekIphone": [[CheekIphoneViewController alloc] init],
        @"jailBreakCheekDylib": [[CheekDylibViewController alloc] init],
        @"jailBreakCheekOpenJailApp": [[CheekOpenJailAppViewController alloc] init],
        @"jailBreakCheekOpenJailFile": [[CheekOpenJailFileViewController alloc] init],
        @"jailBreakCheekWritePrivatePath": [[CheekWritePrivatePathViewController alloc] init],
        @"jailBreakCheekLstatAtLnk": [[CheekLstatAtLnkViewController alloc] init],
        @"jailBreakCheekForkSub": [[CheekForkSubViewController alloc] init],
        @"jailBreakCheekExceptClass": [[CheekExceptClassViewController alloc] init],
        @"jailBreakCheekCheekEnv": [[CheekCheekEnvViewController alloc] init],
        @"jailBreakCheekDebugged": [[CheekDebuggedViewController alloc] init],
    };
    
    //pushViewController调用
    [self.navigationController pushViewController:vcMap[btn.crackTit] animated:YES];
}



@end
