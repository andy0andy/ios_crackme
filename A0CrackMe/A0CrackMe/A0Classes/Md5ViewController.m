//
//  Md5ViewController.m
//  A0CrackMe
//
//  Created by andyhah on 2023/5/3.
//

//设备的宽高
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define KEY @"andyhah"
#define TITLE @"MD5"

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import "Md5ViewController.h"
#import "CrackArrayDefaults.h"

@interface Md5ViewController ()

@end

@implementation Md5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel* desc = [[UILabel alloc] initWithFrame:CGRectMake((SCREENWIDTH-400)/2, 100, 400, 50)];
    [desc setText:@"请输入md5字符串，并提交验证"];
    desc.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:desc];
    
    self.input = [[UITextField alloc] initWithFrame:CGRectMake((SCREENWIDTH-400)/2, 200, 400, 50)];
    self.input.borderStyle = UITextBorderStyleRoundedRect;
    self.input.placeholder = @"请输入...";
    self.input.clearsOnBeginEditing = YES;
    [self.view addSubview:self.input];

    
    
    UIButton* submit = [[UIButton alloc] initWithFrame:CGRectMake((SCREENWIDTH-100)/2, 300, 100, 40)];
    [submit setTitle:@"提交" forState:UIControlStateNormal];
    [submit setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    submit.backgroundColor = [UIColor colorWithRed:255/255.0 green:239/255.0 blue:213/255.0 alpha:1];
    [self.view addSubview:submit];
    
    // 点击事件
    [submit addTarget:self action:@selector(check) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)check{
    
    NSString* secret = [self md5Encrypt:KEY];
    
    NSString* ipt_txt = self.input.text;
    ipt_txt = [ipt_txt stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

    
    if ([ipt_txt isEqualToString:secret]){

        // 改变值
        [[CrackArrayDefaults alloc] modifyCrackIsPass:nil title:TITLE is_pass:true];
        
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"通知" message:@"输入正确^.^" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }else{
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"通知" message:@"输入失败T.T" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    
}

- (NSString*) md5Encrypt:(NSString *)txt{
    
    const char *cStr = [txt UTF8String];
    unsigned char digest[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), digest);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++){
        [output appendFormat:@"%02x", digest[i]];
    }
    
    NSLog(@"[md5]>> %@ -> %@", txt, output);
    return output;
}

@end
