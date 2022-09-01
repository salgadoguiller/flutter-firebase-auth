import 'package:flutter/material.dart';

class MealifyBanner extends StatelessWidget {
  final String title;
  final String subtitle;

  const MealifyBanner(this.title, this.subtitle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            'lib/assets/images/mealify_calendar.png',
            height: 65,
            width: 60,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
