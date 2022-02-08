class UsersModel {
  String? name;
  String? email;
  String? phone;
  String? uId;
  bool? isEmailVerifaed;
  UsersModel(
      {this.email, this.name, this.phone, this.uId, this.isEmailVerifaed});
  UsersModel.fromJson(Map<String,dynamic> json){
    email = json['email'];
    name = json['name'];
    phone= json['phone'];
    uId = json['uId'];
    isEmailVerifaed = json['isEmailVerifaed'];
  }
  Map<String,dynamic> toMap(){
    return {
      'email':email,
      'name':name,
      'phone':phone,
      'uId':uId,
      'isEmailVerifaed':isEmailVerifaed,
    };
  }
}
