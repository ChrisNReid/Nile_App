import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

//collection refernece
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future updateUserData(
      String fullName, String phoneNumber, String password) async {
    return await userCollection.document(uid).setData({
      'Full Name': fullName,
      'Phone Number': phoneNumber,
      'Password': password
    });
  }
}
