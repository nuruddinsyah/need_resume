/*
 ----------------------------------------------------------------------
  NeedResume - Simple package for onResume/viewDidAppear functionality
 ----------------------------------------------------------------------
  Version: 1.0.0
 ----------------------------------------------------------------------
  By: Muhammad Faruq Nuruddinsyah
  Copyright 2019. All Rights Reserved.
 ----------------------------------------------------------------------
*/

library need_resume;

abstract class NeedResume {
    var resumed = false;

    /// Implement your code here
    void onResume();

    /// Call this method from build()
    void prepareResume() {
        if (resumed) {
            resumed = false;
            onResume();
        }
    }

    /// Call this method after you push another screen
    void needResume() {
        resumed = true;
    }
}
