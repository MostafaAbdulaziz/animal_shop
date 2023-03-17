class CreateUserModel{
  String? name;
  String? mail;
  String? phone;
  String? uId;
  String? image;
  String? bio;
  String? birthDate;
  String? gender;
  String? age;

  CreateUserModel({
    this.name,
    this.mail,
    this.phone,
    this.image,
    this.uId,
    this.bio,
    this.age,
    this.birthDate,
    this.gender,
  });

  CreateUserModel.fromJson(Map<String,dynamic> json)
  {
    name=json['name'];
    mail=json['email'];
    phone=json['phone'];
    uId=json['uId'];
    image=json['image'];
    bio=json['bio'];
    age=json['age'];
    birthDate=json['birth Date'];
    gender=json['gender'];
  }

  Map<String,dynamic> toMap()
  {
    return {
      'name':name,
      'email':mail,
      'phone':phone,
      'uId':uId,
      'image':image,
      'bio':bio,
      'age':age,
      'birth Date':birthDate,
      'gender':gender,
    };
  }
}