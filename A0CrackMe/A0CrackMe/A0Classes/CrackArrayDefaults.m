//
//  CrackArrayDefaults.m
//  A0CrackMe
//
//  Created by andyhah on 2023/5/7.
//

#import <Foundation/Foundation.h>
#import "CrackArrayDefaults.h"


@implementation CrackArrayDefaults

- (NSMutableArray*)crackArray{
    /*
     return all button list
     NSUserDefaults, 有就取出，无则初始化传入
     */

    // 获取实例
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    NSString* defaultsName = @"CrackArray";
    
    NSMutableArray* object = [defaults objectForKey:defaultsName];
    
    if (!!object){
        return object;
    }else{
        //初始化

        // 同 vcMap 数组元素
        NSMutableArray* arr = [[NSMutableArray alloc] initWithCapacity:0];

        // md5
        NSDictionary* md5String = @{
            @"is_pass": @false,
            @"title": @"Md5 string.",
            @"desc": @"md5字符串检测。",
            @"flag": @"md5String", // 对应 vcMap的key
        };
        [arr addObject:md5String];
        
        // 越狱检测 stat是否为系统库
        NSDictionary* jailBreakCheekIphone = @{
            @"is_pass": @false,
            @"title": @"Is real phone",
            @"desc": @"越狱检测：检测是否是真机",
            @"flag": @"jailBreakCheekIphone", // 对应 vcMap的key
        };
        [arr addObject:jailBreakCheekIphone];
        
        // 越狱检测 stat检测敏感路径
        NSDictionary* jailBreakCheekStat = @{
            @"is_pass": @false,
            @"title": @"Stat is exist path?",
            @"desc": @"越狱检测：利用stat来检测一些特定的文件权限。",
            @"flag": @"jailBreakCheekStat", // 对应 vcMap的key
        };
        [arr addObject:jailBreakCheekStat];
        
        // 越狱检测 检测注入动态库
        NSDictionary* jailBreakCheekDylib = @{
            @"is_pass": @false,
            @"title": @"Dylib legal?",
            @"desc": @"越狱检测：检查dylib是否合法。",
            @"flag": @"jailBreakCheekDylib", // 对应 vcMap的key
        };
        [arr addObject:jailBreakCheekDylib];
        
        // 越狱检测 检测能否启动越狱app
        NSDictionary* jailBreakCheekOpenJailApp = @{
            @"is_pass": @false,
            @"title": @"Open jailbreak app?",
            @"desc": @"越狱检测：检测能否启动越狱app。",
            @"flag": @"jailBreakCheekOpenJailApp", // 对应 vcMap的key
        };
        [arr addObject:jailBreakCheekOpenJailApp];
        
        // 越狱检测 检测能否启动越狱file
        NSDictionary* jailBreakCheekOpenJailFile = @{
            @"is_pass": @false,
            @"title": @"Open jailbreak file?",
            @"desc": @"越狱检测：检测能否启动越狱file。",
            @"flag": @"jailBreakCheekOpenJailFile", // 对应 vcMap的key
        };
        [arr addObject:jailBreakCheekOpenJailFile];
        
        // 越狱检测 检测能否写入私有路径
        NSDictionary* jailBreakCheekWritePrivatePath = @{
            @"is_pass": @false,
            @"title": @"Private path is writeable?",
            @"desc": @"越狱检测：检测能否写入私有路径。",
            @"flag": @"jailBreakCheekWritePrivatePath", // 对应 vcMap的key
        };
        [arr addObject:jailBreakCheekWritePrivatePath];
        
        
        // 越狱检测 检测文件路径是否存在，是否是路径链接
        NSDictionary* jailBreakCheekLstatAtLnk = @{
            @"is_pass": @false,
            @"title": @"Path is link?",
            @"desc": @"越狱检测：检测文件路径是否真实存在。",
            @"flag": @"jailBreakCheekLstatAtLnk", // 对应 vcMap的key
        };
        [arr addObject:jailBreakCheekLstatAtLnk];
        
        // 越狱检测 能否fork子进程
        NSDictionary* jailBreakCheekForkSub = @{
            @"is_pass": @false,
            @"title": @"Can you fork sub process?",
            @"desc": @"越狱检测：能否fork子进程。",
            @"flag": @"jailBreakCheekForkSub", // 对应 vcMap的key
        };
        [arr addObject:jailBreakCheekForkSub];
        
        // 越狱检测 检测是否有异常类
        NSDictionary* jailBreakCheekExceptClass = @{
            @"is_pass": @false,
            @"title": @"Cheek except class.",
            @"desc": @"越狱检测：检测是否有异常类。",
            @"flag": @"jailBreakCheekExceptClass", // 对应 vcMap的key
        };
        [arr addObject:jailBreakCheekExceptClass];
        
        // 越狱检测 查看是否有环境变量
        NSDictionary* jailBreakCheekCheekEnv = @{
            @"is_pass": @false,
            @"title": @"env var?",
            @"desc": @"越狱检测：查看是否有环境变量。",
            @"flag": @"jailBreakCheekCheekEnv", // 对应 vcMap的key
        };
        [arr addObject:jailBreakCheekCheekEnv];
        
        // 越狱检测 当前进程是否是debug模式
        NSDictionary* jailBreakCheekDebugged = @{
            @"is_pass": @false,
            @"title": @"Current process is debugger?",
            @"desc": @"越狱检测：当前进程是否是debug模式。",
            @"flag": @"jailBreakCheekDebugged", // 对应 vcMap的key
        };
        [arr addObject:jailBreakCheekDebugged];
        
        
        // 保存进NSUserDefaults
        [defaults setObject:arr forKey:defaultsName];
        
        return arr;
    }
    
}


- (void) modifyCrackIsPass:(NSString*)defaultsName flag:(NSString*)flag is_pass:(BOOL)is_pass{
    if (!defaultsName){
        defaultsName = @"CrackArray";
    }
    

    // 获取实例
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];

    
    NSMutableArray* object = [defaults objectForKey:defaultsName];
    if (!object){
        return;
    }
    
    NSMutableArray* arr = [[NSMutableArray alloc] initWithCapacity:0];
    
    for(NSInteger i=0;i<object.count; i++){
        // 读取相关的数据后 没有alloc 崩溃的话 可能是因为这块指针指向的问题
        NSMutableDictionary* dict = [NSMutableDictionary dictionaryWithDictionary:object[i]];
 
        
        if ([flag isEqual:dict[@"flag"]]){
            [dict setValue:[NSNumber numberWithBool:is_pass] forKey:@"is_pass"];
        }
    
        [arr addObject:dict];
    }
    
    [defaults setObject:arr forKey:defaultsName];
}

@end
