# react-native-screenshot-listener

A lightweight React Native module that listens for screenshot events on both Android and iOS.

---

## ✨ Installation

```sh
npm install react-native-screenshot-listener
```
or
```sh
yarn add react-native-screenshot-listener
```

---

## 🍎 iOS Setup

After installation, don’t forget to install pods:

```sh
cd ios && pod install && cd ..
```

---

## 🚀 Usage

```ts
import { startScreenshotListener, stopScreenshotListener } from 'react-native-screenshot-listener';

// Start listening
startScreenshotListener(() => {
  console.log('📸 Screenshot detected!');
});

// Later, when you want to stop listening
stopScreenshotListener();
```

✅ `startScreenshotListener(callback)`
✅ `stopScreenshotListener()`

> **Note:**
> Internally, the listener is managed safely.
> Calling `stopScreenshotListener` will remove the event subscription and stop native observation.

---

## 🤝 Contributing

Pull requests are welcome!
For major changes, please open an issue first to discuss what you would like to change.

---

## 📜 License

MIT

---

## 🧠 Notes About This Library

Thanks for using this humble library 🙇‍♂️
This package was created specifically for **non-TurboModule** React Native projects.

If your project already uses the **New Architecture** with TurboModules,
I highly recommend you to check out
[`react-native-screenshot-aware`](https://github.com/username/react-native-screenshot-aware) —
a more advanced and well-maintained alternative.

Thanks again, and happy coding! 🚀

---

## 🇰🇷 for Korean Users

부족한 라이브러리를 사용해주셔서 감사합니다.
이 라이브러리는 TurboModule을 사용하지 않는 프로젝트를 위해 만들었어요!
만약 터보모듈 기반의 프로젝트라면
더 완성도 높은 `react-native-screenshot-aware` 라이브러리를 추천드립니다. 🥰
감사합니다.
