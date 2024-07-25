import 'package:anjita_demo/utils/color_constant.dart';
import 'package:anjita_demo/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewItem extends StatefulWidget {
  const PageViewItem({super.key});

  @override
  State<PageViewItem> createState() => _PageViewItemState();
}

class _PageViewItemState extends State<PageViewItem> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Container(
            height: 200,
            color: ColorConstant.white,
            child: PageView.builder(
              controller: _pageController,
              itemCount: Constant.pageviewList.length,
              itemBuilder: (context, index) {
                var item = Constant.pageviewList[index];
                return Center(
                  child: Stack(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(14.0),
                          child: Image.asset(Constant.enormousTurnip)),
                      Positioned(
                          left: 15,
                          top: 25,
                          child: Text(item.name ?? "",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstant.white,
                                ),
                              ))),
                      Positioned(
                          left: 15,
                          top: 50,
                          child: SvgPicture.asset(
                            Constant.svg_storyBoicPLay,
                            height: 60,
                          ))
                    ],
                  ),
                );
              },
            ),
          ),
          SmoothPageIndicator(
            controller: _pageController, // PageController
            count: Constant.pageviewList.length,

            axisDirection: Axis.horizontal,
            effect: const WormEffect(
                dotWidth: 10,
                dotHeight: 10,
                activeDotColor: ColorConstant.black,
                radius: 5),
          )
        ],
      ),
    );
  }
}
