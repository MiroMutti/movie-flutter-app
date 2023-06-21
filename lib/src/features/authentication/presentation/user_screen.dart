import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
