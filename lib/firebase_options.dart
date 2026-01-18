import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyBF4uOE0vtQBR_vTKHPOV6YVXFAI3PLmbE',
    appId: '1:960755364731:web:c207acc5c968693b31c3de',
    messagingSenderId: '960755364731',
    projectId: 'live-streaming-app-162ae',
    authDomain: 'live-streaming-app-162ae.firebaseapp.com',
    storageBucket: 'live-streaming-app-162ae.firebasestorage.app',
    measurementId: 'G-0B6H26Z2XX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCXTkkZNj08G4gp1GM_fJ2D3ylgl3agCmo',
    appId: '1:960755364731:android:447b840e4db833f131c3de',
    messagingSenderId: '960755364731',
    projectId: 'live-streaming-app-162ae',
    storageBucket: 'live-streaming-app-162ae.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDkB4Zkh3DWb_5nYLSHox2HL3GeZn13CNA',
    appId: '1:960755364731:ios:16722bdaf8d5360231c3de',
    messagingSenderId: '960755364731',
    projectId: 'live-streaming-app-162ae',
    storageBucket: 'live-streaming-app-162ae.firebasestorage.app',
    iosBundleId: 'com.example.liveStreamingApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBF4uOE0vtQBR_vTKHPOV6YVXFAI3PLmbE',
    appId: '1:960755364731:web:42918049c9142d8e31c3de',
    messagingSenderId: '960755364731',
    projectId: 'live-streaming-app-162ae',
    authDomain: 'live-streaming-app-162ae.firebaseapp.com',
    storageBucket: 'live-streaming-app-162ae.firebasestorage.app',
    measurementId: 'G-3VVWNTJR2D',
  );
}
