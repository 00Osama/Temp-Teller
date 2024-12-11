import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: CircularProgressIndicator()),
          SizedBox(height: 15),
          Text('fetching Weather Data...', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
