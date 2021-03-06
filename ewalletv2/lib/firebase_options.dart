// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAPWhayHIHU3GUivms4kwkVz-2v33ZNEk4',
    appId: '1:285719191414:web:5af312fedeb5af5cf8e457',
    messagingSenderId: '285719191414',
    projectId: 'e-wallet-f9026',
    authDomain: 'e-wallet-f9026.firebaseapp.com',
    storageBucket: 'e-wallet-f9026.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDMiuuh_c4d7JzaExg0ePuuwk8ux4sXG0Q',
    appId: '1:285719191414:android:35402d95e3a9afbdf8e457',
    messagingSenderId: '285719191414',
    projectId: 'e-wallet-f9026',
    storageBucket: 'e-wallet-f9026.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBPYc6tbdf4ejwWkb6FDZf7xYZrtMXJScs',
    appId: '1:285719191414:ios:62b3b82787067203f8e457',
    messagingSenderId: '285719191414',
    projectId: 'e-wallet-f9026',
    storageBucket: 'e-wallet-f9026.appspot.com',
    iosClientId: '285719191414-fdlr02t1mkddi11jeiuvfn4ncv8a8cbi.apps.googleusercontent.com',
    iosBundleId: 'com.example.ewalletv2',
  );
}
