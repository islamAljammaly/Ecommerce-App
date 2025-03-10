import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:new_eqommerce/core/class/status_request.dart';

import '../functions/check_internet.dart';

class Crud {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
   
      if (await checkInternet()) {
        var response = await http.get(Uri.parse(linkurl));
          print(response.statusCode); 
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          print(responsebody); 
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
     
  }
  Future<Either<StatusRequest, Map>> signUpPostData(Map data) async {
   
      if (await checkInternet()) {
       try {
      // Create user with email and password
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );

      await userCredential.user!.sendEmailVerification();

      // Save additional user info in Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'username': data['username'],
        'email': data['email'],
        'phone': data['phone'],
        'createdAt': DateTime.now(),
      });

      return Right({
        'status': 'verification_email_sent',
        'userId': userCredential.user!.uid,
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return const Left(StatusRequest.failure);
      } else if (e.code == 'weak-password') {
        return const Left(StatusRequest.failure);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } catch (e) {
      return const Left(StatusRequest.serverfailure);
    }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
     
  }
  Future<Either<StatusRequest, Map>> checkEmailVerification() async {
  User? user = _auth.currentUser;

  if (user != null) {
    await user.reload(); // Reload user data to reflect the latest changes
    user = _auth.currentUser; // Re-fetch the user after reloading

    if (user != null && user.emailVerified) {
      // User email is verified
      return const Right({'status': 'verified'});
    } else {
      return const Left(StatusRequest.serverfailure); // Email not verified
    }
  } else {
    return const Left(StatusRequest.serverfailure); // No user found
  }
}
Future<Either<StatusRequest, Map>> signInWithEmailAndPassword(
      String email, String password) async {
    if (await checkInternet()) {
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        if (!userCredential.user!.emailVerified) {
        return const Left(StatusRequest.unverifiedEmail);
      }

        return Right({
          'status': 'success',
          'userId': userCredential.user!.uid,
          'email' : email
        });
      } catch (e) {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }
  Future<Either<StatusRequest, Map>> sendPasswordResetEmail(String email) async {
  if (await checkInternet()) {
    try {
      // Check if the email exists
      List<String> signInMethods = await _auth.fetchSignInMethodsForEmail(email);
      if (signInMethods.isNotEmpty) {
        // Email exists, send password reset email
        await _auth.sendPasswordResetEmail(email: email);
        return const Right({'status': 'success'});
      } else {
        // Email does not exist
        return const Left(StatusRequest.failure);
      }
    } on FirebaseAuthException catch (e) {
      return const Left(StatusRequest.failure);
    }
  } else {
    return const Left(StatusRequest.offlinefailure);
  }
  }

  Future<Either<StatusRequest, QuerySnapshot>> fetchDataHome(String collectionPath) async {
    if (await checkInternet()) {
      try {
        QuerySnapshot querySnapshot = await _firestore.collection(collectionPath).get();
        return Right(querySnapshot);
      } catch (e) {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }
}