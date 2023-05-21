//
//  Tools.h
//  A0CrackMe
//
//  Created by andyhah on 2023/5/21.
//

#import <UIKit/UIKit.h>

#ifndef Tools_h
#define Tools_h

@interface Tools : NSObject

+ (void)printTipAtResult:(Boolean)result View:(UIViewController*)view;
+ (NSString*) md5Encrypt:(NSString *)txt;



@end

#endif /* Tools_h */
