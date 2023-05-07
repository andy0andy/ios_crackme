//
//  UIButton+CrackTitle.h
//  A0CrackMe
//
//  Created by andyhah on 2023/5/4.
//

#import <UIKit/UIKit.h>

#ifndef UIButton_CrackTitle_h
#define UIButton_CrackTitle_h

/*
 给UIButton增加分类，以便点击事件传参
 */

@interface UIButton (CrackTitle)

@property (strong, nonatomic) NSString* crackTit;

@end

#endif /* UIButton_CrackTitle_h */
