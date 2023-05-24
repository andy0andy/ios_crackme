//
//  Tools.m
//  A0CrackMe
//
//  Created by andyhah on 2023/5/21.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

#import "Tools.h"

@implementation Tools

+ (void)printTipAtResult:(Boolean)result View:(UIViewController*)view{
    
    if (result){
        
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"通知" message:@"通过检测^.^" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){}];
        
        [alert addAction:defaultAction];
        [view presentViewController:alert animated:YES completion:nil];
    }else{
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"通知" message:@"未通过检测T.T" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){}];
        
        [alert addAction:defaultAction];
        [view presentViewController:alert animated:YES completion:nil];
    }
    
}


+ (NSString*) md5Encrypt:(NSString *)txt{
    
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

