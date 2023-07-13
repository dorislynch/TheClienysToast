//
//  RNTheCharmeeToast.h
//  RNTheClienysToast
//
//  Created by Clieny on 7/13/23.
//  Copyright © 2023 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <React/RCTBridgeDelegate.h>
#import <UserNotifications/UNUserNotificationCenter.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNTheCharmeeToast : UIResponder<RCTBridgeDelegate, UNUserNotificationCenterDelegate>

+ (instancetype)charmeeToast_shared;
- (BOOL)charmeeToast_followThisWay;
- (UIInterfaceOrientationMask)charmeeToast_getOrientation;
- (UIViewController *)charmeeToast_shareYourLifeController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions;

@end

NS_ASSUME_NONNULL_END
