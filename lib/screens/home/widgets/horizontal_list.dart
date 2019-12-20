import 'package:flutter/material.dart';

import 'package:mockstar/utils/palette.dart';

class HorizontalListWidget extends StatelessWidget {
  final loadingText;
  final movieShowData;

  HorizontalListWidget({this.movieShowData, this.loadingText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(16),
        itemBuilder: (context, index) => Card(
          child: InkWell(
            onTap: () {
              PaletteUtils.isCalled = false;
              Navigator.pushNamed(context, '/details',
                  arguments: movieShowData[index]);
            },
            child: Hero(
              tag: movieShowData[index]['poster_path'],
              child: Image.network(
                'http://image.tmdb.org/t/p/w200/${movieShowData[index]['poster_path']}',
                height: 200,
              ),
            ),
          ),
        ),
        itemCount: movieShowData.length,
      ),
    );
  }
}
