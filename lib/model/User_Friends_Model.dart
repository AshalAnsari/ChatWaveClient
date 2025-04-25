class UserFriendsModel {
  String friend;
  String id;

  UserFriendsModel({required this.friend, required this.id});

  factory UserFriendsModel.fromJson(Map<String, dynamic> data) {
    return UserFriendsModel(friend: data['Friend'], id: data['_id']);
  }

  Map<String, dynamic> toJson() {
    return {'Friend': friend, '_id': id};
  }
}
