class AnimalModel {
  String? name;
  String? age;
  String? location;
  String? price;
  String? phoneNumber;
  String? image;

  AnimalModel(
      {this.name,
      this.image,
      this.phoneNumber,
      this.location,
      this.age,
      this.price});

  AnimalModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    location = json['location'];
    price = json['price'];
    phoneNumber = json['phone number'];
    image = json['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'location': location,
      'price': price,
      'phone number': phoneNumber,
      'image': image,
    };
  }
}
