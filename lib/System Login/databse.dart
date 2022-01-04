import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference userDataCollection =
      FirebaseFirestore.instance.collection('UserData');

  Future upDateUserData(
    String email,
    String userID,
    dynamic absCal,
    dynamic shoulderCal,
    dynamic chestCal,
    dynamic armsCal,
    dynamic legsCal,
    dynamic backCal,
  ) async {
    return await userDataCollection.doc(uid).set({
      'email': email,
      'userID': userID,
      'absCal': absCal,
      'shoulderCal': shoulderCal,
      'chestCal': chestCal,
      'armsCal': armsCal,
      'legsCal': legsCal,
      'backCal': backCal,
    });
  }
}
