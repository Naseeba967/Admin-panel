// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCGRFy0Yusej5f0fo3iIJc_xXxGl6jnd_Q',
    appId: '1:798991023921:web:6c870382530bcb2a46ba10',
    messagingSenderId: '798991023921',
    projectId: 'auth-61de9',
    authDomain: 'auth-61de9.firebaseapp.com',
    storageBucket: 'auth-61de9.appspot.com',
    measurementId: 'G-G43MB7BQY3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC6GGxCUfyP9Zw76ruqBXyUwzx3ikM9PVw',
    appId: '1:798991023921:android:0a2c315db01c8ef546ba10',
    messagingSenderId: '798991023921',
    projectId: 'auth-61de9',
    storageBucket: 'auth-61de9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA7-ry52VpUcTMG-wEMqe-WhHN5CDbyqco',
    appId: '1:798991023921:ios:194481c7b9df070646ba10',
    messagingSenderId: '798991023921',
    projectId: 'auth-61de9',
    storageBucket: 'auth-61de9.appspot.com',
    iosBundleId: 'com.example.adminPanel',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA7-ry52VpUcTMG-wEMqe-WhHN5CDbyqco',
    appId: '1:798991023921:ios:194481c7b9df070646ba10',
    messagingSenderId: '798991023921',
    projectId: 'auth-61de9',
    storageBucket: 'auth-61de9.appspot.com',
    iosBundleId: 'com.example.adminPanel',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCGRFy0Yusej5f0fo3iIJc_xXxGl6jnd_Q',
    appId: '1:798991023921:web:b9b838928a9886f646ba10',
    messagingSenderId: '798991023921',
    projectId: 'auth-61de9',
    authDomain: 'auth-61de9.firebaseapp.com',
    storageBucket: 'auth-61de9.appspot.com',
    measurementId: 'G-FEXV2KS8H4',
  );
}
