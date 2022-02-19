# 练习Flutter —— 记录

A new Flutter project.

#### Flutter animation

所有的动画都需要使用一个 `AnimationController` , 创建 `AnimationController`的方式：

```dart

final animationController =
AnimationController(vsync: this, duration: const Duration(seconds: 8));
```

使用 `Tween` 动画：

```dart

final animation = Tween(begin: 0, end: 1.0).animate(CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn));

final animation2 = Tween(begin: Offset(0, 1), end: Offset(0, 0))
...
```

使用`Offset`的方式，第一个是开始位置  `dx, dy`分别代表从哪里开始，(0, 1)表示从屏幕的右侧开始， 进入到屏幕中(0, 0)

##### 共享元素动画

`PageTransitionSwitcher`

使用方式

```dart
    PageTransitionSwitcher(
        transitionBuilder: (Widget child,
        Animation<double> primaryAnimation,
        Animation<double> secondaryAnimation,){
          return SharedAxisTransition(
              fillColor: Colors.transparent,
              child: child,
              animation: primaryAnimation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.vertical,
            );
        }
);
```




