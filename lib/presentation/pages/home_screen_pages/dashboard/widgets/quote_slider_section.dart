import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shiftsync/presentation/pages/home_screen_pages/dashboard/widgets/qnote_container.dart';

class QuoteSliderSection extends StatelessWidget {
  const QuoteSliderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.width * 0.66,
      child: CarouselSlider(
        items: [
          QuoteContainer(
            size: size,
            quote: '"Believe you can and you are \n halfway there." ',
            quoteBy: ' - Theodore Roosevelt',
            bgColor: const Color.fromARGB(255, 2, 66, 95),
          ),
          QuoteContainer(
            size: size,
            quote:
                '"Success is not the key to happiness. Happiness is the key to success. If you love what you are doing, you will be successful." ',
            quoteBy: ' - Albert Schweitzer',
            bgColor: const Color.fromARGB(255, 7, 99, 175),
          ),
          QuoteContainer(
            size: size,
            quote: '"The harder I work, the luckier I get." ',
            quoteBy: ' - Samuel Goldwyn',
            bgColor: const Color.fromARGB(255, 49, 125, 224),
          ),
        ],
        options: CarouselOptions(
          height: 205.0,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 1500),
          viewportFraction: 0.8,
        ),
      ),
    );
  }
}
