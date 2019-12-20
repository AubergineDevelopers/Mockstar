import 'package:flutter/material.dart';
import 'package:mockstar/utils/constants.dart';

import 'package:provider/provider.dart';

import 'package:mockstar/providers/home.dart';
import 'package:mockstar/screens/home/widgets/custom_title.dart';
import 'package:mockstar/screens/home/widgets/horizontal_future_list.dart';
import 'package:mockstar/screens/home/widgets/horizontal_list.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_, homeProvider, __) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            CustomTitleWidget('Shows'),
            homeProvider.cache['shows'].isNotEmpty
                ? HorizontalListWidget(
                    movieShowData: homeProvider.cache['shows'],
                    loadingText: 'Shows',
                  )
                : HorizontalFutureListWidget(
                    apiEndPoint: '/trending/tv/day',
                    loadingText: 'Shows',
                  ),
            CustomTitleWidget('Movies'),
            homeProvider.cache['movies'].isNotEmpty
                ? HorizontalListWidget(
                    movieShowData: homeProvider.cache['movies'],
                    loadingText: 'Movies',
                  )
                : HorizontalFutureListWidget(
                    apiEndPoint: '/trending/movie/day',
                    loadingText: 'Movies',
                  ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
