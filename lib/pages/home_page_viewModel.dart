import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class HomePageViewModel {
  BehaviorSubject title = new BehaviorSubject.seeded("Initial Data value");
  BehaviorSubject subtitle = new BehaviorSubject.seeded("Initial Data value");

  // HomePageViewModel() {
  //   title = new BehaviorSubject.seeded("");
  // }

  ValueStream get titleObservable => title.stream;

  updateTitle(String value) {
    if (value.isNotEmpty) {
      title.add(value);
    } else {
      title.addError("Something went wrong");
    }
  }

  void dispose() {
    title.close();
  }
}
