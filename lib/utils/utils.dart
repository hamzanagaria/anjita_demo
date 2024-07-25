import 'dart:async';
import 'package:anjita_demo/widgts/loading_dialog.dart';
import 'package:flutter/material.dart';

import 'color_constant.dart';

class Utils {
  static showDownloadingDialog(BuildContext context,
      {required StreamController<String> streamController,
      void Function()? onProgress}) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
            child: LoadingDialog(
          onPressed: onProgress ?? () {},
          streamController: streamController,
        ));
      },
    );
  }

  static Future<bool> simpleDialog1(BuildContext context,
      {String? title,
      String? cancel,
      void Function()? onPress,
      Widget? child,
      bool? barrierDismissible,
      String? press,
      TextStyle? subTitleStyle,
      TextStyle? titleStyle,
      String? subTitle}) async {
    bool val = false;
    await showDialog(
      context: context,
      barrierDismissible: barrierDismissible ?? true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title ?? "Title", style: titleStyle),
          content: Text(subTitle ?? "Subtitle",
              style: subTitleStyle ??
                  const TextStyle(
                      fontSize: 13,
                      color: ColorConstant.black,
                      fontFamily: "Opensans",
                      height: 0.9,
                      fontWeight: FontWeight.bold)),
          actions: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (child != null) child,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      child: Text(cancel ?? 'Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                        val = false;
                      },
                    ),
                    const Spacer(),
                    TextButton(
                      child: Text(press ?? "Ok"),
                      onPressed: () async {
                        Navigator.pop(context);
                        if (onPress != null) {
                          onPress();
                        }
                        val = true;
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
    return val;
  }
}
