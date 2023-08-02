// // ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'chat_bubble_screen_cubit.dart';

@immutable
abstract class ChatBubbleScreenState {}

class ChatBubbleScreenInitial extends ChatBubbleScreenState {}

class ChatBubbleScreenSucsessSend extends ChatBubbleScreenState {}

class ChatBubbleScreenSucsessReceive extends ChatBubbleScreenState {
  List<Message> messageList = [];
  ChatBubbleScreenSucsessReceive({
    required this.messageList,
  });

}
class ChatBubbleScreenLodingMessages extends ChatBubbleScreenState {}
class ChatBubbleScreenIsSeen extends ChatBubbleScreenState {}

class ChatBubbleScreenIsNotSeen extends ChatBubbleScreenState {}

class ChatBubbleScreenSendDate extends ChatBubbleScreenState {}

class ChatBubbleScreenReceiveDate extends ChatBubbleScreenState {}

class ChatBubbleScreenFailSend extends ChatBubbleScreenState {}

class ChatBubbleScreenFailReceive extends ChatBubbleScreenState {
  String errMessage;
  ChatBubbleScreenFailReceive({required this.errMessage});
}

//.....................
//ignore_for_file: public_member_api_docs, sort_constructors_first


// import 'package:flutter/material.dart';
// import 'package:instagram/model/message.dart';

// @immutable
// abstract class ChatCubitState {}

// class ChatBubbleScreenInitial extends ChatCubitState  {}
// class ChatBubbleScreenSucsessReceive extends ChatCubitState {
//   List<ChatMessage> messageList = [];
//   ChatBubbleScreenSucsessReceive({
//     required this.messageList,
//   });

// }