import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'HomeScreen.dart';
class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}
class _SplashscreenState extends State<Splashscreen> with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();


  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => WorldStateScreen(),
          )
      );
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Colors.black
            // gradient:
            //     LinearGradient(colors: [Color(0xffdae2f8), Color(0xffd6a4a4)]),
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: _controller,
                child: Container(
                  height: 200,
                  width: 200,
                  child: const Center(
                    child: Image(
                      image: AssetImage(
                        "assets/images/virus.png",
                      ),
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: _controller.value * 2.0 * math.pi,
                    child: child,
                  );
                }
                ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Covid-19\nTracker App",textAlign: TextAlign.center,
                style: TextStyle(

                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    letterSpacing: 2,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
