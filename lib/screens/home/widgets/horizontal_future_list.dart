import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:mockstar/networking/base.dart';
import 'package:mockstar/providers/home.dart';
import 'package:mockstar/utils/constants.dart';
import 'package:mockstar/utils/palette.dart';

class HorizontalFutureListWidget extends StatelessWidget {
  final apiEndPoint;
  final loadingText;

  HorizontalFutureListWidget({this.apiEndPoint, this.loadingText});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_, homeProvider, __) => FutureBuilder(
        future: Base.dio.get(
          apiEndPoint,
          queryParameters: {
            'api_key': Constants.kTmdbApiKey,
          },
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            final List<dynamic> response = snapshot.data.data['results'];
            apiEndPoint.toString().contains('movie')
                ? homeProvider.cache['movies'] = response
                : homeProvider.cache['shows'] = response;
            return Container(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  return Card(
                    child: InkWell(
                      onTap: () {
                        PaletteUtils.isCalled = false;
                        Navigator.pushNamed(context, '/details',
                            arguments: response[index]);
                      },
                      child: Hero(
                        tag: response[index]['poster_path'],
                        child: Image.network(
                          'http://image.tmdb.org/t/p/w200/${response[index]['poster_path']}',
                          height: 200,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: response.length,
              ),
            );
          }
          return Center(
            child: Container(
              margin: EdgeInsets.all(16),
              child: Text('Loading $loadingText...'),
            ),
          );
        },
      ),
    );
  }
}
