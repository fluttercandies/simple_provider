import 'package:flutter/material.dart';
import 'package:simple_provider/simple_provider.dart';
import 'package:simple_provider/src/simple_builder.dart';

typedef Widget ConsumerBuilder<T extends Listenable>(
  BuildContext context,
  T value,
);

/// 监听全局的消费者, 用于和[SimpleProvider] 对应
class SimpleConsumer<T extends Listenable> extends StatelessWidget {
  final ConsumerBuilder<T> builder;

  const SimpleConsumer({
    Key key,
    @required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Listenable listenable = SimpleProvider.of<T>(context);
    assert(listenable != null, '');
    return SimpleBuilder(
      listenable: listenable,
      builder: () => builder(
        context,
        listenable,
      ),
    );
  }
}
