// ignore_for_file: public_member_api_docs, sort_constructors_first
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

class ChatBubbleScreenIsSeen extends ChatBubbleScreenState {}

class ChatBubbleScreenIsNotSeen extends ChatBubbleScreenState {}

class ChatBubbleScreenSendDate extends ChatBubbleScreenState {}

class ChatBubbleScreenReceiveDate extends ChatBubbleScreenState {}

class ChatBubbleScreenFailSend extends ChatBubbleScreenState {}

class ChatBubbleScreenFailReceive extends ChatBubbleScreenState {}
