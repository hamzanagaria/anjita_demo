import 'package:flutter/material.dart';

class ErrorWidgetWithDelay extends StatelessWidget {
  final String error;

  const ErrorWidgetWithDelay({super.key, required this.error});

  // Future that completes after a 1-second delay
  Future<void> _delayedFuture() async {
    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _delayedFuture(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error,
                      color: Colors.grey,
                      size:
                          35), // Use Colors.grey if you don't have ColorConstant
                  Text(error),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
