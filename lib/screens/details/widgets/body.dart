import 'package:flutter/material.dart';

import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

import 'package:mockstar/providers/details.dart';
import 'package:mockstar/utils/palette.dart';

// to extract colors from an image
Future _paletteGenerator(input) async =>
    await PaletteGenerator.fromImageProvider(
      NetworkImage(input),
      size: Size(100, 100),
    );

class DetailsBody extends StatelessWidget {
  final movieShowData;

  DetailsBody(this.movieShowData);

  @override
  Widget build(BuildContext context) {
    // if colors are already extracted for an image, avoid paletteGenerator call
    if (PaletteUtils.cachedExtractedColor[movieShowData['poster_path']] ==
            null &&
        !PaletteUtils.isCalled) {
      PaletteUtils.isCalled = true;
      _paletteGenerator(
              'http://image.tmdb.org/t/p/w200${movieShowData['poster_path']}')
          .then((palette) {
        final colorPalette = (palette as PaletteGenerator);
        Provider.of<DetailsProvider>(context).themeColor =
            colorPalette.darkVibrantColor != null
                ? colorPalette.darkVibrantColor.color
                : Colors.blue;
        PaletteUtils.cachedExtractedColor[movieShowData['poster_path']] =
            Provider.of<DetailsProvider>(context).themeColor;
      });
    }
    return Consumer<DetailsProvider>(
      builder: (_, detailsProvider, __) => Container(
        color: PaletteUtils
                    .cachedExtractedColor[movieShowData['poster_path']] !=
                null
            ? detailsProvider.themeColor
            : PaletteUtils.cachedExtractedColor[movieShowData['poster_path']],
        child: Stack(
          children: <Widget>[
            AnimatedOpacity(
              duration: Duration(milliseconds: 100),
              opacity: 1 - detailsProvider.imageOpacity,
              child: Hero(
                tag: movieShowData['poster_path'],
                child: Image.network(
                  'http://image.tmdb.org/t/p/original/${movieShowData['poster_path']}',
                ),
              ),
            ),
            SafeArea(
              child: NotificationListener<DraggableScrollableNotification>(
                onNotification: (notification) {
                  detailsProvider.imageOpacity = notification.extent;
                  return true;
                },
                child: DraggableScrollableSheet(
                  builder: (context, controller) => AnimatedContainer(
                    duration: Duration(
                      milliseconds: 500,
                    ),
                    margin: EdgeInsets.only(top: 64),
                    decoration: BoxDecoration(
                      color: PaletteUtils.cachedExtractedColor[
                                  movieShowData['poster_path']] !=
                              null
                          ? detailsProvider.themeColor
                          : PaletteUtils.cachedExtractedColor[
                              movieShowData['poster_path']],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: ListView(
                      controller: controller,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          child: Text(
                            movieShowData['title'] ?? movieShowData['name'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          child: Text(
                            movieShowData['overview'],
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
