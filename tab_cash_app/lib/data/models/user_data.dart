import 'dart:convert';
import 'dart:ffi';

// creating the user model
class UserDataModel {
  String? id;
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  String? userName;
  String? birthdate;
  String? nationalId;
  int? balance;

  UserDataModel({
    this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.userName,
    this.birthdate,
    this.nationalId,
    this.balance,
  });

// the form of the user model (the data form of jason)
  UserDataModel.formJason(Map<String, dynamic> jason) {
    id = jason["UID"];
    firstName = jason["firstName"];
    lastName = jason["LastName"];
    phone = jason["phone"];
    email = jason["email"];
    userName = jason["username"];
    birthdate = jason["birthdate"];
    nationalId = jason["nationalID"];
    balance = jason["balance"];
  }
}
