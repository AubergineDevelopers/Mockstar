import 'package:flutter/material.dart';

import 'package:mockstar/screens/details/widgets/body.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final movieShowData = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.black,
      body: DetailsBody(movieShowData),
    );
  }
}
