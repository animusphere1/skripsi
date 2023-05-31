import 'dart:async';

mixin Controller {
  FutureOr<void> init() {}

  FutureOr<void> ready() {}
}
