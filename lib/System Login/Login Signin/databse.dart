import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userDataCollection = FirebaseFirestore.instance.collection('UserData');

  Future upDateUserData(String email, String userID, dynamic cal ) async{
    return await userDataCollection.doc(uid).set({
      'email' : email,
      'userID' : userID,
      'cal' : cal,
    });
  }
}