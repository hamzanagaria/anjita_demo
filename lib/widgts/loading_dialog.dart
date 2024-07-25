import 'dart:async';

import 'package:flutter/material.dart';

class LoadingDialog extends StatefulWidget {
  final void Function() onPressed;
  final StreamController<String> streamController;
  const LoadingDialog(
      {super.key, required this.onPressed, required this.streamController});

  @override
  State<LoadingDialog> createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialog> {
  late StreamController<String> _messageStream;
  @override
  void initState() {
    runFunction();
    super.initState();
  }

  runFunction() async {
    _messageStream = widget.streamController;
    _messageStream.sink.add("Downloading ..");
    widget.onPressed();
  }

  @override
  void dispose() {
    _messageStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const CircularProgressIndicator(),
          const SizedBox(width: 16.0),
          StreamBuilder<String>(
              stream: _messageStream.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data ?? "...");
                } else {
                  return const Text("Something Went Wrong");
                }
              }),
        ],
      ),
    );
  }
}
