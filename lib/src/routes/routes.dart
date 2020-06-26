import 'package:flutter/material.dart';
import 'package:no_walls/src/pages/home_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    // 'alert': (BuildContext context) => AlertPage(),
  };
}
