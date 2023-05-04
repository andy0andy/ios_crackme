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
    

    // crack 数组，遍历展示
    NSMutableArray* crackArr = [self crackArray];
    
    for (id arrDict in crackArr){
        UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, SCREENWIDTH, 100)];
        btn.backgroundColor = arrDict[@"is_pass"] ? passColor : notPassColor; // 按钮颜色
        btn.titleLabel.font = [UIFont systemFontOfSize:16.0]; // 字体大小
        [btn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal]; // 字体颜色
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft; // 文字水平居左
        btn.contentEdgeInsets = UIEdgeInsetsMake(40,10, 0, 0);
        [btn setTitle:arrDict[@"desc"] forState:UIControlStateNormal];

        [btn addTarget:self action:@selector(jumpAction:) forControlEvents:UIControlEventTouchUpInside]; // 跳转md5视图
        self.navigationItem.hidesBackButton=NO;

        [self.view addSubview:btn];
    };
    
    
}

- (void)jumpAction:(UIButton*)btn{
    /*
     jump new view
     */
    
    Md5ViewController *vcMd5 = [[Md5ViewController alloc] init];
    
    //pushViewController调用
    [self.navigationController pushViewController:vcMd5 animated:YES];
}

- (NSMutableArray*)crackArray{
    /*
     return all button list
     */
    
    NSMutableArray* arr = [[NSMutableArray alloc] initWithCapacity:0];
    
    // md5
    NSDictionary* md5Dict = @{
        @"is_pass": @false,
        @"title": @"MD5",
        @"desc": @"md5字符串检测",
    };
    [arr addObject:md5Dict];
    
    return arr;
}

@end
