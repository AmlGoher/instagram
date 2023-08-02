// // ignore_for_file: public_member_api_docs, sort_constructors_first


class Message {
  final String? messages;
  final String? id;
  
  Message(this.messages, this.id, 
    
  );
 factory Message.fromJson(Map<String,dynamic> jsondata){
return Message(
  jsondata["messages"] ,
  jsondata["id"],
  );    
 }

 
  

// }
// class ChatMessage {
//   final String senderId;
//   final String receiverId;
//   final DateTime timestamp;
//   final String message;

//   ChatMessage({
//     required this.senderId,
//     required this.receiverId,
//     required this.timestamp,
//     required this.message,
//   });
}
