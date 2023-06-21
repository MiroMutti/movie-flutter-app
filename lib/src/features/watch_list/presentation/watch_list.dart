import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      strokeWidth: 0,
      child: Center(
        child: Text(
          'Under constructions',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
