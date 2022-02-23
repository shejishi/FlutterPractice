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

#动画使用

### I 介绍
一款用户体验好的应用，或多或少都会有一些动画交互体验，而`Flutter`也包含了众多的动画类，先让我们看看最近仿写的一个小`Demo`
![1645536419348734 (3).gif](https://upload-images.jianshu.io/upload_images/2158207-3461d5c7b6731d41.gif?imageMogr2/auto-orient/strip)

`Flutter`动画看起来非常的流畅，也很舒服；像要在`Flutter`中实现这样的动画并不难，但是相对于在`android`中来说就有点捉襟见肘了,虽然实现起来没任何问题，但是代码的量会非常多；

在学习`Flutter`的动画前，需要了解几个主要的类：
##### Animation
`Animation` 为一个抽象类，它的实现类有很多; 它的主要功能设置动画的监听事件；
![WechatIMG42.png](https://upload-images.jianshu.io/upload_images/2158207-870c50d1688bb61b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/480)


##### AnimationController

`AnimationController`类似于`Android`中的一个`Animation`基类，用于控制动画的时长来显示运动的状态，可以设置动画是正向运动，还是反向运动；相对而言，`Flutter`分得更细，控制类只做动画的基础控制，而不去管动画的曲率（`Android`中，`animation`设置所有的动画参数）；

##### Curve
曲线，曲率；表示一个动画运动的速度快慢，和`Android`中的类似，不过`Flutter`中定义了比`Android`更多的运动曲率：
![WX20220222-221446.png](https://upload-images.jianshu.io/upload_images/2158207-ab9be82fc55e6cb4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/360)

##### Tween
在`Android`中使用动画，我们经常用`ValueAnimation`来拿到动画中提供的数值，在`Flutter`中，如果你想使用自己定义的数值，在`AnimationController`中定义的通常范围在[0,1]，所以就有了`Tween`来通过映射的方式来提供数值；

`Tween`是一个基础类，它也有多个子类，来创建不同的数值，通过名字我们就能了解到其作用：
![WX20220222-222150.png](https://upload-images.jianshu.io/upload_images/2158207-0bae1aaaf23b7619.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### II使用
下面，我们通过一个简单的例子来创建一个位移动画：
![1645540657884014.gif](https://upload-images.jianshu.io/upload_images/2158207-b068dc41960cd265.gif?imageMogr2/auto-orient/strip)
效果非常简单，这里我贴下代码：
```dart
class AnimationState extends State<AnimationDemo> with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 5000));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final curvedAnimation = CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn);
    final slideTransition = Tween(begin: const Offset(0, 0), end: const Offset(1, 0)).animate(curvedAnimation);

    return Scaffold(
      appBar: AppBar(
        title: const Text("测试使用动画"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SlideTransition(
              position: slideTransition,
              child: const Text(
                "我是移动的view",
                style: TextStyle(fontSize: 22, color: Colors.red),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            TextButton(onPressed: () {
              animationController.forward();
            }, child: const Text("点击开始移动"))
          ],
        ),
      ),
    );
  }
}
```
首先，我们需要一个管理动画的类，所以先创建`AnimationController `, 设置时间和`vsync`，这里我们可以先不了解这个`vsync : TickerProvider` 是做什么用的，使`State`类`with`它即可；

然后我们使用了位移动画，所以在创建动画的时候我们使用了`SlideTransition`，它需要给一个`position`，乍一看是位置，实际上该参数是一个`Animation<Offset>`， 所以这里需要传一个`Animation`子类，而我们上面介绍了`Tween`是管理数值的，需要`Animation<Offset>`就是需要一个数值的管理者，通过创建`Tween`得知需要两个参数：`start / end`；这两个参数也是一个泛型，可以传整形，也可以传`Offset`坐标，这里我们对位置进行动画修改，所以传了坐标；
再然后使用`animate`方法返回一个`animation`

`animate`方法需要一个`Animation<double>`，这里其实是一个曲率，我们看源码可以得知实现类也很多：
![WX20220222-225009.png](https://upload-images.jianshu.io/upload_images/2158207-4d0803ee389e1e7d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/480)
我们使用了`CurvedAnimation`， 设置`controller`以及`curves`曲率运动即可

最后点击按钮调用`controller`的 `forward()`方法开始我们的动画。





