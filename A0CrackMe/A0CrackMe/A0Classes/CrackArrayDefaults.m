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
