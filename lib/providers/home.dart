import 'package:flutter/foundation.dart';

class HomeProvider with ChangeNotifier {
  Map<String, List<dynamic>> cache = {
    'movies': [],
    'shows': [],
  };
}
