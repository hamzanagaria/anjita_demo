import 'package:anjita_demo/models/page_view.dart';
import 'package:anjita_demo/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HorizontalList extends StatefulWidget {
  final String title;
  final String path; // Optional icon path

  final List<PageViewModel> list;
  const HorizontalList(
      {super.key, required this.title, required this.path, required this.list});

  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                widget.path,
                height: 60,
              ),
              const SizedBox(width: 20),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(widget.title,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    )),
              )
            ],
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: SizedBox(
              height: 200,
              child: PageView.builder(
                padEnds: false,
                controller: PageController(viewportFraction: 0.46),
                itemCount: widget.list.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = widget.list[index];
                  return Stack(
                    children: [
                      SizedBox(
                        height: 200,
                        width: 135,
                        child: Column(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(item.path ?? "")),
                            const SizedBox(height: 17),
                            Text(item.name ?? "",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ))
                          ],
                        ),
                      ),
                      Positioned(
                          bottom: 50,
                          left: 38,
                          child: SvgPicture.asset(
                            Constant.svg_storyBoicPLay,
                            height: 55,
                          )),
                    ],
                  );
                },
              )),
        )
      ],
    );
  }
}
