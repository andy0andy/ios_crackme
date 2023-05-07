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
        NSDictionary* md5Dict = @{
            @"is_pass": @false,
            @"title": @"MD5",  // 对应 vcMap的key
            @"desc": @"md5字符串检测",
        };
        [arr addObject:md5Dict];
        
        // 保存进NSUserDefaults
        [defaults setObject:arr forKey:defaultsName];
        
        return arr;
    }
    
}


- (void) modifyCrackIsPass:(NSString*)defaultsName title:(NSString*)title is_pass:(BOOL)is_pass{
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
 
        
        if ([title isEqual:dict[@"title"]]){
            [dict setValue:[NSNumber numberWithBool:is_pass] forKey:@"is_pass"];
        }
    
        [arr addObject:dict];
    }
    
    [defaults setObject:arr forKey:defaultsName];
}

@end
