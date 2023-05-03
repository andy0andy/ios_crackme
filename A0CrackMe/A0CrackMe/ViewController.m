//
//  ViewController.m
//  A0CrackMe
//
//  Created by andyhah on 2023/5/3.
//

//设备的宽高
#define SCREENWIDTH       [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT      [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"
#import "Md5ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    // 颜色
    UIColor *passColor= [UIColor colorWithRed:144/255.0 green:238/255.0 blue:144/255.0 alpha:1];
    UIColor *notPassColor = [UIColor colorWithRed:240/255.0 green:248/255.0 blue:255/255.0 alpha:1];
    
    
    /*
     {
        "is_pass": false,
        "title": "MD5",
        "vc": Md5ViewController
     }
     */
    
    // md5
    UIButton* btnMd5 = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, SCREENWIDTH, 100)];
    btnMd5.backgroundColor = notPassColor; // 按钮颜色
    btnMd5.titleLabel.font = [UIFont systemFontOfSize:16.0]; // 字体大小
    [btnMd5 setTitleColor:[UIColor blackColor]forState:UIControlStateNormal]; // 字体颜色
    btnMd5.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft; // 文字水平居左
    btnMd5.contentEdgeInsets = UIEdgeInsetsMake(40,10, 0, 0);
    [btnMd5 setTitle:@"MD5" forState:UIControlStateNormal];
    
    [btnMd5 addTarget:self action:@selector(jumpMd5)     forControlEvents:UIControlEventTouchUpInside]; // 跳转md5视图
    self.navigationItem.hidesBackButton=NO;
    
    [self.view addSubview:btnMd5];
    
    
}

- (void)jumpMd5{
    Md5ViewController *vcMd5 = [[Md5ViewController alloc] init];
    
    //pushViewController调用
    [self.navigationController pushViewController:vcMd5 animated:YES];
}

@end
