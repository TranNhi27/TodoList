import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list_app/components/default_elevated_btn.dart';
import 'package:todo_list_app/screens/sign_in/sign_in_screen.dart';
import 'package:todo_list_app/size_config.dart';
import 'walkthrough_content.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Map<String, String>> walkthroughs = [
    {
      'image': 'assets/images/undraw_events.png',
      'header': 'Welcome to asking',
      'content': 'Whats going to happen tomorrow?',
      'color': '0xFFF96060'
    },
    {
      'image': 'assets/images/undraw_superhero.png',
      'header': 'Work happens',
      'content': 'Get notified when work happens',
      'color': '0xFF6074F9'
    },
    {
      'image': 'assets/images/undraw_analysis.png',
      'header': 'Tasks and assign',
      'content': 'Task and assign them to colleagues',
      'color': '0xFF8560F9'
    },
  ];
  int curPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: SizeConfig.screenHeight,
          child: Stack(
            children: [
              buildBackground(),
              Center(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        child: PageView.builder(
                            onPageChanged: (value) {
                              setState(() {
                                curPage = value;
                              });},
                            itemCount: walkthroughs.length,
                            itemBuilder: (context, index) => WalkthroughContent(
                                image: walkthroughs[index]['image'] as String,
                                header: walkthroughs[index]['header'] as String,
                                content: walkthroughs[index]['content'] as String)),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(41)),
                        child: Column(
                          children: [
                            SizedBox(height: getProportionateScreenHeight(48),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(walkthroughs.length,
                                  (index) => buildDot(index)),
                            ),
                            Spacer(),
                            DefaultElevatedBtn(
                              textBtn: 'Get Started',
                              press: () {
                                Navigator.pushNamed(context, SignInScreen.routeName);
                              },
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(32),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.popAndPushNamed(context, SignInScreen.routeName);
                              },
                                child: Text('Log in',
                                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),)),
                            Spacer()
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Positioned buildBackground() {
    return Positioned.fill(
              child: SvgPicture.asset(
                'assets/images/Group.svg',
                fit: BoxFit.fitWidth,
                alignment: Alignment.bottomCenter,
                color: Color(
                    int.parse(walkthroughs[curPage]['color'] as String)),
              ),
            );
  }


  Container buildDot(int index) {
    return Container(
      margin: EdgeInsets.only(right: getProportionateScreenWidth(20)),
      height: getProportionateScreenWidth(8),
      width: getProportionateScreenWidth(8),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: curPage == index ? Colors.black : Color(0xFFD8D8D8)),
    );
  }
}
