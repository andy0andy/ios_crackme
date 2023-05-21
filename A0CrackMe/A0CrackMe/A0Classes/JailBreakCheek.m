//
//  JailBreakCheek.m
//  A0CrackMe
//
//  Created by andyhah on 2023/5/21.
//

#import <Foundation/Foundation.h>
#import <sys/stat.h>
#import <mach-o/loader.h>
#import <mach-o/dyld.h>
#import <mach-o/arch.h>
#import <objc/runtime.h>


#import "JailBreakCheek.h"


@implementation JailBreakCheek

+ (Boolean) isPhone{
    // 判断是否是真机
    
    Boolean result = TRUE;
    
    // TARGET_OS_IPHONE 真机
    // TARGET_IPHONE_SIMULATOR 模拟器
    if(TARGET_IPHONE_SIMULATOR){
        result = FALSE;
    }
    
    return result;
}

+ (Boolean) isStatPath{
    // 使用stat检测敏感路径
    
    Boolean result = FALSE;

    
    // 敏感路径
    NSArray* jbPaths = @[
        @"/Applications/Cydia.app",
        @"/usr/sbin/sshd",
        @"/bin/bash",
        @"/etc/apt",
        @"/Library/MobileSubstrate",
        @"/User/Applications/"
    ];
    
    for(NSString* jbPath in jbPaths){
        char jbPathChar[jbPath.length];
        memcpy(jbPathChar, [jbPath cStringUsingEncoding:NSUTF8StringEncoding], jbPath.length);
        
        struct stat stat_info;
        
        // stat判断文件是否存在, 返回0则为获取成功，-1为获取失败
        NSInteger status = stat(jbPathChar, &stat_info);
        NSLog(@"stat>> %@ -> %ld", jbPath, (long)status);
        if(0 == status){
            result = TRUE;
        }
    };
    
    
    return result;
}

+ (Boolean)isDylib{
    // 检查非法动态库
    Boolean result = FALSE;
    
    NSArray* illegalDylibs = @[
        @"/Library/MobileSubstrate/MobileSubstrate.dylib",
    ];
    
    
    for(int i=0;i<_dyld_image_count();i++){
        const char* name = _dyld_get_image_name(i);
        NSString* dylib_path = [NSString stringWithFormat:@"%s", name];
        NSLog(@"已加载dylib>> %s", name);
        
        for(NSString* illegalDylib in illegalDylibs){
            if ([dylib_path isEqual:illegalDylib]){
                result = TRUE;
            }
        }
    }
    
    return result;
    
    
}


@end

