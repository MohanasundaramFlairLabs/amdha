import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAqajmt7L_0U_thP6J9pAvlIYMJZuHLq7c",
            authDomain: "amdha-60eda.firebaseapp.com",
            projectId: "amdha-60eda",
            storageBucket: "amdha-60eda.appspot.com",
            messagingSenderId: "889498919566",
            appId: "1:889498919566:web:ee834a94879cf2212c5fdf",
            measurementId: "G-5ST9XZYLXL"));
  } else {
    await Firebase.initializeApp();
  }
}
