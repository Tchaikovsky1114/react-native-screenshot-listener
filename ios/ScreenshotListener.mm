#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>
#import <UIKit/UIKit.h>

@interface ScreenshotListener : RCTEventEmitter <RCTBridgeModule>
@end

@implementation ScreenshotListener

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(startListening) {
  NSLog(@"🟢 ScreenshotModule: startListening 호출됨 (iOS)");
}

+ (BOOL)requiresMainQueueSetup {
  return YES;
}

- (NSArray<NSString *> *)supportedEvents {
  return @[@"ScreenshotTaken"];
}

- (void)startObserving {
  NSLog(@"🟢 ScreenshotModule: Listener registered");
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(userDidTakeScreenshot)
                                               name:UIApplicationUserDidTakeScreenshotNotification
                                             object:nil];
}

- (void)stopObserving {
  NSLog(@"🔴 ScreenshotModule: Listener removed");
  [[NSNotificationCenter defaultCenter] removeObserver:self
                                                  name:UIApplicationUserDidTakeScreenshotNotification
                                                object:nil];
}

- (void)userDidTakeScreenshot {
  NSLog(@"📸 Screenshot captured! Sending to JS...");
  [self sendEventWithName:@"ScreenshotTaken" body:nil];
}

@end
