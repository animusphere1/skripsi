import 'package:flutter/cupertino.dart';

class BackgroundServices extends StatefulWidget {
  final Widget child;
  final Function(AppLifecycleState) status;

  const BackgroundServices({
    super.key,
    required this.child,
    required this.status,
  });

  @override
  State<BackgroundServices> createState() => _BackgroundServicesState();
}

class _BackgroundServicesState extends State<BackgroundServices>
    with WidgetsBindingObserver {
  @override
  initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    widget.status(state);
    switch (state) {
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
