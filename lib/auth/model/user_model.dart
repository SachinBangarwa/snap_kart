class UserModel {
  String userName;
  String password;

  UserModel({
    required this.userName,
    required this.password,
  });

   Map<String,dynamic> fromJson(){
      return {
        'username':userName,
        'password':password,
      };
  }


}
