import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:live_streaming_app/core/routes/routes.dart';
import 'package:live_streaming_app/features/live_streaming/model/user_model.dart';
import 'package:live_streaming_app/features/live_streaming/view/live_streaming_screen.dart';


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


  // start live streaming...............
  Future<void> startLiveStreaming() async {
    final currentUser = _auth.currentUser!;
    final liveId = "${currentUserId}_${DateTime.now().microsecondsSinceEpoch}";

    await updateLiveStatus(currentUserId, true, liveId);

    await Get.to(() => LiveStreamingScreen(
      userId: currentUserId,
      userName: currentUser.displayName ?? "Host",
      isHost: true,
      liveId: liveId,
      hostName: currentUser.displayName ?? "Host",
    ));

    await updateLiveStatus(currentUserId, false, null);
  }


  // user onTap..................
  void handleUserOnTap(UserModel user){
    if(user.isLive && user.liveId != null){
      // join live stream as audience..
      Get.to(()=> LiveStreamingScreen(
          userId: currentUserId,
          userName: _auth.currentUser!.displayName ?? "Audience",
          isHost: false,
          liveId: user.liveId!,
          hostName: user.userName,
        )
      );
    } else{
      // user is not live...
      EasyLoading.showError("${user.userName} is not live right now." );
    }
  }
}