//
//  AppDelegate.m
//  A0CrackMe
//
//  Created by andyhah on 2023/5/3.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 1. 创建window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];

    // 2. 创建 UITabBarController 控制器
    UITabBarController *tabBar = [[UITabBarController alloc] init];
    self.window.rootViewController = tabBar;
    
    // a 创建子控制器，题目
    ViewController *vcCrack = [[ViewController alloc] init];

    UINavigationController *navCrack = [[UINavigationController alloc] initWithRootViewController:vcCrack];
    navCrack.view.backgroundColor=[UIColor grayColor];
    navCrack.tabBarItem.title = @"CrackMe";
    navCrack.tabBarItem.image = [UIImage imageNamed:@"mid_finger_joker"];
    
    // 添加子控制器
    [tabBar addChildViewController:navCrack];
    
    
    
    // 显示window窗口
    [self.window makeKeyAndVisible];
    
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options  API_AVAILABLE(ios(13.0)){
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions  API_AVAILABLE(ios(13.0)){
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
