import 'package:flutter/material.dart';
import 'package:mere_maahi_dummy/core/app_export.dart';
import 'package:readmore/readmore.dart';

import 'InterestsChipView.dart';

class ProfileScreen1 extends StatelessWidget {
  const ProfileScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                    child: SizedBox(
                        height: 1270,
                        width: double.infinity,
                        child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              _buildProfileStack(context),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  padding: const EdgeInsets.only(bottom: 20,left: 25,right: 25),
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(30))),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // SizedBox(
                                      //   height: 53,
                                      // ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(top: 3),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  const Text(
                                                    "Jessica Parker, 23",
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Text(
                                                    'Proffesional model',
                                                    style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(
                                                              0.699999988079071),
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'Sk-Modernist',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0.11,
                                                    ),
                                                  ),
                                                ]),
                                          ),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.edit_rounded,
                                                  color: Colors.red
                                                      .withOpacity(0.69)))
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 31,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 3),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Location',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontFamily: 'Sk-Modernist',
                                                    fontWeight: FontWeight.w700,
                                                    height: 0.09,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Text(
                                                  'Chicago, IL United States',
                                                  style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(
                                                            0.699999988079071),
                                                    fontSize: 14,
                                                    fontFamily: 'Sk-Modernist',
                                                    fontWeight: FontWeight.w400,
                                                    height: 0.11,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Opacity(
                                            opacity: .90,
                                            child: Container(
                                              width: 61,
                                              height: 34,
                                              decoration: ShapeDecoration(
                                                color: Color(0xFFE94057),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                ),
                                              ),
                                              child: const Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Icon(
                                                      Icons.location_on_rounded,
                                                      color: Colors.white,
                                                      size: 15,
                                                    ),
                                                    Text(
                                                      '1 km',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontFamily:
                                                            'Sk-Modernist',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        height: 0.12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      const Text(
                                        'About',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: 'Sk-Modernist',
                                          fontWeight: FontWeight.w700,
                                          height: 0.09,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: 290,
                                        child: ReadMoreText(
                                          "My name is Jessica Parker and I enjoy meeting new people and finding ways to help them have an uplifting experience. I enjoy reading..",
                                          trimLines: 3,
                                          trimMode: TrimMode.Line,
                                          trimCollapsedText: 'Read more',
                                          lessStyle: TextStyle(
                                            color: Colors.red
                                                .withOpacity(0.699999988079071),
                                            fontSize: 14,
                                            fontFamily: 'Sk-Modernist',
                                          ),
                                          moreStyle: TextStyle(
                                            color: Colors.red
                                                .withOpacity(0.699999988079071),
                                            fontSize: 14,
                                            fontFamily: 'Sk-Modernist',
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 33,
                                      ),
                                      const Text(
                                        'Interests',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: 'Sk-Modernist',
                                          fontWeight: FontWeight.w700,
                                          height: 0.09,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 32,
                                      ),
                                      _buildInterests(context),
                                      SizedBox(
                                        height: 35,
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Gallery',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontFamily: 'Sk-Modernist',
                                              fontWeight: FontWeight.w700,
                                              height: 0.09,
                                            ),
                                          ),
                                          Text(
                                            'See all',
                                            style: TextStyle(
                                              color: Color(0xFFE94057),
                                              fontSize: 14,
                                              fontFamily: 'Sk-Modernist',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgPhoto24,
                                              height: 190,
                                              width: 142,
                                              radius: BorderRadius.circular(5)),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgPhoto25,
                                              height: 190,
                                              width: 143,
                                              radius: BorderRadius.circular(5))
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgPhoto26,
                                                height: 122,
                                                width: 92,
                                                radius:
                                                    BorderRadius.circular(5)),
                                            CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgPhoto27,
                                                height: 122,
                                                width: 91,
                                                radius:
                                                    BorderRadius.circular(5)),
                                            CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgPhoto28,
                                                height: 122,
                                                width: 92,
                                                radius:
                                                    BorderRadius.circular(5))
                                          ])
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 337),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, bottom: 11),
                                        child: Container(
                                          width: 78,
                                          height: 78,
                                          decoration: const ShapeDecoration(
                                            color: Colors.white,
                                            shape: OvalBorder(),
                                            shadows: [
                                              BoxShadow(
                                                color: Color(0x11000000),
                                                blurRadius: 50,
                                                offset: Offset(0, 20),
                                                spreadRadius: 0,
                                              )
                                            ],
                                          ),
                                          child: IconButton(
                                            onPressed: () {},
                                            icon: CustomImageView(
                                              color: Colors.red,
                                              imagePath: ImageConstant
                                                  .imgCloseYellow900,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 99,
                                        width: 99,
                                        decoration: const ShapeDecoration(
                                          color: Color(0xFFE94057),
                                          shape: OvalBorder(),
                                          shadows: [
                                            BoxShadow(
                                              color: Color(0x33E94057),
                                              blurRadius: 15,
                                              offset: Offset(0, 15),
                                              spreadRadius: 0,
                                            )
                                          ],
                                        ),
                                        margin: const EdgeInsets.only(left: 20),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 28, vertical: 30),
                                        child: CustomImageView(
                                            color: Colors.white,
                                            imagePath: ImageConstant
                                                .imgContrastOnprimary,
                                            height: 36,
                                            width: 42,
                                            alignment: Alignment
                                                .bottomCenter),
                                      ),
                                      SizedBox(width: 10,),
                                      Container(
                                        width: 78,
                                        height: 78,
                                        decoration: const ShapeDecoration(
                                          color: Colors.white,
                                          shape: OvalBorder(),
                                          shadows: [
                                            BoxShadow(
                                              color: Color(0x11000000),
                                              blurRadius: 50,
                                              offset: Offset(0, 20),
                                              spreadRadius: 0,
                                            )
                                          ],
                                        ),
                                        child: IconButton(
                                          onPressed: () {},
                                          icon:CustomImageView(
                                              color: Color.fromRGBO(
                                                  138, 35, 135, 1),
                                              imagePath:
                                              ImageConstant.imgSignal,
                                              height: 30,
                                              width: 30,
                                              alignment: Alignment.center))
                                        ),
                                    ],
                                  ),
                                ),
                              )
                            ]))))));
  }

  Widget _buildInterests(BuildContext context) {
    return Wrap(
        runSpacing: 10,
        spacing: 10,
        children:
            List<Widget>.generate(5, (index) => const InterestsChipView()));
  }

  Widget _buildProfileStack(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
            height: 415,
            width: double.infinity,
            child: Stack(alignment: Alignment.topLeft, children: <Widget>[
              CustomImageView(
                imagePath: ImageConstant.imgPhoto23,
                width: 400,
                height: 420,
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 40),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      height: 55,
                      width: 50,
                      decoration: ShapeDecoration(
                        color: Colors.white.withOpacity(0.20000000298023224),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0xFFE8E6EA)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      alignment: Alignment.topLeft,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 6.0),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.red,
                          ),
                        ),
                      )),
                ),
              )
            ])));
  }
}
