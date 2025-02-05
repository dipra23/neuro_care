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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBT_pwczKoivwIO4G5lgEzMnofqI1fw48U',
    appId: '1:618522361907:android:96d6d9ab1d3aa991196346',
    messagingSenderId: '618522361907',
    projectId: 'neurocare-15723',
    storageBucket: 'neurocare-15723.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC-Yz1S3ECHJmc0ugwBKdrh-aT374xqO-g',
    appId: '1:618522361907:ios:1759e8ea07e4c6f4196346',
    messagingSenderId: '618522361907',
    projectId: 'neurocare-15723',
    storageBucket: 'neurocare-15723.appspot.com',
    androidClientId: '618522361907-d367gc57qba55mcql2rcv35n87orbb7r.apps.googleusercontent.com',
    iosClientId: '618522361907-oupgccq67jhp91hd8gbbri7jv2f5468e.apps.googleusercontent.com',
    iosBundleId: 'com.example.dipra',
  );

}