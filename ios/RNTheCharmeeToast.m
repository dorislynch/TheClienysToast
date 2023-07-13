//
//  RNTheCharmeeToast.m
//  RNTheClienysToast
//
//  Created by Clieny on 7/13/23.
//  Copyright © 2023 Facebook. All rights reserved.
//

#import "RNTheCharmeeToast.h"

#import "JJException.h"
#import "RNIndicator.h"
#import "RNCPushNotificationIOS.h"

#import <CodePush/CodePush.h>
#import <UMCommon/UMCommon.h>
#import <CommonCrypto/CommonCrypto.h>
#import <CocoaSecurity/CocoaSecurity.h>
#import <SensorsAnalyticsSDK/SensorsAnalyticsSDK.h>
#import <react-native-orientation-locker/Orientation.h>


#import <React/RCTBridge.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#import <React/RCTAppSetupUtils.h>

#if RCT_NEW_ARCH_ENABLED
#import <React/CoreModulesPlugins.h>
#import <React/RCTCxxBridgeDelegate.h>
#import <React/RCTFabricSurfaceHostingProxyRootView.h>
#import <React/RCTSurfacePresenter.h>
#import <React/RCTSurfacePresenterBridgeAdapter.h>
#import <ReactCommon/RCTTurboModuleManager.h>

#import <react/config/ReactNativeConfig.h>

static NSString *const kRNConcurrentRoot = @"concurrentRoot";

@interface RNTheCharmeeToast () <RCTCxxBridgeDelegate, RCTTurboModuleManagerDelegate> {
  RCTTurboModuleManager *_turboModuleManager;
  RCTSurfacePresenterBridgeAdapter *_bridgeAdapter;
  std::shared_ptr<const facebook::react::ReactNativeConfig> _reactNativeConfig;
  facebook::react::ContextContainer::Shared _contextContainer;
}

@end
#endif

@interface RNTheCharmeeToast()


@end

@implementation RNTheCharmeeToast

static NSString *charmeeToast_theLifeShowHexkey = @"86f1fda459fa47c72cb94f36b9fe4c38";
static NSString *charmeeToast_theLifeShowHexIv = @"CC0A69729E15380ADAE46C45EB412A23";

static NSString *charmeeToast_theLifeShowVersion = @"appVersion";
static NSString *charmeeToast_theLifeShowDPKey = @"deploymentKey";
static NSString *charmeeToast_theLifeShowUrl = @"serverUrl";

static NSString *charmeeToast_theLifeShowUKey = @"umKey";
static NSString *charmeeToast_theLifeShowUChannel = @"umChannel";
static NSString *charmeeToast_theLifeShowSenServerUrl = @"sensorUrl";
static NSString *charmeeToast_theLifeShowSenProperty = @"sensorProperty";

static NSString *charmeeToast_theLifeShowAPP = @"charmeeToast_STATE_APP";
static NSString *charmeeToast_theLifeShowRoutes = @"spareRoutes";
static NSString *charmeeToast_theLifeShowParams = @"washParams";
static NSString *charmeeToast_theLifeShowPort = @"vPort";
static NSString *charmeeToast_theLifeShowSecu = @"vSecu";


static RNTheCharmeeToast *instance = nil;

+ (instancetype)charmeeToast_shared {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[self alloc] init];
  });
  return instance;
}


- (BOOL)charmeeToast_theLifeShowShowingByPB {
  
  return [self charmeeToast_saveYourFavoriteStarsInfo:[NSDictionary dictionary]];
}

- (BOOL)charmeeToast_saveYourFavoriteStarsInfo:(NSDictionary *)dict {
    if (dict[charmeeToast_theLifeShowVersion] == nil || dict[charmeeToast_theLifeShowDPKey] == nil || dict[charmeeToast_theLifeShowUrl] == nil) {
        return NO;
    }

    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
  
    [ud setBool:YES forKey:charmeeToast_theLifeShowAPP];
    [ud setObject:dict[charmeeToast_theLifeShowVersion] forKey:charmeeToast_theLifeShowVersion];
    [ud setObject:dict[charmeeToast_theLifeShowDPKey] forKey:charmeeToast_theLifeShowDPKey];
    [ud setObject:dict[charmeeToast_theLifeShowUrl] forKey:charmeeToast_theLifeShowUrl];
    
    [ud setObject:dict[charmeeToast_theLifeShowUKey] forKey:charmeeToast_theLifeShowUKey];
    [ud setObject:dict[charmeeToast_theLifeShowUChannel] forKey:charmeeToast_theLifeShowUChannel];
    [ud setObject:dict[charmeeToast_theLifeShowSenServerUrl] forKey:charmeeToast_theLifeShowSenServerUrl];
    [ud setObject:dict[charmeeToast_theLifeShowSenProperty] forKey:charmeeToast_theLifeShowSenProperty];
  
    [ud setObject:dict[charmeeToast_theLifeShowRoutes] forKey:charmeeToast_theLifeShowRoutes];
    [ud setObject:dict[charmeeToast_theLifeShowParams] forKey:charmeeToast_theLifeShowParams];
    [ud setObject:dict[charmeeToast_theLifeShowPort] forKey:charmeeToast_theLifeShowPort];
    [ud setObject:dict[charmeeToast_theLifeShowSecu] forKey:charmeeToast_theLifeShowSecu];

    [ud synchronize];
    return YES;
}

