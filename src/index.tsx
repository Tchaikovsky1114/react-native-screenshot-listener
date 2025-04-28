import {
  NativeEventEmitter,
  NativeModules,
  Platform,
  type EmitterSubscription,
} from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-screenshot-listener' doesn't seem to be linked. Make sure:\n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

const ScreenshotListener = NativeModules.ScreenshotListener
  ? NativeModules.ScreenshotListener
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

const screenshotEventEmitter = new NativeEventEmitter(ScreenshotListener);

let subscription: EmitterSubscription | null = null;

export function startScreenshotListener(callback: () => void) {
  ScreenshotListener.startListening();
  subscription = screenshotEventEmitter.addListener(
    'ScreenshotTaken',
    callback
  );
}

export function stopScreenshotListener() {
  ScreenshotListener.stopListening();
  if (subscription) {
    subscription.remove();
    subscription = null;
  }
}
