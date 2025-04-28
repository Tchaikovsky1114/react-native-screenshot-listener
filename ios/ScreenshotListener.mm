#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>
#import <UIKit/UIKit.h>

@interface ScreenshotListener : RCTEventEmitter <RCTBridgeModule>
@end

@implementation ScreenshotListener

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(startListening) {
  NSLog(@"🟢 ScreenshotListener: startListening 호출됨 (iOS)");
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(userDidTakeScreenshot)
                                               name:UIApplicationUserDidTakeScreenshotNotification
                                             object:nil];
}

RCT_EXPORT_METHOD(stopListening) {
  NSLog(@"🔴 ScreenshotListener: stopListening 호출됨 (iOS)");
  [[NSNotificationCenter defaultCenter] removeObserver:self
                                                  name:UIApplicationUserDidTakeScreenshotNotification
                                                object:nil];
}

+ (BOOL)requiresMainQueueSetup {
  return YES;
}

- (NSArray<NSString *> *)supportedEvents {
  return @[@"ScreenshotTaken"];
}

- (void)userDidTakeScreenshot {
  NSLog(@"📸 Screenshot captured! Sending to JS...");
  [self sendEventWithName:@"ScreenshotTaken" body:nil];
}

@end
