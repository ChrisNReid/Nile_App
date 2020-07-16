import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

//collection refernece
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future updateUserData(String jobName, String category, String description,
      double reqPrice) async {
    return await userCollection.document(uid).setData({
      'Job Name': jobName,
      'Category': category,
      'Description': description,
      'Requested Price': reqPrice,
    });
  }
}
