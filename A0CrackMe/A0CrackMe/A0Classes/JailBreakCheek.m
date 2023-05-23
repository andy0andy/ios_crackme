//
//  JailBreakCheek.m
//  A0CrackMe
//
//  Created by andyhah on 2023/5/21.
//

#import <Foundation/Foundation.h>
#import <sys/stat.h>
#import <mach-o/dyld.h>
#import <UIKit/UIKit.h>
#import <sys/sysctl.h>


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

+ (Boolean)isOpenJailApp{
    // 检测能否启动越狱app
    
    Boolean result = FALSE;
    
    NSArray* appNames = @[
        @"com.saurik.Cydia",
        @"com.tigisoftware.Filza",
    ];
    
    for(NSString* appName in appNames){
        NSString* appStr = [NSString stringWithFormat: @"cydia://package/%@", appName];
        NSLog(@"越狱app>> %@", appStr);
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString: appStr]]){
            result = TRUE;
        };
    };
    
    return result;
}




+ (Boolean)isOpenJailFile{
    // 检测能否启动越狱file
    Boolean result = FALSE;
    
    NSArray* jbFiles = @[
        @"/Application/Cydia.app",
        @"/Library/MobileSubstrate/MobileSubstrate.dylib",
        @"/bin/bash",
        @"/usr/sbin/sshd",
        @"/etc/apt",
        @"/usr/bin/ssh",
        @"/private/var/lib/apt",
        @"/private/var/lib/cydia",
        @"/private/var/tmp/cydia.log",
        @"/Applications/WinterBoard.app",
        @"/var/lib/cydia",
        @"/private/etc/dpkg/origins/debian",
        @"/bin.sh",
        @"/private/etc/apt",
        @"/etc/ssh/sshd_config",
        @"/private/etc/ssh/sshd_config",
        @"/Applications/SBSetttings.app",
        @"/private/var/mobileLibrary/SBSettingsThemes/",
        @"/private/var/stash",
        @"/usr/libexec/sftp-server",
        @"/usr/libexec/cydia/",
        @"/usr/sbin/frida-server",
        @"/usr/bin/cycript",
        @"/usr/local/bin/cycript",
        @"/usr/lib/libcycript.dylib",
        @"/System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist",
        @"/System/Library/LaunchDaemons/com.ikey.bbot.plist",
        @"/Applications/FakeCarrier.app",
        @"/Library/MobileSubstrate/DynamicLibraries/Veency.plist",
        @"/Library/MobileSubstrate/DynamicLibraries/LiveClock.plist",
        @"/usr/libexec/ssh-keysign",
        @"/usr/libexec/sftp-server",
        @"/Applications/blackra1n.app",
        @"/Applications/IntelliScreen.app",
        @"/Applications/Snoop-itConfig.app",
        @"/var/lib/dpkg/info",
    ];
    
    NSFileManager* nsfm = [NSFileManager defaultManager];
    
    for(NSString* jbFile in jbFiles){
        
        FILE* f = fopen([jbFile UTF8String], "r");
        if (f != nil){
            
            if([nsfm fileExistsAtPath:jbFile isDirectory:FALSE] || [nsfm fileExistsAtPath:jbFile isDirectory:(bool*)TRUE]){
                result = TRUE;
                NSLog(@"越狱file>> %@", jbFile);
            }
            
        }
        fclose(f);
        
    }
    
    
    return result;
}

+ (Boolean)isWritePrivatePath{
    // 检测能否写入私有路径
    Boolean result = FALSE;
    
    NSString *path = @"/private/hah.txt";
    NSFileManager *fileManager = [NSFileManager defaultManager];
    @try {
        NSError* error;
        NSString *txt = @"jailbreak...";
        [txt writeToFile:path atomically:NO encoding:NSStringEncodingConversionAllowLossy error:&error];
        [fileManager removeItemAtPath:path error:nil];
        if(error==nil)
        {
            result = TRUE;
        }

    } @catch (NSException *exception) {}
    
    return result;
}

+ (Boolean)isLstatAtLnk{
    // 检测文件路径是否存在，是否是路径链接
    Boolean result = FALSE;
    
    NSArray* jbPaths = @[
        @"/Applications",
        @"/var/stash/Library/Ringtones",
        @"/var/stash/Library/Wallpaper",
        @"/var/stash/usr/include",
        @"/var/stash/usr/libexec",
        @"/var/stash/usr/share",
        @"/var/stash/usr/arm-apple-darwin9",
    ];
    
    struct stat stat_info;
    
    for(NSString* jbPath in jbPaths){
        char jbPathChar[jbPath.length];
        memcpy(jbPathChar, [jbPath cStringUsingEncoding:NSUTF8StringEncoding], jbPath.length);
        
        if (lstat(jbPathChar, &stat_info)){
            if(stat_info.st_mode & S_IFLNK){
                result = TRUE;
                NSLog(@"是路径链接>> %@", jbPath);
            }
        }
    }
    
    return result;
    
}

+ (Boolean)isForkSub{
    // 能否fork子进程
    Boolean result = FALSE;
    
    int pid = fork();
    if(!pid){
        exit(1);
    }
    if(pid >= 0){
        result = TRUE;
    }
    
    return result;
}

+ (Boolean)isExceptClass{
    // 检测是否有异常类
    
    Boolean result = FALSE;
    
    NSArray* claes = @[
        @"HBPreferences",
    ];
    for(NSString* cla in claes){
        if(NSClassFromString(cla) != NULL){
            result = TRUE;
            NSLog(@"异常类>> %@", cla);
        }
    }
    
    return result;
}

+ (Boolean)isCheekEnv{
    // 查看是否有环境变量
    Boolean result = FALSE;
    
    NSString* str = @"DYLD_INSERT_LIBRARIES";
    char strChar[str.length];
    memcpy(strChar, [str cStringUsingEncoding:NSUTF8StringEncoding], str.length);
    result = !(NULL == getenv(strChar));
    
    return result;
}

+ (Boolean)isDebugged{
    // 当前进程是否是debug模式
    
    int junk;
    int mib[4];
    struct kinfo_proc info;
    size_t size;
    info.kp_proc.p_flag = 0;
    mib[0] = CTL_KERN;
    mib[1] = KERN_PROC;
    mib[2] = KERN_PROC_PID;
    mib[3] = getpid();
    size = sizeof(info);
    junk = sysctl(mib, sizeof(mib) / sizeof(*mib), &info, &size, NULL, 0);
    assert(junk == 0);
    return ( (info.kp_proc.p_flag & P_TRACED) != 0 );
}

@end

