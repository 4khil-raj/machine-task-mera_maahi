// import 'package:get/get.dart';
// import 'package:mere_maahi_dummy/core/app_export.dart';
// import '../../../Widget/CustomImageViewer.dart';
// import '../controller/onboarding_three_controller.dart';
// import '../models/slidersection1_item_model.dart';
// import 'package:flutter/material.dart';

// // ignore: must_be_immutable
// class Slidersection1ItemWidget extends StatelessWidget {
//   Slidersection1ItemWidget(
//     this.slidersection1ItemModelObj, {
//     Key? key,
//   }) : super(
//           key: key,
//         );

//   Slidersection1ItemModel slidersection1ItemModelObj;

//   // var controller = Get.find<OnboardingThreeController>();

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: Padding(
//         padding: EdgeInsets.only(
//           left: 55.h,
//           // top: 300.v,
//           // bottom: 56.v,
//         ),
//         child: Obx(
//           () => Column(
//             children: [
//               ///Image
//               CustomImageView(
//                 imagePath: slidersection1ItemModelObj.girlOne!.value,
//                 height: 380.v,
//                 width: 270.h,
//                 radius: BorderRadius.circular(
//                   15.h,
//                 ),
//               ),
//               SizedBox(
//                 height: 25,
//               ),

//               //Text( Premium, Algorithm, Matches )
//               Text(
//                 slidersection1ItemModelObj.premium!.value,
//                 style: TextStyle(
//                   color: Color(0xFFE94057),
//                   fontSize: 24,
//                   fontFamily: 'Sk-Modernist',
//                   fontWeight: FontWeight.w700,
//                   height: 0.06,
//                 ),
//               ),
//               SizedBox(
//                 height: 28,
//               ),

//               ///Lines
//               Text(
//                 slidersection1ItemModelObj.id!.value,
//                 style: TextStyle(
//                   color: Color(0xFF323755),
//                   fontSize: 14,
//                   fontFamily: 'Sk-Modernist',
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
