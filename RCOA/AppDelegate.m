//
//  AppDelegate.m
//  RCOA
//
//  Created by dengdongyang on 17/3/20.
//  Copyright © 2017年 dengdongyang. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()<RCIMUserInfoDataSource>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    ViewController *myTestChatVc = [[ViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:myTestChatVc];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    [[RCIM sharedRCIM] initWithAppKey:@"0vnjpoadn2viz"];
    [self connectServer];
    [[RCIM sharedRCIM] setUserInfoDataSource:self];
    [RCIM sharedRCIM].currentUserInfo = [[RCUserInfo alloc] initWithUserId:@"1" name:@"章鱼哥" portrait:@"http://downhdlogo.yy.com/hdlogo/640640/640/640/69/0387691937/u3876919371md9Q4MB.jpg?20160704144001"];
    return YES;
}
-(void)connectServer{
    [[RCIM sharedRCIM] connectWithToken:@"WfN1FmbOl5fLWEZTVz16fukO5+j1V0lVQ3uWNUigYq0oiWZlokYp3JSfqQhacSO+tzdYo2BUyGFqV6jkEuLqOA=="     success:^(NSString *userId) {
        NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
    } error:^(RCConnectErrorCode status) {
        NSLog(@"登陆的错误码为:%ld", status);
    } tokenIncorrect:^{
        //token过期或者不正确。
        //如果设置了token有效期并且token过期，请重新请求您的服务器获取新的token
        //如果没有设置token有效期却提示token错误，请检查您客户端和服务器的appkey是否匹配，还有检查您获取token的流程。
        NSLog(@"token错误");
    }];
}

-(void)getUserInfoWithUserId:(NSString *)userId completion:(void (^)(RCUserInfo *))completion{
     if ([userId isEqualToString:@"2"]){
        RCUserInfo *userInfo = [[RCUserInfo alloc] initWithUserId:@"2" name:@"派大星" portrait:@"http://www.asiafinance.cn/u/cms/www/201512/min22142854s8f9.jpg"];
        completion(userInfo);

    }else if ([userId isEqualToString:@"3"]){
        RCUserInfo *userInfo = [[RCUserInfo alloc] initWithUserId:@"3" name:@"海绵宝宝" portrait:@"http://i.dimg.cc/0a/fe/28/8b/2d/78/b5/b0/5e/15/32/35/2e/5d/1e/ec.jpg"];
        completion(userInfo);
    }
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
