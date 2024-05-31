import 'package:admin_panel/controller/get_all_user_length.dart';
import 'package:admin_panel/models/user_model.dart';
import 'package:admin_panel/utils/app_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

class AllUserScreen extends StatefulWidget {
  const AllUserScreen({super.key});

  @override
  State<AllUserScreen> createState() => _AllUserScreenState();
}

class _AllUserScreenState extends State<AllUserScreen> {
  final GetAllUserLengthController getAllUserLengthController =
      Get.put(GetAllUserLengthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          return Text(
              'User (${getAllUserLengthController.userCollectionLength.toString()})');
        }),
        backgroundColor: AppConstant.appMainColor,
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance.collection('UserDetail').get(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Container(
                child: const Center(
                  child: Text("Error occur while featching category"),
                ),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                  child: const Center(child: CupertinoActivityIndicator()));
            }
            if (snapshot.data!.docs.isEmpty) {
              return const Center(child: Text('No User Found'));
            }
            if (snapshot.data != null) {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final data = snapshot.data!.docs[index];
                    UserModel userModel = UserModel(
                        // uId: data['uid'],
                        username: data['Name'],
                        email: data['email'],
                        // phone: data['phone'],
                        // userImg: data['userImg'],
                        // userDeviceToken: data['userDeviceToken'],
                        country: data['country'],
                        userAddress: data['address'],
                        // street: data['street'],
                        // isAdmin: data['isAdmin'],
                        // isActive: data['isActive'],
                        // createdOn: data['createdOn'],
                        // city: data['city'],
                        type: data['Type']);
                    return Card(
                      elevation: 5,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: AppConstant.appScendoryColor,
                          // backgroundImage: CachedNetworkImageProvider(
                          //     userModel.userImg, errorListener: (err) {
                          //   print("Error loading image");
                          //   const Icon(Icons.error);
                          // }
                          // ),
                        ),
                        title: Text(userModel.username),
                        subtitle: Text(userModel.email),
                        trailing: const Icon(Icons.edit),
                      ),
                    );
                  });
            }
            return Container();
          }),
    );
  }
}
