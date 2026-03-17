import 'address.dart';
import 'company.dart';

class Users {
  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  Users({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });
  factory Users.fromJSON(Map<String, dynamic> json) {
    return Users(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        address: Address.fromJSON(json["address"]),
        phone: json["phone"],
        website: json["website"],
        company: Company.fromJSON(json["company"])
    );
  }

}


