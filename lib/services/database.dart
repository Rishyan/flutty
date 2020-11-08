import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  // collection reference
  final CollectionReference userCollection =
      Firestore.instance.collection('title');

  Future updateUserData(String sugars, String name, int strenght) async {
    return await userCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strenght': strenght,
    });
  }
}
