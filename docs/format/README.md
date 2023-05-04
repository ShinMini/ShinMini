# ${ProjectName} Application

## Introduction
This is the repository of ${ProjectName} App. It contains most of the Exchange features. This mobile application is downloadable from [Google Play](https://play.google.com/store) and [App Store](https://apps.apple.com).

${ProjectName} Mobile App is developed with [React-Native](https://facebook.github.io/react-native/) in [TypeScript](https://www.typescriptlang.org/index.html#download-links).

## Architecture

### Folder Structure

<pre>
<b>/scripts/gen-module.sh</b> # Create module template
<b>/src</b>
&emsp;<b>|__assets</b> # Folder to store the project's image, SVG icon
&emsp;<b>|__components</b> # Folder containing all the shared components of the project
&emsp;<b>|__hooks</b> # The folder containing the project's custom hooks
&emsp;<b>|__contexts</b> # The folder containing the project's custom contexts
&emsp;<b>|__i18n</b> # Folder containing the project's multilingual configuration section
&emsp;<b>|__libs</b> # Folder containing custom libs
&emsp;<b>|__modules</b> # Folder contains subfolders which collectively group features and contents that serve a common business-related purpose
&emsp;<b>|__redux</b>
&emsp;&emsp;&emsp;&emsp;|<b>__persists</b> # Folder of persist custom for each reducer
&emsp;&emsp;&emsp;&emsp;|<b>__reducers</b> # Folder of redux reducers
&emsp;&emsp;&emsp; |<b>__sagas</b> # Folder of redux config saga
&emsp;&emsp;&emsp; |<b>__stores</b> # Config store
&emsp;<b>|__services</b>
&emsp;&emsp;&emsp;&emsp;|<b>event-bus.ts</b> # File containing events sent in App
&emsp;&emsp;&emsp;&emsp;|<b>api-request.ts</b> # File contains request api . methods
&emsp;&emsp;&emsp;&emsp;|<b>firebase.ts</b> # File contains firebase-related configs for push notifications
&emsp;&emsp;&emsp;&emsp;|<b>socket.ts</b> # File to handle the real time part related to socket IO
&emsp;<b>|__storage</b> # Folder contains functions to save and retrieve values from local storage
&emsp;<b>|__themes</b> # Folder config colors, fonts, sizes
&emsp;<b>|__typings</b> # Folder contains root interface
&emsp;<b>|__utils</b> # Folder contains common processing functions in App
</pre>

### App Folder

#### Assets

The [`./src/assets`](./src/assets) folder contains all assets:

| Folder                           | Description                       |
|----------------------------------|-----------------------------------|
| [`/fonts`](./src/assets/fonts)   | This folder store all fonts       |
| [`/images`](./src/assets/images) | This folder store all images      |
| [`/svgs`](./src/assets/svgs)     | This folder store all icons using |

#### Components

The [`./src/components`](./src/components) folder contains all common components:

| Folder                                 | Description                                                     |
|----------------------------------------|-----------------------------------------------------------------|
| [`/base`](./src/components/base)       | This folder contains original component of RN with custom props |
| [`/loading`](./src/components/loading) | This folder contains loading global                             |
| [`/root`](./src/components/root)       | This folder contains socket listener global                     |
| [`/button`](./src/components/button)   | This folder contains button common (ButtonHorizontal, etc)      |
| [`/image`](./src/components/image)     | This folder contains image common (CircleImage, etc)            |

#### Modules

The [`./src/modules`](./src/modules) folder contains subfolders which collectively group features and contents that serve a **common business-related purpose**. For instance, login is a module and user is another module. Each sub folder under module folder adapt to this universal folder structure:

| Folder                  | Description                                                                                                        |
|-------------------------|--------------------------------------------------------------------------------------------------------------------|
| `<module>/assets`       | This folder is to store the `image.ts` file. Instructions of to add images can be found [here](#how-to-Add-Image). |
| `<module>/src`          | This folder is to store all action, constant, saga, selector and logic related files of the module (utils), etc.   |
| `<module>/tests`        | This folder is to store all unit testing files of the module.                                                      |
| `<module>/translations` | This folder is to store all translation file for the module.                                                       |
| `<module>/typings`      | This folder is to store the ambient types files of the module.                                                     |
| `<module>/views`        | This folder is to store all screens and views file.                                                                |

## Prerequisites

### Tools to Download

**Note:** `.x` or `.x.x` indicates **the latest stable minor** version of that tool, e.g.: `1.x.x` > `1.62.3`

| Tool                                                                       | Version  | How to Check                                  | How To Get                                                                                               |
|----------------------------------------------------------------------------|----------|-----------------------------------------------|----------------------------------------------------------------------------------------------------------|
| [Homebrew](https://brew.sh)                                                | `3.x.x`  | `brew -v`                                     | `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`     |
| [Visual Studio Code](https://code.visualstudio.com)                        | `1.x.x`  | `code --version`                              | `brew install --cask visual-studio-code` or https://code.visualstudio.com/Download                       |
| [Xcode](https://developer.apple.com/Xcode)                                 | `14.0.1` | `/usr/bin/xcodebuild -version`                | https://download.developer.apple.com/Developer_Tools/Xcode_13.2.1/Xcode_13.2.1.xip                       |
| [Android Studio](https://developer.android.com/studio)                     | `4.2.2`  | Launch tool > **About Android Studio**        | https://redirector.gvt1.com/edgedl/android/studio/install/4.2.2.0/android-studio-ide-202.7486908-mac.dmg |
| [Flipper](https://fbflipper.com)                                           | `0.x.x`  | Launch tool > **About Flipper**               | https://github.com/facebook/flipper/releases and download `Flipper-mac.dmg` from the **Assets** section. |
| [React Native Debugger](https://github.com/jhen0409/react-native-debugger) | `0.x.x`  | Launch tool > **About React Native Debugger** | `brew install --cask react-native-debugger`                                                              |
| [Node](https://nodejs.org/en)                                              | `18.x.x` | `node -v`                                     | `brew install node@16`                                                                                   |
| [NVM](https://github.com/nvm-sh/nvm)                                       | `0.39.1` | `nvm -v`                                      | `brew install nvm`                                                                                       |
| [Yarn](https://yarnpkg.com)                                                | `1.x.x`  | `yarn -v`                                     | `npm install --global yarn`                                                                              |
| [CocoaPods](https://cocoapods.org)                                         | `1.11.3` | `pod --version`                               | `sudo gem install cocoapods -v 1.11.2`                                                                   |

## How-Tos

### Create modules template
1. Grant permission file Sh (if not grant): `sudo chmod 755 ./scripts/gen-module.sh`

2. Module name: `Home => home || Profile Setting => profileSetting`

3. Run: `sudo chmod 755 ./scripts/gen-module.sh` => `Name Module`


### Create merge request
1. Create new branch `git checkout -b [feature|bugfix]/action_change`
   
   e.g.: This should be written entirely in lowercase with 2 mandatory prefixs `feature` or `bugfix`
   ```sh
   git checkout -b feature/add_login_ui
   ```
2. Add file `git add .` or `git add specific_file.ts|tsx`

   e.g.:
   ```sh
   git add .
   ```
3. Commit change `git commit -m "description of change..."`
   
   e.g.: This should be written entirely in lowercase
   ```sh
   git commit "add login screen ui"
   ```
4. Push `git push`
5. Create merge request
   - Title of merge request: This should be the description of commit change and capitalize the first letter.
   ```
   Add login screen UI
   ```
   - Description: Follow by [_template_](PULL_REQUEST_TEMPLATE.md)
6. Add `Assignees` & `Assignees` & `Labels (if need)`  correctly
7. Create merge request :tada:

### How to Build with iOS - Simulator

1. Check if you have all the dependencies and files in [_Prerequisites_](#prerequisites)
2. Clone the repository
3. Check out to `master` branch
4. Launch terminal and `cd ` to the project
5. Exec `yarn install` or `yarn` to install npm dependencies
6. Exec `yarn start` to launch Metro Bundler
7. Launch `./ios/${ProjectName}.xcworkspace` with Xcode (new M1 machines need to run XCode with Rosetta enabled, right click Xcode.app -> Get Info -> Open w/ Rosetta)
8. Build with Xcode :tada:

### How to Build with Android - Emulator

Additional workflow prerequisites:
- JDK 8 (from brew or from Web)
- Android SDK: Android 10.0 (Q)
- Android Virtual device setup
- Disable instant run

1. Check if you have all the dependencies and files in [_Prerequisites_](#prerequisites)
2. Clone the repository
3. Check out to `master` branch
4. Launch terminal and `cd ` to the project
5. Exec `yarn install` or `yarn` to install NPM dependencies
6. Exec `yarn start` to launch Metro Bundler
7. Open `./android` with Android Studio
8. Resolve missing dependencies with Gradle prompts
9. Build with Android Studio :tada:

### How to Build with IOS - Simulator without launching XCode
1. clone repository
2. check out to `master` branch
3. Launch terminal and `cd` to the project
4. Run the following code.
    ```sh
    yarn install && yarn ios && yarn start
    ```
   **Note:** to get a list of IOS phone to simulate you can run `xcrun simctl list devices`

### How to Build with Android - Emulator without launching Android Studio
1. clone repository
2. check out to `master` branch
3. Launch terminal and `cd` to the project
4. Run the following code.
    ```sh
    yarn install && yarn android && yarn start
    ```

### How to Add Images

```
Comming soon
```

### How to debug unit testing

**Quick commands**

e.g. run all unit tests
```sh
yarn test
```

e.g. watch all unit tests
```sh
yarn test:watch
```

e.g. watch all unit tests without coverage report
```sh
yarn test:debug
```

*Note:
- To add cli arguments/options using yarn, you may add it directly into the command `yarn test anyFileOrFolderNamePattern --cliOptions`
- To add cli arguments/options using npm, you may add `--` after the commands with structure `npm run test -- anyFileOrFolderNamePattern --cliOptions`
- More `cli options` can be found here: https://jestjs.io/docs/cli

**Example**

Let's say we want to start debugging unit test specifically for user selectors located in `/app/modules/user/src/userSelectors.ts`.

#### Pre-requisites

Remember, you are writing test to guard your code against logic error and future regressions, not to chase test coverage!. However, make sure you cover all the edge cases!

#### Instructions

1. Add test file at `tests/` folder in the specific module
  - naming convention have suffix `.spec.ts` will be `fileNameTobeTested.spec.ts`
  - in this case will be `/app/modules/user/tests/userSelectors.spec.ts`

2. Start debug your test/tests file by running
   ```sh
    yarn test:debug userSelectors.spec.ts
   ```
   if you want to check multiple tests inside specific module
   ```sh
    yarn test:debug user/tests
   ```
   if you want to check specific name or name pattern at `describe` or `test` inside filename
   ```sh
    yarn test:debug userSelectors.spec.ts -t="userInfoSelector"
   ```

3. Done!, you may start writing your test cases 👨‍👨‍👦‍👦


### Troubleshooting

```
Comming soon
```
