// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:instagram/model/message.dart';
import 'package:instagram/shared/Colors.dart';
import 'package:instagram/shared/shared_Chat_bubble.dart';

import '../Cubits/chat_bubble_screen_Cubit/cubit/chat_bubble_screen_cubit.dart';

class Chat_bubble_page extends StatefulWidget {
  Chat_bubble_page({
    Key? key,
  }) : super(key: key);

  @override
  State<Chat_bubble_page> createState() => _Chat_bubble_pageState();
}

class _Chat_bubble_pageState extends State<Chat_bubble_page> {
  TextEditingController messageController = TextEditingController();

  bool enabled = true;

  final scrollController = ScrollController();

  List<Message> messageList = [];

  @override
  Widget build(BuildContext context) {
    // final Object? passedemail = ModalRoute.of(context)!.settings.arguments;

    // if (snapshot.hasData) {
    //   for (var i = 0; i < snapshot.data!.docs.length; i++) {
    //     messageList.add(Message.fromJson(snapshot.data!.docs[i]));
    return Scaffold(
        appBar: AppBar(
          leading: Container(
            margin: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/post1.jfif"),
                  fit: BoxFit.cover),
              shape: BoxShape.circle,
            ),
          ),
          title: Text(
            "Aml Gohar",
            style: TextStyle(fontSize: 24),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.phone, size: 36),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.video_call_rounded, size: 36),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(child:
                BlocBuilder<ChatBubbleScreenCubit, ChatBubbleScreenState>(
              builder: (context, state) {
                BlocProvider.of<ChatBubbleScreenCubit>(context).messageList;

                return ListView.builder(
                    reverse: true,
                    itemCount: messageList.length,
                    itemBuilder: (context, index) {
                      return
                          // messageList[index].id == passedemail
                          Chatbubbles(message: messageList[index]);
                      // : Chatbubbles_freind(message: messageList[index]);
                    });
              },
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: messageController,
                onSubmitted: (data) {
                  BlocProvider.of<ChatBubbleScreenCubit>(context)
                      .sendMessage(data: data, );
                  messageController.clear();
                  scrollController.animateTo(0,
                      duration: Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn);
                },
                onChanged: (data) {
                  setState(() {
                    enabled = false;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Send massage",
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: enabled
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.sticky_note_2_outlined),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(Icons.mic),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(Icons.photo)
                            ],
                          )
                        : IconButton(
                            onPressed: () {
                              // BlocProvider.of<ChatBubbleScreenCubit>(context)
                              //     .sendMessage(
                              //         data: messageController.text,
                              //         passedemail: passedemail);
                              messageController.clear();
                              scrollController.animateTo(
                                  scrollController.position.maxScrollExtent,
                                  duration: Duration(seconds: 1),
                                  curve: Curves.fastLinearToSlowEaseIn);
                            },
                            icon: Icon(Icons.send)),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: BorderSide(color: primaryColor)),
                ),
              ),
            )
          ],
        ));
  }
}
