class resposemodel {
  bool status;
  String message;
  userdata? data;

  resposemodel({
    this.data,
    required this.message,
    required this.status,
  });

  factory resposemodel.fromjson(data) {
    return resposemodel(
        data: data['data'] != null ? userdata.fromjson(data['data']) : null,
        message: data['message'],
        status: data['status']);
  }
}

class userdata {
  int? id;
  String? token;
  String? email;
  String? phone;
  String? image;
  String? name;

  userdata(
      {this.id, this.name, this.token, this.email, this.image, this.phone});

  factory userdata.fromjson(data) {
    return userdata(
        id: data['id'] ?? null,
        name: data['name'] ?? null,
        token: data['token'] ?? null,
        email: data['email'] ?? null,
        image: data['image'] ?? null,
        phone: data['phone'] ?? null);
  }
}
