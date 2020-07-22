import 'dart:async';

class HandleError {
  var error;
  Function onUnknown;
  Function onTimeout;
  // etc ...

  HandleError(this.error, { this.onTimeout, this.onUnknown });

  run() {
    if (error is TimeoutException) {
      if (onTimeout != null) {
        onTimeout();
      }
    } else {
      if (onUnknown != null) {
        onUnknown(error);
      }
    }
  }
}