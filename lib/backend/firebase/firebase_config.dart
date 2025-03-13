import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAJAumly3rxhG0pvvAmLpKaL3DCt5B_ivU",
            authDomain: "amdha-dev.firebaseapp.com",
            projectId: "amdha-dev",
            storageBucket: "amdha-dev.firebasestorage.app",
            messagingSenderId: "236307181739",
            appId: "1:236307181739:web:0bd5ef3d70d129f3bdc7ee",
            measurementId: "G-2GF8TE5ZNT"));
  } else {
    await Firebase.initializeApp();
  }
}
