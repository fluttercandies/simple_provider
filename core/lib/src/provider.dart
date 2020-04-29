import 'package:flutter/widgets.dart';

/// 核心类. 一般包裹[MaterialApp]或[WidgetsApp]使用来提供全局状态共享
class SimpleProvider extends InheritedWidget {
  final List<Listenable> notifiers;

  final Map<Type, Listenable> _map = {};

  SimpleProvider({
    @required this.notifiers,
    Widget child,
    Key key,
  }) : super(key: key, child: child) {
    for (final notifier in notifiers) {
      _map[notifier.runtimeType] = notifier;
    }
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static T of<T extends Listenable>(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<SimpleProvider>();
    return provider._map[T];
  }
}
