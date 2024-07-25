// ignore_for_file: constant_identifier_names

import 'package:anjita_demo/models/page_view.dart';

class Constant {
  static const int addUser = 1; //"add_user";
  static const int AllUser = 2; //"add_user";

  static const bool FALSE = false; //"add_user";
  static const bool TRUE = true; //"add_user";

  //Images
  static const String homeHeader = "assets/images/home-header.png";
  static const String storyTopCloud = "assets/images/story-top-cloud.png";
  static const String cloudHeader = "assets/images/cloud-header.png";
  static const String lock1 = "assets/images/lock-1.png";
  static const String storyBottomCloud = "assets/images/story-bottom-cloud.png";
  static const String enormousTurnip = "assets/images/enormous_turnip.jpeg";
  static const String tiddalick = "assets/images/tiddalick.jpg";
  static const String apj = "assets/images/abdulkalamsir.jpg";

  static const String ganesha = "assets/images/ganesha.jpg";
  static const String phonics = "assets/images/phonics.png";
  static const String girl = "assets/images/girl.jpg";

  static const String animals = "assets/images/animals.jpg";

  //Svg
  static const String svg_star = "assets/images/svg/star.svg";
  static const String svg_ststarPremium = "assets/images/svg/star_premium.svg";
  static const String svg_icStart = "assets/images/svg/ic_star.svg";
  static const String svg_icShare = "assets/images/svg/ic_share.svg";
  static const String svg_storyBoicPLay = "assets/images/svg/ic_play.svg";
  static const String svg_icPause = "assets/images/svg/ic_pause.svg";
  static const String svg_icClose = "assets/images/svg/ic_close.svg";
  static const String svg_downloadUnsubscribed =
      "assets/images/svg/download_unsubscribed.svg";
  static const String svg_cloudBottomSheetDialogTop =
      "assets/images/svg/cloud_bottomsheetdialog_top.svg";

  static List<PageViewModel> pageviewList = [
    PageViewModel(name: "Enormous Turnip", path: enormousTurnip),
    PageViewModel(name: "Enormous Turnip", path: enormousTurnip),
    PageViewModel(name: "Enormous Turnip", path: enormousTurnip),
    PageViewModel(name: "Enormous Turnip", path: enormousTurnip)
  ];
  static List<PageViewModel> favList = [
    PageViewModel(name: "Tiddalick", path: tiddalick),
    PageViewModel(name: "Tiddalick", path: tiddalick),
    PageViewModel(name: "Tiddalick", path: tiddalick),
    PageViewModel(name: "Tiddalick", path: tiddalick),
    PageViewModel(name: "Tiddalick", path: tiddalick),
    PageViewModel(name: "Tiddalick", path: tiddalick),
    PageViewModel(name: "Tiddalick", path: tiddalick),
    PageViewModel(name: "Tiddalick", path: tiddalick),
    PageViewModel(name: "Tiddalick", path: tiddalick),
    PageViewModel(name: "Tiddalick", path: tiddalick)
  ];
  static List<PageViewModel> apjList = [
    PageViewModel(name: "Apj Abdul Kalam", path: apj),
    PageViewModel(name: "Apj Abdul Kalam", path: apj),
    PageViewModel(name: "Apj Abdul Kalam", path: apj),
    PageViewModel(name: "Apj Abdul Kalam", path: apj),
    PageViewModel(name: "Apj Abdul Kalam", path: apj),
    PageViewModel(name: "Apj Abdul Kalam", path: apj),
    PageViewModel(name: "Apj Abdul Kalam", path: apj),
    PageViewModel(name: "Apj Abdul Kalam", path: apj),
    PageViewModel(name: "Apj Abdul Kalam", path: apj),
    PageViewModel(name: "Apj Abdul Kalam", path: apj),
  ];
  static List<PageViewModel> ganList = [
    PageViewModel(name: "Ganesha", path: ganesha),
    PageViewModel(name: "Ganesha", path: ganesha),
    PageViewModel(name: "Ganesha", path: ganesha),
    PageViewModel(name: "Ganesha", path: ganesha),
    PageViewModel(name: "Ganesha", path: ganesha),
    PageViewModel(name: "Ganesha", path: ganesha),
    PageViewModel(name: "Ganesha", path: ganesha),
    PageViewModel(name: "Ganesha", path: ganesha),
    PageViewModel(name: "Ganesha", path: ganesha),
    PageViewModel(name: "Ganesha", path: ganesha),
  ];
  static List<PageViewModel> ponList = [
    PageViewModel(name: "Letter A", path: phonics),
    PageViewModel(name: "Letter B", path: phonics),
    PageViewModel(name: "Letter C", path: phonics),
    PageViewModel(name: "Letter D", path: phonics),
    PageViewModel(name: "Letter E", path: phonics),
    PageViewModel(name: "Letter F", path: phonics),
    PageViewModel(name: "Letter G", path: phonics),
    PageViewModel(name: "Letter H", path: phonics),
    PageViewModel(name: "Letter I", path: phonics),
    PageViewModel(name: "Letter J", path: phonics),
  ];
  static List<PageViewModel> girlList = [
    PageViewModel(name: "The girl Book", path: girl),
    PageViewModel(name: "The girl Book", path: girl),
    PageViewModel(name: "The girl Book", path: girl),
    PageViewModel(name: "The girl Book", path: girl),
    PageViewModel(name: "The girl Book", path: girl),
    PageViewModel(name: "The girl Book", path: girl),
    PageViewModel(name: "The girl Book", path: girl),
    PageViewModel(name: "The girl Book", path: girl),
    PageViewModel(name: "The girl Book", path: girl),
    PageViewModel(name: "The girl Book", path: girl),
  ];
  static List<PageViewModel> animalsList = [
    PageViewModel(name: "The animals story", path: animals),
    PageViewModel(name: "The animals story", path: animals),
    PageViewModel(name: "The animals story", path: animals),
    PageViewModel(name: "The animals story", path: animals),
    PageViewModel(name: "The animals story", path: animals),
    PageViewModel(name: "The animals story", path: animals),
    PageViewModel(name: "The animals story", path: animals),
    PageViewModel(name: "The animals story", path: animals),
  ];
}
