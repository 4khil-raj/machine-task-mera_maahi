import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mere_maahi_dummy/Screens/Passions/passions_screen.dart';
import 'package:mere_maahi_dummy/auth/sign_in/signIn_with_email.dart';
import 'package:mere_maahi_dummy/auth/sign_up/signUp_main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingThreeScreen extends StatefulWidget {
  const OnboardingThreeScreen({Key? key}) : super(key: key);

  @override
  _OnboardingThreeScreenState createState() => _OnboardingThreeScreenState();
}

class _OnboardingThreeScreenState extends State<OnboardingThreeScreen> {
  int _sliderIndex = 0;

  final List<Widget> _sliderItems = [
    Image.asset(
        'assets/images/img5.jpg'), // Assuming img1.jpg is in your assets folder
    Image.asset(
        'assets/images/img4.jpg'), // Assuming img2.jpg is in your assets folder
    Image.asset(
        'assets/images/img.jpg'), // Assuming img3.jpg is in your assets folder
  ];

  final List<Widget> _text = [
    const Text(
      'Algorithm',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xFFE94057),
        fontSize: 24,
        fontFamily: 'Sk-Modernist',
        fontWeight: FontWeight.w700,
        height: 0.06,
      ),
    ),
    const Text(
      'Matches',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xFFE94057),
        fontSize: 24,
        fontFamily: 'Sk-Modernist',
        fontWeight: FontWeight.w700,
        height: 0.06,
      ),
    ),
    const Text(
      'Premium',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xFFE94057),
        fontSize: 24,
        fontFamily: 'Sk-Modernist',
        fontWeight: FontWeight.w700,
        height: 0.06,
      ),
    ),
  ];

  final List<Widget> _textLine = [
    const Text(
      'Users going through a vetting process to\nensure you never match with bots.',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xFF323755),
        fontSize: 14,
        fontFamily: 'Sk-Modernist',
        fontWeight: FontWeight.w400,
        height: 1,
      ),
    ),
    const Text(
      'We match you with people that have a\nlarge array of similar interests.',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xFF323755),
        fontSize: 14,
        fontFamily: 'Sk-Modernist',
        fontWeight: FontWeight.w400,
        height: 1,
      ),
    ),
    const Text(
      'Sign up today and enjoy the first month\nof premium benefits on us.',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xFF323755),
        fontSize: 14,
        fontFamily: 'Sk-Modernist',
        fontWeight: FontWeight.w400,
        height: 1,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: Column(
              children: [
                _buildSliderSection(),
                const SizedBox(
                  height: 70,
                ),
                InkWell(
                  onTap: () {
                    Get.to(const SignUpScreen(),
                        transition: Transition.rightToLeftWithFade);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => const SignUpScreen()));
                  },
                  child: Container(
                    width: 295,
                    height: 56,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFE94057),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Create an account',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Sk-Modernist',
                          fontWeight: FontWeight.w700,
                          height: 0.09,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 2.0),
                others(),
                // Smooth indicator and other buttons can be added here
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget others() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account?',
              style: TextStyle(
                color: Colors.black.withOpacity(0.699999988079071),
                fontSize: 14,
                fontFamily: 'Sk-Modernist',
                fontWeight: FontWeight.w400,
                height: 0.11,
              ),
            ),
            TextButton(
              onPressed: () {
                Get.to(const SignInScreen(),
                    transition: Transition.rightToLeft);
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (builder) => const SignInScreen()));
              },
              child: const Text(
                ' Sign In',
                style: TextStyle(
                  color: Color(0xFFE94057),
                  fontSize: 14,
                  fontFamily: 'Sk-Modernist',
                  fontWeight: FontWeight.w700,
                  height: 0.11,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSliderSection() {
    return SingleChildScrollView(
        child: Column(children: [
      CarouselSlider.builder(
        options: CarouselOptions(
          disableCenter: true,
          enlargeCenterPage: true,
          height: 400, // Adjust height as needed
          initialPage: 1,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 4), // Slide every 3 seconds
          autoPlayAnimationDuration:
              const Duration(milliseconds: 900), // Animation duration
          viewportFraction: 0.67,
          enableInfiniteScroll: false,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index, reason) {
            setState(() {
              _sliderIndex = index;
            });
          },
        ),
        itemCount: _sliderItems.length,
        itemBuilder: (context, index, realIndex) {
          return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: _sliderItems[index]);
        },
      ),
      const SizedBox(
        height: 23,
      ),
      _text[_sliderIndex],
      const SizedBox(
        height: 40,
      ),
      _textLine[_sliderIndex],
      const SizedBox(
        height: 30,
      ),
      AnimatedSmoothIndicator(
        activeIndex: _sliderIndex,
        count: _sliderItems.length,
        effect: const WormEffect(
          dotColor: Colors.grey,
          activeDotColor: Colors.blue,
          dotHeight: 8,
          dotWidth: 8,
        ),
      ),
    ]));
  }
}
