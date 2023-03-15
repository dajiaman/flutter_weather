import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_weather/svg_util.dart';
import 'package:velocity_x/velocity_x.dart';

import 'card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color _color = const Color(0xff44B0FF);
  final Color _tempColor = const Color(0xff1A1A1A);

  final TextStyle _textStyle1 = const TextStyle(
    color: Color(0xff3D3D3D),
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  final TextStyle _textStyle2 = const TextStyle(
    color: Color(0xff1A1A1A),
    fontSize: 24,
    fontWeight: FontWeight.w500,
    height: 2,
  );

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Widget _buildBody() {
      return Container(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 240,
              height: 240,
              child: SvgUtil.load(
                'assets/images/cloud.svg',
              ),
            ),
            Center(
              child: Text(
                '28°',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: _tempColor,
                  fontSize: 94,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "温度",
                        style: _textStyle1,
                        strutStyle: const StrutStyle(
                          forceStrutHeight: true,
                          leading: 0.5,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "30%",
                        style: _textStyle2,
                        strutStyle: const StrutStyle(
                          forceStrutHeight: true,
                          leading: 0.5,
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "北风",
                        style: _textStyle1,
                        strutStyle: const StrutStyle(
                          forceStrutHeight: true,
                          leading: 0.5,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "3级",
                        style: _textStyle2,
                        strutStyle: const StrutStyle(
                          forceStrutHeight: true,
                          leading: 0.5,
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "空气优",
                        style: _textStyle1,
                        strutStyle: const StrutStyle(
                          forceStrutHeight: true,
                          leading: 0.5,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "24",
                        style: _textStyle2,
                        strutStyle: const StrutStyle(
                          forceStrutHeight: true,
                          leading: 0.5,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildScroll(),
          ],
        ),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Container(
                  width: width,
                  height: height,
                  decoration: const BoxDecoration(
                    color: Color(0xff64beff),
                  ),
                ),
                Positioned(
                  top: 200,
                  child: ClipOval(
                    clipper: _MyClipper(),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            _color,
                            const Color(0xffD7EEFF),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 110,
                  child: _buildBody(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScroll() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(30),
      child: Row(
        children: const [
          WeatherCard(),
          WeatherCard(),
          WeatherCard(),
          WeatherCard(),
          WeatherCard(),
          WeatherCard(),
        ],
      ),
    );
  }
}

class _MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(-200, 0, size.width + 200, size.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}
