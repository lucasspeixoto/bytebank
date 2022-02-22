import 'package:flutter/material.dart';

class ProgressLoading extends StatelessWidget {
  final String? message;
  const ProgressLoading({
    this.message = 'Loading',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          Text(message!),
        ],
      ),
    );
  }
}
