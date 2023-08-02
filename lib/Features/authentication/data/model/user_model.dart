import 'package:equatable/equatable.dart';

import '../../../../core/constants/auth_Constants.dart';

class UserModel extends Equatable {
  final String id;
  final String? userName;
  final String? password;
  final String? email;
  final String? photoUrl;
  final String? bio;
  final int? followerCount;
  final int? followingCount;
  final List<Post>? posts;

  const UserModel( {this.password,
    required this.id,
     this.userName,
     this.email,
     this.photoUrl,
     this.bio,
     this.followerCount,
     this.followingCount,
     this.posts,
  });
  factory UserModel.fromJson(Map<String, dynamic> jason) {
    return UserModel(
        id: jason[AuthConstants.kId],
        userName: jason[AuthConstants.kUserName],
        email: jason[  AuthConstants.kEmail],
        photoUrl: jason[AuthConstants.kPhotoUrl],
        bio: jason[AuthConstants.kBio],
        followerCount: jason[AuthConstants.kFollowerCount],
        followingCount: jason[AuthConstants.kFollowingCount],
        posts: jason[AuthConstants.kId]);

  }
    Map<String, dynamic> toJson() {
    return {
      AuthConstants.kEmail: email,
      AuthConstants.kUserName: userName,
      AuthConstants.kPassword: password,  
      AuthConstants.kBio:bio,
      AuthConstants.kFollowerCount:followerCount,
      AuthConstants.kFollowingCount:followingCount,
      AuthConstants.kId:id,
        };
  }
   
    
   static const empty = UserModel(id: '');

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == UserModel.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != UserModel.empty;

  @override
  List<Object?> get props => [email, id, bio,userName, photoUrl];
}

class Post {
  final String id;
  final UserModel userName;
  final String photoUrl;
  final String caption;
  final int likeCount;
  final List<Comment> comments;

  Post({
    required this.id,
    required this.userName,
    required this.photoUrl,
    required this.caption,
    required this.likeCount,
    required this.comments,
  });
  factory Post.fromJason(Map<String, dynamic> jason) {
    return Post(
        id: jason[AuthConstants.kId],
userName: jason[AuthConstants.kUserName],
             photoUrl: jason[AuthConstants.kPhotoUrl],
        caption: jason[AuthConstants.kCaption],
        likeCount: jason[AuthConstants.kLikeCount],
        comments: jason[AuthConstants.kComment]);
  }
}
class Comment {
  final String id;
  final UserModel userName;
  final String text;

  Comment({
    required this.id,
    required this.userName,
    required this.text,
  });
  factory Comment.fromJason(Map<String, dynamic> jason) {
    return Comment(id: jason[AuthConstants.kId], 
                   userName: jason[AuthConstants.kUserName], 
                   text: jason[AuthConstants.kText]);
  }
}
