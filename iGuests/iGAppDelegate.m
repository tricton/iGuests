//
//  iGAppDelegate.m
//  iGuests
//
//  Created by admin on 10.01.13.
//  Copyright (c) 2013 tricton. All rights reserved.
//

#import "iGAppDelegate.h"

@implementation iGAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    iGEditDay *editPage = [[iGEditDay alloc] init];
    iGStartPageViewController *mainPage = [[iGStartPageViewController alloc] init];
    iGGraphs *graphsPage = [[iGGraphs alloc] init];
    iGSettings *settingsPage = [[iGSettings alloc] init];
    iGHelp *helpPage = [[iGHelp alloc] init];
    
    UITabBarController *mainTabBar = [[UITabBarController alloc] init];
    UITabBar *tabBar = [UITabBar appearance];
    
    [tabBar setBackgroundImage:[UIImage imageNamed:@"tabBarBackground"]];
    [tabBar setSelectionIndicatorImage:[UIImage imageNamed:@"selectedBackground"]];
    
    NSArray *pagesOfControllers = [NSArray arrayWithObjects:editPage, mainPage, graphsPage, settingsPage, helpPage, nil];

    [mainTabBar setViewControllers:pagesOfControllers];
    [mainTabBar setSelectedViewController:mainPage];    
    
    [self.window setRootViewController:mainTabBar];
    
    NSArray *selectedImages = [NSArray arrayWithObjects:[UIImage imageNamed:@"editPictogramm30x30"],
                                                        [UIImage imageNamed:@"calendarPage30x30"],
                                                        [UIImage imageNamed:@"graph30x30"],
                                                        [UIImage imageNamed:@"settings30x30"],
                                                        [UIImage imageNamed:@"help30x30"],nil];
    NSArray *unselectedImages = [NSArray arrayWithObjects:[UIImage imageNamed:@"editPictogramm-unselected30x30"],
                                                          [UIImage imageNamed:@"calendarPage-unselected30x30"],
                                                          [UIImage imageNamed:@"graph30x30-unsel"],
                                                          [UIImage imageNamed:@"settings30x30-unsel"],
                                                          [UIImage imageNamed:@"help30x30-unsel"],nil];
    
    NSArray *items = mainTabBar.tabBar.items;
    
    for (int i = 0; i < items.count; i++){
        UITabBarItem *tabBarItem = [items objectAtIndex:i];
        
        UIImage *editPageImageSelected = [selectedImages objectAtIndex:i];
        UIImage *editPageImageUnselected = [unselectedImages objectAtIndex:i];
        
        [tabBarItem setFinishedSelectedImage:editPageImageSelected
                 withFinishedUnselectedImage:editPageImageUnselected];
    }
        
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
