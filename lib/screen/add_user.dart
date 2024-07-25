import 'dart:async';
import 'package:anjita_demo/service/network_manager.dart';
import 'package:anjita_demo/utils/utils.dart';
import 'package:flutter/material.dart';

import '../models/reponse_model.dart';
import '../utils/color_constant.dart';
import '../widgts/text_field.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerGender = TextEditingController();
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final NetworkManager _networkManager = NetworkManager();
  final GlobalKey<FormState> _globalKey = GlobalKey();
  Future<void> _addUser() async {
    StreamController<String> controller = StreamController();
    await Utils.showDownloadingDialog(
      context,
      streamController: controller,
      onProgress: () async {
        controller.sink.add("Uploading please wait..");
        var response = await _networkManager
            .postApi1("https://gorest.co.in/public/v2/users", requestBody: {
          "name": _controllerName.text,
          "gender": _controllerGender.text,
          "email": _controllerEmail.text,
          "status": "active"
        });
        if (response.runtimeType == ResponseData<Map<String, dynamic>>) {
          await Future.delayed(const Duration(milliseconds: 500));
          controller.done;
          if (mounted) {
            Navigator.pop(context);
            var isDone = await Utils.simpleDialog1(context,
                title: "Done",
                subTitle:
                    "User has successfully created with id :${response.object["id"]}");
            if (isDone && mounted) {
              Navigator.pop(context);
            }
          }
        } else if (response.runtimeType == ResponseData<String>) {
          await Future.delayed(const Duration(milliseconds: 500));
          controller.done;
          if (mounted) {
            Navigator.pop(context);
            Utils.simpleDialog1(context, subTitle: response.object);
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add User"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Form(
          key: _globalKey,
          child: Column(
            children: [
              const SizedBox(height: 50),
              textField2(
                controller: _controllerName,
                focusNode: _focusNode1,
                hintText: "Enter Name",
                labelText: "Name",
                validator: (val) {
                  if (val == null || (val).trim().isEmpty) {
                    return "Name can not be empty.";
                  } else if (val.length > 100) {
                    return "Name can not be greater then 100 Character.";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              textField2(
                controller: _controllerEmail,
                hintText: "Enter Email",
                focusNode: _focusNode2,
                labelText: "Email",
                validator: (val) {
                  if (val == null || (val).trim().isEmpty) {
                    return "Email can not be empty.";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              textField2(
                controller: _controllerGender,
                hintText: "Enter Gender",
                labelText: "Gender",
                focusNode: _focusNode3,
                validator: (val) {
                  if (val == null || (val).trim().isEmpty) {
                    return "Gender can not be empty.";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              nextButton(
                onPressed: () {
                  if (_globalKey.currentState!.validate()) {
                    _focusNode1.unfocus();
                    _focusNode1.unfocus();
                    _focusNode1.unfocus();
                    _addUser();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget nextButton(
      {required void Function()? onPressed,
      Widget? child,
      String? text,
      double? horizontal,
      bool? loading,
      TextStyle? textStyle,
      Color? backgroundColor,
      ButtonStyle? style}) {
    return ElevatedButton(
        style: style ??
            ButtonStyle(
                padding: WidgetStatePropertyAll(EdgeInsets.symmetric(
                    vertical: 9.5, horizontal: horizontal ?? 0.0)),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4))),
                backgroundColor: WidgetStatePropertyAll(
                    backgroundColor ?? ColorConstant.primaryColor)),
        onPressed: onPressed,
        child: child ??
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: (loading == null || loading == false)
                      ? Text(
                          text ?? 'Next',
                          style: textStyle ??
                              const TextStyle(
                                  fontSize: 15, color: ColorConstant.white),
                        )
                      : const CircularProgressIndicator(
                          color: ColorConstant.white,
                        ),
                ),
              ],
            ));
  }
}
