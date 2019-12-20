import 'package:flutter/material.dart';

import 'package:mockstar/screens/home/widgets/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
                child: Text(
                  'Trending',
                  style: TextStyle(
                    fontSize: 42,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        preferredSize: Size.fromHeight(100),
      ),
      backgroundColor: Colors.black,
      body: HomeBody(),
    );
  }
}
