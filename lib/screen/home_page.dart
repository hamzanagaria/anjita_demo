import 'package:anjita_demo/screen/add_user.dart';
import 'package:anjita_demo/screen/all_user.dart';
import 'package:anjita_demo/utils/color_constant.dart';
import 'package:anjita_demo/utils/constant.dart';
import 'package:anjita_demo/widgts/horizontal_list.dart';
import 'package:anjita_demo/widgts/page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(Constant.homeHeader),
                Positioned(
                    left: 10,
                    top: 0,
                    child: SvgPicture.asset(Constant.svg_ststarPremium)),
                Positioned(
                    right: 0,
                    top: 0,
                    child: PopupMenuButton<int>(
                      iconColor: ColorConstant.white,
                      onSelected: (value) {
                        if (value == Constant.AllUser) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AllUsers(),
                              ));
                        } else if (value == Constant.addUser) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AddUser(),
                              ));
                        }
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem<int>(
                            value: Constant.addUser, child: Text('Add User')),
                        const PopupMenuItem<int>(
                            value: Constant.AllUser, child: Text('All User')),
                      ],
                    )),
                Image.asset(Constant.cloudHeader),
              ],
            ),
            Container(
              color: ColorConstant.white,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  PageViewItem(),
                  HorizontalList(
                    list: Constant.favList,
                    title: 'Favourites',
                    path: Constant.svg_icStart,
                  ),
                  HorizontalList(
                    list: Constant.apjList,
                    title: 'Everyday Stories',
                    path: Constant.svg_icStart,
                  ),
                  HorizontalList(
                    list: Constant.ganList,
                    title: 'Indian Mythological Tales',
                    path: Constant.svg_icStart,
                  ),
                  HorizontalList(
                    list: Constant.ponList,
                    title: 'ABC Phonics stories',
                    path: Constant.svg_icStart,
                  ),
                  HorizontalList(
                    list: Constant.girlList,
                    title: 'Storyweaver',
                    path: Constant.svg_icStart,
                  ),
                  HorizontalList(
                    list: Constant.animalsList,
                    title: 'Animal Stories',
                    path: Constant.svg_icStart,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
