import 'package:flutter/material.dart';
import 'package:mere_maahi_dummy/Screens/ChatScreen/chatpage.dart';
import 'package:mere_maahi_dummy/Screens/ChatScreen/push.dart';
import 'package:mere_maahi_dummy/Screens/ChatScreen/repo.dart';
import 'package:mere_maahi_dummy/Screens/ChatScreen/userTile.dart';
import 'package:mere_maahi_dummy/Screens/SplashScreen/splash_service.dart';
import 'package:mere_maahi_dummy/core/app_export.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late final double? height;
  late final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        leadingWidth: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            'Messages',
            style: TextStyle(
              color: Colors.black,
              fontSize: 27,
              fontFamily: 'Sk-Modernist',
              fontWeight: FontWeight.w700,
              height: 0.04,
            ),
          ),
        ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(top: 8, right: 8),
        //     child: GestureDetector(
        //       onTap: () {},
        //       child: Container(
        //         width: 31,
        //         height: 31,
        //         decoration: ShapeDecoration(
        //           color: Colors.white,
        //           shape: RoundedRectangleBorder(
        //             side: const BorderSide(width: 1, color: Colors.grey),
        //             borderRadius: BorderRadius.circular(10),
        //           ),
        //         ),
        //         child: CustomImageView(
        //           imagePath: ImageConstant.imgThumbsUpPrimary52x52,
        //           color: Colors.red,
        //         ),
        //       ),
        //     ),
        //   )
        // ],
      ),
      resizeToAvoidBottomInset: false,
      // appBar: _buildAppBar(context),
      body: SizedBox(
          width: double.infinity,
          child: Column(children: [
            const SizedBox(height: 10),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Container(
                      margin: const EdgeInsets.fromLTRB(20, 14, 11, 14),
                      child: CustomImageView(
                        color: Colors.black,
                        imagePath: ImageConstant.imgSearch,
                        height: 20,
                        width: 20,
                      ),
                    ),
                    prefixIconConstraints: const BoxConstraints(maxHeight: 48),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: IconButton(
                          onPressed: () => controller.clear(),
                          icon: Icon(Icons.clear, color: Colors.grey.shade600)),
                    ),
                    isDense: true,
                    suffixIconConstraints: const BoxConstraints(maxHeight: 48),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1)),
                    border: InputBorder.none,
                    hintText: 'search here',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                )),
            const SizedBox(height: 15),
            const SizedBox(height: 15),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Messages',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Sk-Modernist',
                    fontWeight: FontWeight.w700,
                    height: 0.08,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            //
            Expanded(
              child: StreamBuilder(
                stream: ChatRepo().getUsersStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('error');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text('loading');
                  }
                  return ListView(
                    children: snapshot.data!
                        .map<Widget>(
                            (userData) => _buildUserListItem(userData, context))
                        .toList(),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ])),
    ));
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    if (userData['email'] != userId) {
      return UserTile(
        text: userData['username'],
        profile: userData['userProfile'],
        onTap: () {
          customNavPush(
              context,
              ChatPage(
                name: userData['username'],
                profileImage: userData['userProfile'],
                receiverID: userData['email'],
                receiverEmail: userData['email'],
              ));
        },
      );
    } else {
      return const SizedBox();
    }
  }
}
