// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';



// class FirestoreService  {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;


// //func get email from Auth
//   Future<String> getLoggedInUserEmail() async {
//     User? user = _auth.currentUser;
//     if (user != null && user.email != null) {
//       return user.email!;
//     } else {
//       throw Exception('Failed to get logged in user email');
//     }
//   }

//   Future<String> getLoggedInUserId() async {
//     String email = await getLoggedInUserEmail();
    
//     QuerySnapshot querySnapshot =
//         await _firestore.collection('users').where('email', isEqualTo: email).get();
//     if (querySnapshot.docs.isEmpty) {
//       throw Exception('Failed to get user document for $email');
//     }
//     DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
//     return documentSnapshot.id;
//   }
//   Future<void> sendMessage(String message, String receiverEmail) async {
//   try {
//     String senderId = await getLoggedInUserId();
//     String receiverId = await getUserIdByEmail(receiverEmail);
//     await _firestore.collection('messages').add({
//       'senderId': senderId,
//       'receiverId': receiverId,
//       'message': message,
//       'timestamp': FieldValue.serverTimestamp(),
//     });
//   } catch (e) {
//     print('Failed to send message: $e');
//   }
// }
// //get email from firestore
// Future<String> getUserIdByEmail(String email) async {
//   QuerySnapshot querySnapshot =
//       await _firestore.collection('users').where('email', isEqualTo: email).get();
//  if (querySnapshot.docs.isEmpty) {
//       throw Exception('Failed to get user document for $email');
//     }
//   DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
//   return documentSnapshot.id;
// }



// }