import 'package:flutter/material.dart';

class FallBackContentWidget extends StatelessWidget {
  const FallBackContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Illustration of the fallbackN
          Image(
            image: AssetImage('assets/images/note.png'),
            width: double.infinity,
            height: 300,
          ),
          // Text of fallback
          Text(
            textAlign: TextAlign.center,
            softWrap: true,
            'You\'ve not added your mode yet. tap on the + to add your today mode !',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
