import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class GetAllUserLengthController extends GetxController {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late StreamSubscription<QuerySnapshot<Map<String, dynamic>>>
      userStreamSubscription;
  final Rx<int> userCollectionLength = Rx<int>(0);
  @override
  void onInit() {
    super.onInit();
    userStreamSubscription = firebaseFirestore
        .collection('UserDetail')
        .snapshots()
        .listen((snapshot) {
      userCollectionLength.value = snapshot.size;
    });
  }

  @override
  void onClose() {
    userStreamSubscription.cancel();
    super.onClose();
  }
}
