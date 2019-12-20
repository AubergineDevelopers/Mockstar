import 'package:flutter/material.dart';

class CustomTitleWidget extends StatelessWidget {
  final title;

  CustomTitleWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              style: TextStyle(
                fontSize: 42,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              text: title.toString()[0],
              children: [
                TextSpan(
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  text: title.toString().substring(1),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
