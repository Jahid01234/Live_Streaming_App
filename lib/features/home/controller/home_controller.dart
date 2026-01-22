import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:live_streaming_app/core/routes/routes.dart';
import 'package:live_streaming_app/features/home/model/user_model.dart';

class HomeController extends GetxController{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late final String currentUserId = _auth.currentUser!.uid;

  // get all user stream......
  Stream<List<UserModel>> getUsersStream() {
    return _firestore
        .collection('users')
        .where('uid', isNotEqualTo: currentUserId)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => UserModel.fromMap(doc.data()))
          .toList();
    });
  }

  // update user live status......
  Future<void> updateLiveStatus( String userId, bool isLive, String? liveId) async{
    await _firestore.collection("users").doc(userId).update({
       'isLive': isLive,
       'liveId': liveId,
    });
  }

  // create or update user......
  Future<void> createOrUpdateUser(UserModel user) async{
    await _firestore.collection("users").doc(user.uid).set(user.toMap());
  }

  // get specific user............
  Future<UserModel?> getUser(String userId) async{
    final doc = await _firestore.collection("users").doc(userId).get();
    if(doc.exists){
      return UserModel.fromMap(doc.data()!);
    }
    return null;
  }


  // log out.....................
  Future<void> logout() async{
    await _auth.signOut();
    Get.offNamed(AppRoutes.login);
  }




}