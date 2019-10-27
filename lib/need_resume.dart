/*
 ----------------------------------------------------------------------
  NeedResume - Simple package for onResume/viewDidAppear functionality
 ----------------------------------------------------------------------
  Version: 1.0.2
 ----------------------------------------------------------------------
  By: Muhammad Faruq Nuruddinsyah
  Copyright 2019. All Rights Reserved.
 ----------------------------------------------------------------------
*/

import 'package:flutter/material.dart';

class Resume {
    dynamic data;
    String source;
}

abstract class NeedResume {
    Resume resume = new Resume();

    /// Implement your code here
    void onResume();

    /// This method is replacement of Navigator.push(), but fires onResume() after route popped
    Future<T> push<T extends Object>(BuildContext context, Route<T> route, [String source]) {
        return Navigator.of(context).push(route).then((value) {
            resume.data = value;
            resume.source = source;

            onResume();
            return value;
        });
    }

    /// This method is replacement of Navigator.pushNamed(), but fires onResume() after route popped
    Future<T> pushNamed<T extends Object>(BuildContext context, String routeName, {Object arguments}) {
        return Navigator.of(context).pushNamed<T>(routeName, arguments: arguments).then((value) {
            resume.data = value;
            resume.source = routeName;

            onResume();
            return value;
        });
    }
}
