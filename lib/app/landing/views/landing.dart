import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:heroicons/heroicons.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const HeroIcon(
            HeroIcons.cog6Tooth,
          ),
          onPressed: () {},
        ),
        title: const Text("Nerdy Health"),
        actions: [
          IconButton(
            icon: HeroIcon(
              HeroIcons.plusCircle,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: HeroIcon(
              HeroIcons.chartBar,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.grey[200],
            child: const HeatMap(
              scrollable: true,
              showColorTip: false,
              colorMode: ColorMode.opacity,
              colorsets: {
                1: Colors.green,
              },
            ),
          )
        ],
      ),
    );
  }
}
