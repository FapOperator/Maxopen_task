import 'package:flutter/material.dart';
import 'package:maxopen_task/presentation/theme/app_color.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  const CustomTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
            text: title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
            children: <TextSpan>[
              TextSpan(
                text: '.',
                style: TextStyle(
                  color: AppColor.assent,
                  fontSize: 30,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              )
            ]),
      ),
    );
  }
}
