import 'package:flutter/material.dart';

import '../models/reponse_model.dart';
import '../models/user_model.dart';
import '../service/network_manager.dart';
import '../utils/constant.dart';
import '../widgts/error_widget.dart';

class AllUsers extends StatefulWidget {
  const AllUsers({super.key});

  @override
  State<AllUsers> createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {
  final NetworkManager _networkManager = NetworkManager();

  Future<List<UserModelSample>?> _getDataUserData() async {
    try {
      var response = await _networkManager
          .getApi1("https://gorest.co.in/public-api/users");
      if ((response.runtimeType == ResponseData<List>) &&
          response.status == Constant.TRUE) {
        var data = UserModelSample.listFromJson(response.object);
        if (data.isNotEmpty) {
          return data;
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("User List"),
      ),
      body: FutureBuilder<List<UserModelSample>?>(
          future: _getDataUserData(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              var data = snapshot.data ?? [];
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    var item = data[index];
                    return Row(
                      children: [
                        CircleAvatar(child: Icon(Icons.person)),
                        Text(item.name ?? ""),
                      ],
                    );
                  });
            } else {
              return const ErrorWidgetWithDelay(
                  error: "Something went wrong while trying to fetch data.");
            }
          }),
    );
  }
}
