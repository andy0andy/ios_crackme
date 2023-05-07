//
//  UIButton+CrackTitle.m
//  A0CrackMe
//
//  Created by andyhah on 2023/5/4.
//

#import <Foundation/Foundation.h>
#import "UIButton+CrackTitle.h"
#import <objc/runtime.h>

@implementation UIButton (CrackTitle)

- (void)setCrackTit:(NSString *)crackTit{
    objc_setAssociatedObject(self, @selector(crackTit), crackTit, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString*)crackTit{
    return objc_getAssociatedObject(self, _cmd);
}

@end

