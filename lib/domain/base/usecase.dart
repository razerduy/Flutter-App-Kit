import 'dart:async';

import 'package:cards/presentation/base/subject.dart';

class BaseUseCase<T> {
  BehaviorSubject<T> data = BehaviorSubject();

  StreamSubscription listenDataChange(Function(T) onChange) {
    return data.listen((T event) {
      onChange(event);
    });
  }

}
