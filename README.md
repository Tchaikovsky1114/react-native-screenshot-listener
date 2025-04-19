# react-native-screenshot-listener

A React Native module that lets you listen for screenshot events on both Android and iOS.

## Installation

```sh
npm install react-native-screenshot-listener
```

or

```sh
yarn add react-native-screenshot-listener
```

## iOS Setup

After installation, don’t forget to install pods:

```sh
cd ios && pod install && cd ..
```

## Usage

```ts
import { startScreenshotListener } from 'react-native-screenshot-listener';

const stop = startScreenshotListener(() => {
  console.log('Screenshot detected!');
});

// stop(); // stopListening is not implemented yet 😂 Stay tuned!
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

## License

MIT

## Notes About This Library

Thank you for using this humble library 🙇‍♂️
This package was created specifically for projects that do not use TurboModules.
If your project is already using the new architecture, I highly recommend checking out
`react-native-screenshot-aware` — it’s a more advanced and well-maintained alternative.

Thanks again, and happy coding! 🚀

## for KOREAN,

부족한 라이브러리를 사용해주셔서 감사합니다.
이 라이브러리는 TurboModule을 사용하지 않는 프로젝트를 위해 만들었어요!
만약 터보모듈을 사용하고 계신다면,
더 좋은 `react-native-screenshot-aware`라는 라이브러리가 있습니다. 🥰
감사합니다.
