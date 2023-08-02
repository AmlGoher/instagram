import 'package:equatable/equatable.dart';

import '../../data/model/user_model.dart';

class User extends Equatable {
  final String id;
  final String? password;
  final String? userName;
  final String email;
  final String? photoUrl;
  final String? bio;
  final int? followerCount;
  final int? followingCount;
  final List<Post>? posts;

 const User({
     this.password,
    required this.id,
     this.userName,
     required this.email,
     this.photoUrl,
     this.bio,
     this.followerCount,
     this.followingCount,
     this.posts,
  });
     static const empty =  User(id: '',email:'' );

   /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == User.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != User.empty;
  @override
  // TODO: implement props
  List<Object?> get props =>  [email, id, bio,userName, photoUrl];
  }
