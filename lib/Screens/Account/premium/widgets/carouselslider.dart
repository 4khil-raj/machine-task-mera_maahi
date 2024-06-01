import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:mere_maahi_dummy/Screens/Account/premium/widgets/gold1.dart';
import 'package:mere_maahi_dummy/Screens/Account/premium/widgets/gold2.dart';
import 'package:mere_maahi_dummy/Screens/Account/premium/widgets/platinum.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselPremiumPage extends StatefulWidget {
  const CarouselPremiumPage({super.key});

  @override
  State<CarouselPremiumPage> createState() => _CarouselPremiumPageState();
}

class _CarouselPremiumPageState extends State<CarouselPremiumPage> {
  List containers = [
    const GoldContainer1(),
    const GoldContainer2(),
    const PlatinumPremium()
  ];
  int sliderIndex = 0;
  final CarouselController _carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: _carouselController,
          options: CarouselOptions(
            // animateToClosest: true,
            disableCenter: true,
            enlargeCenterPage: true,
            height: 370, // Adjust height as needed
            initialPage: 1,
            autoPlay: true,
            autoPlayInterval:
                const Duration(seconds: 10), // Slide every 10 seconds
            autoPlayAnimationDuration:
                const Duration(milliseconds: 900), // Animation duration
            viewportFraction: 0.67,
            // enableInfiniteScroll: false,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                sliderIndex = index;
              });
            },
          ),
          itemCount: containers.length,
          itemBuilder: (context, index, realIndex) {
            return ClipRRect(
                borderRadius: BorderRadius.circular(1),
                child: containers[index]);
          },
        ),
        const SizedBox(height: 30),
        AnimatedSmoothIndicator(
          activeIndex: sliderIndex,
          count: 3,
          effect: const ExpandingDotsEffect(
            dotHeight: 8,
            dotWidth: 8,
            activeDotColor: Color.fromARGB(255, 255, 0, 0),
            dotColor: Color.fromARGB(255, 0, 0, 0),
          ),
          onDotClicked: (index) {
            _carouselController.animateToPage(index);
          },
        ),
      ],
    );
  }
}
