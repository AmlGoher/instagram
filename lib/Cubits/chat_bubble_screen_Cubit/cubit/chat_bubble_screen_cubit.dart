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
  //send user message to the firestore
  void sendMessage({required data,  passedemail}) async {
    try {
      await messages.add({
        " messages": data,
        "CreatedAt": DateTime.now(),
        "id": passedemail,
      });
      emit(ChatBubbleScreenSucsessSend());
    } catch (e) {
      emit(ChatBubbleScreenFailSend());
      // SnackBar(
      //   content: Text("something wrong"),
      // );
    }
  }

//get message from fire store and add it to alist for (ui)
  void receiveMessage() {
    try {
      messages
          .orderBy(KCreatedAt,descending: true)
          .snapshots()
          .listen((event) {
        for (var doc in event.docs) {
          messageList.add(Message.fromJson(doc));
        }
        emit(ChatBubbleScreenSucsessReceive(messageList: messageList));
      });
    } catch (e) {
      emit(ChatBubbleScreenFailReceive());
    }
  }
}
