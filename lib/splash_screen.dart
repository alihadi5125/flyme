import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flyme/home_screen.dart';
import 'package:flyme/login_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{


  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true).whenComplete(() =>{
    print("asdasdsa")
  });
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  WebViewController? controller;


  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      print('One second has passed.'); // P
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));// rints after 1 second.
    });

  }

  @override
  void dispose() {
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 40.sp),
        padding: EdgeInsets.only(left: 17.sp, right: 17.sp),
        width: 1.sw,
        height: 1.sh,
        child: Center(
          child: FadeTransition(
            opacity:_animation,
            child: SvgPicture.asset("assets/flyme_logo.svg",
              width: 100.sp,
              height: 150.sp,
            ),
          ),
        ),
      ),
    );
  }
}
