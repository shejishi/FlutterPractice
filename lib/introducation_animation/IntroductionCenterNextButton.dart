import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class IntroductionCenterNextButton extends StatefulWidget {
  final AnimationController animationController;
  final VoidCallback nextCallback;

  const IntroductionCenterNextButton(
      {Key? key, required this.animationController, required this.nextCallback})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return IntroductionCenterNextButtonState();
  }
}

class IntroductionCenterNextButtonState
    extends State<IntroductionCenterNextButton> {
  @override
  Widget build(BuildContext context) {
    final topMoveAnimation =
        Tween(begin: const Offset(0, 5), end: const Offset(0, 0)).animate(
      CurvedAnimation(
          parent: widget.animationController,
          curve: const Interval(0.0, 0.2, curve: Curves.fastOutSlowIn)),
    );

    final signUpAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: widget.animationController,
          curve: const Interval(0.6, 0.8, curve: Curves.fastOutSlowIn)),
    );

    final loginTextMoveAnimation =
        Tween(begin: const Offset(0, 5), end: const Offset(0, 0)).animate(
            CurvedAnimation(
                parent: widget.animationController,
                curve: const Interval(0.6, 0.8, curve: Curves.fastOutSlowIn)));

    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SlideTransition(
            position: topMoveAnimation,
            child: AnimatedBuilder(
              animation: widget.animationController,
              builder: (context, child) {
                return AnimatedOpacity(
                  opacity: widget.animationController.value >= 0.2 &&
                          widget.animationController.value <= 0.6
                      ? 1
                      : 0,
                  duration: const Duration(milliseconds: 480),
                  child: pageView(),
                );
              },
            ),
          ),
          SlideTransition(
            position: topMoveAnimation,
            child: AnimatedBuilder(
              animation: widget.animationController,
              builder: (BuildContext context, Widget? child) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: 38.0 - (38 * signUpAnimation.value)),
                  child: Container(
                    height: 58,
                    width: 58.0 + (200 * signUpAnimation.value),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          8.0 + 32 * (1 - signUpAnimation.value)),
                      color: const Color(0xff132137),
                    ),
                    child: PageTransitionSwitcher(
                        duration: const Duration(milliseconds: 480),
                        reverse: signUpAnimation.value < 0.7,
                        transitionBuilder: (
                          Widget child,
                          Animation<double> primaryAnimation,
                          Animation<double> secondaryAnimation,
                        ) {
                          return SharedAxisTransition(
                            fillColor: Colors.transparent,
                            child: child,
                            animation: primaryAnimation,
                            secondaryAnimation: secondaryAnimation,
                            transitionType: SharedAxisTransitionType.vertical,
                          );
                        },
                        child: signUpAnimation.value > 0.7
                            ? InkWell(
                                key: const ValueKey("Sign Up Button"),
                                onTap: widget.nextCallback,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(
                                        "注册",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Icon(Icons.arrow_forward_rounded, color: Colors.white,)
                                    ],
                                  ),
                                ),
                              )
                            : InkWell(
                                key: const ValueKey("next button"),
                                onTap: widget.nextCallback,
                                child: const Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Icon(
                                    Icons.arrow_forward_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: SlideTransition(
              position: loginTextMoveAnimation,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "您是否有了账号? ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    "登录",
                    style: TextStyle(
                      color: Color(0xff132137),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget pageView() {
    int selectIndex = 0;
    if (widget.animationController.value >= 0.7) {
      selectIndex = 3;
    } else if (widget.animationController.value >= 0.5) {
      selectIndex = 2;
    } else if (widget.animationController.value >= 0.3) {
      selectIndex = 1;
    } else if (widget.animationController.value >= 0.1) {
      selectIndex = 0;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < 4; i++)
            Padding(
              padding: const EdgeInsets.all(4),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 480),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: selectIndex == i
                      ? const Color(0xFF132137)
                      : const Color(0xffe3e4e4),
                ),
                width: 10,
                height: 10,
              ),
            )
        ],
      ),
    );
  }
}
