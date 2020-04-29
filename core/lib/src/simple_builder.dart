import 'package:flutter/widgets.dart';

/// 核心监听类, 用于单监听一个Listenable对象
class SimpleBuilder extends StatelessWidget {
  final Listenable listenable;
  final ValueGetter<Widget> builder;

  const SimpleBuilder({
    Key key,
    @required this.listenable,
    @required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (listenable == null) {
      return builder();
    }
    return AnimatedBuilder(
      animation: listenable,
      builder: (_, __) => builder(),
    );
  }
}

/// 核心监听类2, 用于同时监听多个Listenable对象
class MutilSimpleBuilder extends StatefulWidget {
  final List<Listenable> listenables;
  final ValueGetter<Widget> builder;

  const MutilSimpleBuilder({
    Key key,
    @required this.listenables,
    @required this.builder,
  })  : assert(listenables != null),
        assert(builder != null),
        super(key: key);

  @override
  _MutilSimpleBuilderState createState() => _MutilSimpleBuilderState();
}

class _MutilSimpleBuilderState extends State<MutilSimpleBuilder> {
  Set<Listenable> _set = {};

  @override
  void initState() {
    super.initState();
    resetListener();
  }

  void onChange() {
    setState(() {});
  }

  void resetListener() {
    for (final l in _set.toSet()) {
      l.removeListener(onChange);
    }
    _set.clear();
    _set.addAll(widget.listenables);
    for (final l in _set) {
      l.addListener(onChange);
    }
  }

  @override
  void didUpdateWidget(MutilSimpleBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    resetListener();
    setState(() {});
  }

  @override
  void dispose() {
    for (final l in _set.toSet()) {
      l.removeListener(onChange);
    }
    _set.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    assert(widget.listenables.isNotEmpty);
    return widget.builder();
  }
}
