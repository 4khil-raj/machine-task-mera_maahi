import 'package:flutter/material.dart';
import 'package:mere_maahi_dummy/Screens/ChatScreen/chatpage.dart';
import 'package:mere_maahi_dummy/Screens/ChatScreen/push.dart';
import 'package:mere_maahi_dummy/Screens/ChatScreen/repo.dart';
import 'package:mere_maahi_dummy/Screens/ChatScreen/userTile.dart';
import 'package:mere_maahi_dummy/Screens/SplashScreen/splash_service.dart';
import 'package:mere_maahi_dummy/core/app_export.dart';

import '../../core/utils/size_utils.dart';

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
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 8),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 31,
                height: 31,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: CustomImageView(
                  imagePath: ImageConstant.imgThumbsUpPrimary52x52,
                  color: Colors.red,
                ),
              ),
            ),
          )
        ],
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
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Activities',
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
            const SizedBox(height: 15),
            _buildUserProfileList(context),
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
              height: 9,
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
                    return Text('loading');
                  }

                  return ListView(
                    children: snapshot.data!
                        .map<Widget>(
                            (userData) => _buildUserListItem(userData, context))
                        .toList(),
                  );
                },
              ),
            )

            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Container(
            //         height: 56,
            //         width: 56,
            //         padding: const EdgeInsets.all(2),
            //         child: CustomImageView(
            //           imagePath: ImageConstant.imgPhoto48x48,
            //           height: 48,
            //           width: 48,
            //           radius: BorderRadius.circular(
            //             24,
            //           ),
            //           alignment: Alignment.center,
            //         ),
            //       ),
            //       const Padding(
            //         padding: EdgeInsets.only(
            //           left: 10,
            //           top: 9,
            //           bottom: 9,
            //         ),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               "Emelie",
            //             ),
            //             SizedBox(height: 2),
            //             Text(
            //               "Sticker 😍",
            //             ),
            //           ],
            //         ),
            //       ),
            //       const Spacer(),
            //       Padding(
            //         padding: const EdgeInsets.only(
            //           top: 11,
            //           bottom: 6,
            //         ),
            //         child: Column(
            //           children: [
            //             const Text(
            //               "23 min",
            //             ),
            //             const SizedBox(height: 3),
            //             Align(
            //               alignment: Alignment.centerRight,
            //               child: Container(
            //                   width: 20,
            //                   padding: const EdgeInsets.symmetric(
            //                     vertical: 2,
            //                   ),
            //                   child: Container(
            //                     width: 50,
            //                     height: 20,
            //                     decoration: const ShapeDecoration(
            //                       color: Color(0xFFE94057),
            //                       shape: OvalBorder(),
            //                     ),
            //                     child: const Center(
            //                       child: Text(
            //                         '1',
            //                         textAlign: TextAlign.center,
            //                         style: TextStyle(
            //                           color: Colors.white,
            //                           fontSize: 12,
            //                           fontFamily: 'Sk-Modernist',
            //                           fontWeight: FontWeight.w700,
            //                           height: 0.12,
            //                         ),
            //                       ),
            //                     ),
            //                   )),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            ,
            SizedBox(
              height: 10,
            ),
            // _buildChatMessageList(context)
          ])),
    ));
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    if (userData['email'] != userId) {
      return UserTile(
        text: userData['email'],
        profile: userData['userProfile'],
        onTap: () {
          print(userId);
          customNavPush(
              context,
              ChatPage(
                receiverID: userData['email'],
                receiverEmail: userData['email'],
              ));
        },
      );
    } else {
      return const SizedBox();
    }
  }

  ///ChatMessage List

  Widget _buildChatMessageList(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgPhoto16,
                      height: 48,
                      width: 48,
                      radius: BorderRadius.circular(
                        24,
                      ),
                      margin: const EdgeInsets.only(bottom: 1),
                    ),
                    Expanded(
                        child: Padding(
                      padding:
                          const EdgeInsets.only(left: 14, top: 7, bottom: 1),
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Abigail',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Sk-Modernist',
                                  fontWeight: FontWeight.w700,
                                  height: 0.11,
                                ),
                              ),
                              Text(
                                '27 min',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xFFADAFBB),
                                  fontSize: 12,
                                  fontFamily: 'Sk-Modernist',
                                  fontWeight: FontWeight.w700,
                                  height: 0.12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                  top: 17,
                                ),
                                child: Text(
                                  'Typing..',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Sk-Modernist',
                                    fontWeight: FontWeight.w400,
                                    height: 0.11,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  padding: const EdgeInsets.only(top: 8),
                                  decoration: const ShapeDecoration(
                                    color: Color(0xFFE94057),
                                    shape: OvalBorder(),
                                  ),
                                  child: const Text(
                                    '2',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'Sk-Modernist',
                                      fontWeight: FontWeight.w700,
                                      height: 0.12,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.5),
                child: SizedBox(
                  width: 300,
                  child: Divider(
                    height: 1,
                    thickness: 1,
                    color: Colors.grey.shade200,
                  ),
                ),
              );
            },
            itemCount: 5),
      ),
    );
  }

  ///Profile List
  Widget _buildUserProfileList(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        height: 95,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 10),
            itemBuilder: (context, index) {
              return SizedBox(
                width: 66,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 1),
                    child: Column(
                      children: [
                        Container(
                          height: 66,
                          width: 66,
                          padding: const EdgeInsets.all(2),
                          decoration: const ShapeDecoration(
                            color: Colors.white,
                            shape: OvalBorder(
                              side: BorderSide(
                                  width: 2, color: Color(0xFFF27121)),
                            ),
                          ),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgPhoto58x58,
                            height: 58,
                            width: 58,
                            radius: BorderRadius.circular(
                              29,
                            ),
                            alignment: Alignment.center,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text('Che_09')
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 15);
            },
            itemCount: 10),
      ),
    );
  }
}
