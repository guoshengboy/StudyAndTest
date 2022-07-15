//
//  AppDelegate.m
//  TestAndStudy
//
//  Created by 曹国盛 on 2022/6/9.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] init];

    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    self.window.rootViewController = nav;
    if (@available(iOS 15.0, *)) {
        UINavigationBarAppearance *appear = [[UINavigationBarAppearance alloc] init];
        [appear setBackgroundColor:[UIColor greenColor]];
        nav.navigationBar.standardAppearance = appear;
        nav.navigationBar.scrollEdgeAppearance = appear;
//        nav.navigationBar.compactAppearance = appear;
//        nav.navigationBar.compactScrollEdgeAppearance = appear;
    }else{
        
    }
    [self.window makeKeyAndVisible];
    
    return YES;
}



@end
