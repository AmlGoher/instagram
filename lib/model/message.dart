// ignore_for_file: public_member_api_docs, sort_constructors_first

class Message {
  final String? message;
  final String? id;
  Message(  
     this.message,
     this.id,);
 factory Message.fromJson(jsondata){
return Message(
  jsondata["message"],
  jsondata["id"]);
 }

}
