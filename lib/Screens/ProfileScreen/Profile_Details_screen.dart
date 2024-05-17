import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:readmore/readmore.dart';
import '../../Widget/CustomImageViewer.dart';
import '../../core/utils/image_constant.dart';

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: SizedBox(
            height: 1500,
            width: double.maxFinite,
            child: Column(
              // alignment: Alignment.bottomCenter,
              children: [
                _buildProfileStack(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 22.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                              style: IconButton.styleFrom(elevation: 3),
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                'assets/images/img_close_yellow_900.svg',
                                height: 50,
                                width: 30,
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: IconButton(
                            style: IconButton.styleFrom(elevation: 2),
                            onPressed: () {},
                            icon: CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.red,
                              child: SvgPicture.asset(
                                'assets/images/img_contrast_onprimary.svg',
                                height: 35,
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) =>
                                          const ProfileDetailScreen()));
                            },
                            icon: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: SvgPicture.asset(
                                  'assets/images/img_signal.svg'),
                            )),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 53,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 3),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mamta, 23',
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    "Single",
                                    style: TextStyle(color: Colors.red),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 52,
                              width: 62,
                              child: IconButton(
                                  onPressed: () {},
                                  icon:
                                      const Icon(Icons.double_arrow_outlined)),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 31,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 3),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Location',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  SizedBox(
                                    height: 9,
                                  ),
                                  Text(
                                    'Chicago, IL United States',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 34,
                              width: 90,
                              margin: const EdgeInsets.only(bottom: 16),
                              child: ElevatedButton(
                                  onPressed: () {}, child: const Text('1km')),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 33,
                        ),
                        const Text(
                          'About',
                          style: TextStyle(color: Colors.redAccent),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const SizedBox(
                          width: 288,
                          child: ReadMoreText(
                            'My name is Jessica Parker and I enjoy meeting new people and finding ways to help them have an uplifting experience. I enjoy reading..',
                            trimLines: 3,
                            colorClickableText: Colors.grey,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: "Read more",
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        _buildInterestsChipView(context),
                        const SizedBox(
                          height: 34,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Gallery',
                              style: TextStyle(color: Colors.red),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 2),
                              child: Text(
                                'See all',
                                style: TextStyle(color: Colors.red),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomImageView(
                              width: 160,
                              height: 190,
                              imagePath: ImageConstant.imgPhoto24,
                              radius: BorderRadius.circular(12),
                            ),
                            CustomImageView(
                              width: 160,
                              height: 190,
                              imagePath: ImageConstant.imgPhoto25,
                              radius: BorderRadius.circular(12),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgPhoto26,
                              height: 190,
                              width: 160,
                              radius: BorderRadius.circular(12),
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgPhoto27,
                              height: 190,
                              width: 160,
                              radius: BorderRadius.circular(12),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 11),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget _buildInterestsChipView(BuildContext context) {
    return Wrap(
      runSpacing: 10,
      spacing: 10,
    );
  }

  Widget _buildProfileStack() {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: 415,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgPhoto23,
              height: 415,
              width: double.infinity,
              alignment: Alignment.center,
            )
          ],
        ),
      ),
    );
  }
}
