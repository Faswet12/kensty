import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kensty/models/firebase/firebaseModel.dart';

import '../../../models/user/userModel.dart';
import '../endpoints/endpoints.dart';

class GetUsersData {
  static Future<FirebaseModel>retrieveUserData(String userId, String password) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
          .collection(Endpoints.users)
          .where('arid', isEqualTo: userId)
          .where('password', isEqualTo: password)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        var userData = querySnapshot.docs.first.data();
        return FirebaseModel<User>.fromJson(
          {
            'status': true,
            'timeStamp': DateTime.now().toIso8601String(),
            'message': 'User found',
            'data': userData,
          },(json) => User.fromFireStore(json as Map<String, dynamic>),
        );
      } else {
        return FirebaseModel<User>(
          status: true,
          timeStamp: DateTime.now(),
          message: 'User not found or incorrect credentials',
          data: null,
        );
      }
    } catch (e) {
      return FirebaseModel<User>(
        status: false,
        message: 'Error occurred: ${e.toString()}',
        data: null,
        timeStamp: DateTime.now()
      );
    }
  }
}