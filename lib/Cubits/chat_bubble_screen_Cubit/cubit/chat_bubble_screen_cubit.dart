import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/model/message.dart';
import 'package:instagram/shared/constants.dart';

part 'chat_bubble_screen_state.dart';

class ChatBubbleScreenCubit extends Cubit<ChatBubbleScreenState> {
  ChatBubbleScreenCubit() : super(ChatBubbleScreenInitial());
  CollectionReference messages =
      FirebaseFirestore.instance.collection(KMessagesCollections);
  List<Message> messageList = [];

  //email is the id of the message
  //send user message to the fires
  sendMessage({required data, required passedemail}) async {
    try {
      await messages.add({
        "messages": data,
        "CreatedAt": DateTime.now(),
        "id": passedemail,
      });
      // emit(ChatBubbleScreenSucsessSend());
    } catch (e) {
      emit(ChatBubbleScreenFailSend());
      // SnackBar(
      //   content: Text("something wrong"),
      // );
    }
  }
//get message from fire store and add it to alist for (ui)
  void receiveMessage() {
    emit(ChatBubbleScreenLodingMessages());
    try {
      messages
          .orderBy(KCreatedAt, descending: true)
          .snapshots()
          .listen((event) {
        messageList.clear();
        for (var doc in event.docs) {
          messageList.add(Message.fromJson(doc.data() as Map<String, dynamic>));
        }
        emit(ChatBubbleScreenSucsessReceive(messageList: messageList));
      });
    } catch (e) {
      emit(ChatBubbleScreenFailReceive(errMessage: "Something went wrong "));
    }
  }

  // ..........
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:instagram/model/message.dart';
// import 'package:instagram/services/firestor_services.dart';

// import 'chat_bubble_screen_state.dart';

// class ChatCubit extends Cubit<ChatCubitState> {
//   final String senderId;
//   final String receiverId;
//   String userId;
//   final CollectionReference messagesCollection =
//       FirebaseFirestore.instance.collection('messages');

//   List<ChatMessage> messagesList = [];
//   FirestoreService firestoreService = FirestoreService();

//  final String message;

//   ChatCubit(this.message,
//       {required this.senderId, required this.receiverId, required this.userId})
//       : super(ChatBubbleScreenInitial());

//   void loadMessages() {
//     messagesCollection
//         // .where('senderId', whereIn: [senderId, receiverId])
//         // .where('receiverId', whereIn: [senderId, receiverId])
//         .where('userId', isEqualTo: userId)
//         .where('participantIds', arrayContainsAny: [senderId, receiverId])
//         .orderBy('timestamp')
//         .snapshots()
//         .listen((snapshot) {
//           for (var doc in snapshot.docs) {
//             messagesList.add(ChatMessage(
//               senderId: doc['senderId'],
//               receiverId: doc['receiverId'],
//               timestamp: doc['timestamp'].toDate(),
//               message: doc['message'],
//             ));
//           }
//           emit(ChatBubbleScreenSucsessReceive(messageList: messagesList));
//         });
//   }

//   void sendMessage(String message) {
//     final timestamp = DateTime.now();
//     messagesCollection.add({
//       'senderId': senderId,
//       'receiverId': receiverId,
//       'timestamp': timestamp,
//       'message': message,
//       'userId': userId,
//     });
//   }

//   void here() {
//     firestoreService.sendMessage(message, receiverId);
//   }
// }
// // ````

// // In this example, the `loadMessages` method adds a filter to only load chat messages that belong to the authenticated user and the user they are chatting with.

// // Note that you will also need to modify the `loadMessages` method to handle cases where the user signs out or switches to a different chat conversation
}
