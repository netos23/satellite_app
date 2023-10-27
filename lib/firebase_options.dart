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
    apiKey: 'AIzaSyDSzWQ58mV7ZEnHJWkuPl12lzGiEhHfa2o',
    appId: '1:412558007321:web:03031c6aae7fa63d891e88',
    messagingSenderId: '412558007321',
    projectId: 'profession-it',
    authDomain: 'profession-it.firebaseapp.com',
    storageBucket: 'profession-it.appspot.com',
    measurementId: 'G-H8CERDZ73F',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDLh16Thf_2_z2YmgXrFo0aBgBhGyF0UN4',
    appId: '1:412558007321:android:942fb2fa71207dfe891e88',
    messagingSenderId: '412558007321',
    projectId: 'profession-it',
    storageBucket: 'profession-it.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCEznu-Qy3E2-UNsgZ10jd9j_rEqs_ou64',
    appId: '1:412558007321:ios:82725a045c0b37f4891e88',
    messagingSenderId: '412558007321',
    projectId: 'profession-it',
    storageBucket: 'profession-it.appspot.com',
    iosBundleId: 'com.example.dronDeliveryApp',
  );
}