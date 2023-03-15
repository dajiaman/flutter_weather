import 'package:flutter/material.dart';
import 'package:flutter_weather/svg_util.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 152,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "星期二",
                  style: TextStyle(color: Color(0xff1A1A1A)),
                ),
                const SizedBox(height: 17),
                const Text(
                  "23°",
                  style: TextStyle(
                    color: Color(0xff1A1A1A),
                    fontSize: 36,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [Text("L:9°"), Text("H:23°")],
                ),
              ],
            ),
          ),
          Positioned(
            right: 2,
            top: 2,
            child: SvgUtil.load(
              'assets/images/cloud.svg',
            ),
          ),
        ],
      ),
    );
  }
}
