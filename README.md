# README

如果你厌烦了 provider 的复杂, 可以尝试使用这个库

相比较于 provider,只提供几个简单的能力, 回归轻便

1. 全局的提供者`SimpleProvider`, 将多个`Listenable`传入即可
2. 监听单个或多个`Listenable`类的变化
3. 监听全局状态类`SimpleConsumer`

---

提示: `Listenable` 是所有类似于`ChangeNotifier`,`ValueNotifier`之类可监听对象的父类

引入:
目前不打算提供 pub 版本, 请使用 git 依赖, git 的 ref 查询最新的 commit 版本

```yaml
dependencies:
  simple_provider:
    git:
      url: https://github.com/fluttercandies/simple_provider.git
      ref: master
```

## 简单使用

```dart
import 'package:simple_provider/simple_provider.dart';

  SimpleProvider(
    notifiers: <Listenable>[
      NumberProvider(),
    ],
    child: MaterialApp(
      home: Builder(
        builder: (context) => RaisedButton(
          child: Text('tap'),
          onPressed: () {
            final numberProvider = SimpleProvider.of<NumberProvider>(context);
          },
        ),
      ),
    ),
  ),
```

## 为啥写这东西

我个人觉得,特别精细的刷新粒度会增加代码复杂度,除非在极致追求性能的页面,否则并不建议使用, 且目前 dart 深比较需要复杂的代码来完成, 颇有得不偿失的感觉, 本库目前并不打算提供诸如 Selector 之类的东西来增加代码复杂度, 未来也许会改主意

Provider 在功能更加强大的 4.0 版本, 丢失了 2.x 时代的简洁性, 所以个人是时候离开它了

## LICENSE

MIT