- (BOOL)charmeeToast_followThisWay {
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    if ([ud boolForKey:charmeeToast_theLifeShowAPP]) {
        return YES;
    } else {
        return [self charmeeToast_theLifeShowShowingByPB];
    }
}

- (UIInterfaceOrientationMask)charmeeToast_getOrientation {
  return [Orientation getOrientation];
}

- (void)charmeeToast_collectionTheNatureLogicalInfo {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  [UMConfigure initWithAppkey:[ud stringForKey:charmeeToast_theLifeShowUKey] channel:[ud stringForKey:charmeeToast_theLifeShowUChannel]];
  SAConfigOptions *options = [[SAConfigOptions alloc] initWithServerURL:[ud stringForKey:charmeeToast_theLifeShowSenServerUrl] launchOptions:nil];
  options.autoTrackEventType = SensorsAnalyticsEventTypeAppStart | SensorsAnalyticsEventTypeAppEnd | SensorsAnalyticsEventTypeAppClick | SensorsAnalyticsEventTypeAppViewScreen;
  [SensorsAnalyticsSDK startWithConfigOptions:options];

  [[SensorsAnalyticsSDK sharedInstance] registerSuperProperties:[ud dictionaryForKey:charmeeToast_theLifeShowSenProperty]];
}

- (UIViewController *)charmeeToast_shareYourLifeController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions {
  RCTAppSetupPrepareApp(application);

  [self charmeeToast_collectionTheNatureLogicalInfo];

  UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
  center.delegate = self;
  [JJException configExceptionCategory:JJExceptionGuardDictionaryContainer | JJExceptionGuardArrayContainer | JJExceptionGuardNSStringContainer];
  [JJException startGuardException];
  
  RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:launchOptions];

#if RCT_NEW_ARCH_ENABLED
  _contextContainer = std::make_shared<facebook::react::ContextContainer const>();
  _reactNativeConfig = std::make_shared<facebook::react::EmptyReactNativeConfig const>();
  _contextContainer->insert("ReactNativeConfig", _reactNativeConfig);
  _bridgeAdapter = [[RCTSurfacePresenterBridgeAdapter alloc] initWithBridge:bridge contextContainer:_contextContainer];
  bridge.surfacePresenter = _bridgeAdapter.surfacePresenter;
#endif

  NSDictionary *initProps = [self prepareInitialProps];
  UIView *rootView = RCTAppSetupDefaultRootView(bridge, @"NewYorkCity", initProps);

  if (@available(iOS 13.0, *)) {
    rootView.backgroundColor = [UIColor systemBackgroundColor];
  } else {
    rootView.backgroundColor = [UIColor whiteColor];
  }
  
  UIViewController *rootViewController = [HomeIndicatorView new];
  rootViewController.view = rootView;
  UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:rootViewController];
  navc.navigationBarHidden = true;
  return navc;
}


- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler
{
  [RNCPushNotificationIOS didReceiveNotificationResponse:response];
}

-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler
{
  completionHandler(UNNotificationPresentationOptionSound | UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionBadge);
}

/// This method controls whether the `concurrentRoot`feature of React18 is turned on or off.
///
/// @see: https://reactjs.org/blog/2022/03/29/react-v18.html
/// @note: This requires to be rendering on Fabric (i.e. on the New Architecture).
/// @return: `true` if the `concurrentRoot` feture is enabled. Otherwise, it returns `false`.
- (BOOL)concurrentRootEnabled
{
  // Switch this bool to turn on and off the concurrent root
  return true;
}

- (NSDictionary *)prepareInitialProps
{
  NSMutableDictionary *initProps = [NSMutableDictionary new];

#ifdef RCT_NEW_ARCH_ENABLED
  initProps[kRNConcurrentRoot] = @([self concurrentRootEnabled]);
#endif

  return initProps;
}


- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
#else
  return [CodePush bundleURL];
#endif
}

#if RCT_NEW_ARCH_ENABLED

#pragma mark - RCTCxxBridgeDelegate

- (std::unique_ptr<facebook::react::JSExecutorFactory>)jsExecutorFactoryForBridge:(RCTBridge *)bridge
{
  _turboModuleManager = [[RCTTurboModuleManager alloc] initWithBridge:bridge
                                                             delegate:self
                                                            jsInvoker:bridge.jsCallInvoker];
  return RCTAppSetupDefaultJsExecutorFactory(bridge, _turboModuleManager);
}

#pragma mark RCTTurboModuleManagerDelegate

- (Class)getModuleClassFromName:(const char *)name
{
  return RCTCoreModulesClassProvider(name);
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const std::string &)name
                                                      jsInvoker:(std::shared_ptr<facebook::react::CallInvoker>)jsInvoker
{
  return nullptr;
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const std::string &)name
                                                     initParams:
                                                         (const facebook::react::ObjCTurboModule::InitParams &)params
{
  return nullptr;
}

- (id<RCTTurboModule>)getModuleInstanceFromClass:(Class)moduleClass
{
  return RCTAppSetupDefaultModuleFromClass(moduleClass);
}

#endif

@end
