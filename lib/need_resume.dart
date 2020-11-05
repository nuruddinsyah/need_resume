/*
 --------------------------------------------------------------------------
  NeedResume - Simple package for onResume, onPause, onReady functionality
 --------------------------------------------------------------------------
  Version: 1.0.3
 --------------------------------------------------------------------------
  By: Muhammad Faruq Nuruddinsyah
  Copyright 2019. All Rights Reserved.
 --------------------------------------------------------------------------
*/

import 'package:flutter/material.dart';

class Resume {
    dynamic data;
    String source;
}

abstract class ResumableState<T extends StatefulWidget> extends State<T> with WidgetsBindingObserver {
    Resume resume = new Resume();
    bool _isPaused = false;

    /// Implement your code here
    void onResume() {
        // TODO: Implement your code here
    }

    /// Implement your code here
    void onReady() {
        // TODO: Implement your code here
    }

    /// Implement your code here
    void onPause() {
        // TODO: Implement your code here
    }

    /// This method is replacement of Navigator.push(), but fires onResume() after route popped
    Future<T> push<T extends Object>(BuildContext context, Route<T> route, [String source]) {
        _isPaused = true;
        onPause();

        return Navigator.of(context).push(route).then((value) {
            _isPaused = false;

            resume.data = value;
            resume.source = source;

            onResume();
            return value;
        });
    }

    /// This method is replacement of Navigator.pushNamed(), but fires onResume() after route popped
    Future<T> pushNamed<T extends Object>(BuildContext context, String routeName, {Object arguments}) {
        _isPaused = true;
        onPause();

        return Navigator.of(context).pushNamed<T>(routeName, arguments: arguments).then((value) {
            _isPaused = false;

            resume.data = value;
            resume.source = routeName;

            onResume();
            return value;
        });
    }

    @override
    void initState() {
        super.initState();

        WidgetsBinding.instance.addObserver(this);
        WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
    }

    @override
    void dispose() {
        WidgetsBinding.instance.removeObserver(this);
        super.dispose();
    }

    @override
    void didChangeAppLifecycleState(AppLifecycleState state) {
        if (state == AppLifecycleState.paused) {
            if (!_isPaused) {
                onPause();
            }
        } else if (state == AppLifecycleState.resumed) {
            if (!_isPaused) {
                onResume();
            }
        }
    }
}
