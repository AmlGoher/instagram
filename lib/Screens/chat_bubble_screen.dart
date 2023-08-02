// // ignore_for_file: public_member_api_docs, sort_constructors_first
// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/shared/Colors.dart';
import 'package:instagram/shared/shared_Chat_bubble.dart';

import '../Cubits/chat_bubble_screen_Cubit/cubit/chat_bubble_screen_cubit.dart';

class ChatBubblePage extends StatefulWidget {
  const ChatBubblePage({
    super.key,
  });

  @override
  State<ChatBubblePage> createState() => _ChatBubblePageState();
}

class _ChatBubblePageState extends State<ChatBubblePage> {
  TextEditingController messageController = TextEditingController();

  bool enabled = true;

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Object? passedemail = ModalRoute.of(context)!.settings.arguments;
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
          title: const Text(
            "Aml Gohar",
            style: TextStyle(fontSize: 24),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.phone, size: 36),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.video_call_rounded, size: 36),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(child:
                BlocBuilder<ChatBubbleScreenCubit, ChatBubbleScreenState>(
              builder: (context, snapshot) {
                if (snapshot is ChatBubbleScreenSucsessReceive) {
                  var messageList = snapshot.messageList;

                  return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      controller: scrollController,
                      reverse: true,
                      itemCount: messageList.length,
                      itemBuilder: (context, index) {
                        return BlocProvider.of<ChatBubbleScreenCubit>(context)
                                    .messageList[index]
                                    .id ==
                                passedemail
                            ? Chatbubbles(
                                message: BlocProvider.of<ChatBubbleScreenCubit>(
                                        context)
                                    .messageList[index])
                            : Chatbubbles_freind(
                                message: BlocProvider.of<ChatBubbleScreenCubit>(
                                        context)
                                    .messageList[index]);
                      });
                } else if (snapshot is ChatBubbleScreenLodingMessages) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                } else if (snapshot is ChatBubbleScreenFailReceive) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(snapshot.errMessage),
                    ),
                  );
                  return Container(); // Return a placeholder widget or null
                } else {
                  return Container(); // Return a placeholder widget or null
                }
              },
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: messageController,
                onSubmitted: (data) {
                  BlocProvider.of<ChatBubbleScreenCubit>(context).sendMessage(
                      data: messageController.text, passedemail: passedemail);

                  messageController.clear();
                  scrollController.animateTo(0,
                      //     scrollController.position.maxScrollExtent,
                      duration: const Duration(seconds: 1),
                      curve: Curves.ease);
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
                        ? const Row(
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
                              BlocProvider.of<ChatBubbleScreenCubit>(context)
                                  .sendMessage(
                                      data: messageController.text,
                                      passedemail: passedemail);

                              messageController.clear();
                              scrollController.animateTo(0,
                                  //     scrollController.position.maxScrollExtent,
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.ease);
                            },
                            icon: const Icon(Icons.send)),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: const BorderSide(color: primaryColor)),
                ),
              ),
            )
          ],
        ));
  }
}
