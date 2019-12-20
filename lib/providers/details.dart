import 'package:flutter/material.dart';

class DetailsProvider with ChangeNotifier {
  double _imageOpacity = 0;

  double get imageOpacity => this._imageOpacity;

  set imageOpacity(double _imageOpacity) {
    this._imageOpacity = _imageOpacity;
    notifyListeners();
  }

  Color _themeColor;

  Color get themeColor => this._themeColor;

  set themeColor(Color _themeColor) {
    this._themeColor = _themeColor;
    notifyListeners();
  }
}
