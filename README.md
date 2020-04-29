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
