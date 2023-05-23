//
//  JailBreakCheek.h
//  A0CrackMe
//
//  Created by andyhah on 2023/5/21.
//

#ifndef JailBreakCheek_h
#define JailBreakCheek_h

@interface JailBreakCheek : NSObject

+ (Boolean) isPhone;
+ (Boolean)isStatPath;
+ (Boolean)isDylib;
+ (Boolean)isOpenJailApp;
+ (Boolean)isOpenJailFile;
+ (Boolean)isWritePrivatePath;
+ (Boolean)isLstatAtLnk;
+ (Boolean)isForkSub;
+ (Boolean)isExceptClass;
+ (Boolean)isCheekEnv;
+ (Boolean)isDebugged;

@end


#endif /* JailBreakCheek_h */
