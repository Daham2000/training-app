import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uid;
  final CollectionReference userCollection = FirebaseFirestore.instance.collection("Users");

  DatabaseService({this.uid});

  Future updateUserdata(String name) async {
      return await userCollection.doc(uid).set({
        "name":name
      });
  }


}