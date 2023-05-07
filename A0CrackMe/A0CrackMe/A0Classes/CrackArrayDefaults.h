//
//  CrackArrayDefaults.h
//  A0CrackMe
//
//  Created by andyhah on 2023/5/7.
//

#ifndef CrackArrayDefaults_h
#define CrackArrayDefaults_h

@interface CrackArrayDefaults : NSObject

- (NSMutableArray*)crackArray;
- (void) modifyCrackIsPass:(NSString*)defaultsName title:(NSString*)title is_pass:(BOOL)is_pass;

@end

#endif /* CrackArrayDefaults_h */
