import 'package:flutter/material.dart';

class MainMenuItem extends StatelessWidget {
  const MainMenuItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });
  final String title;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
      ),
      title: Text(
        title,
      ),
      onTap: onTap,
    );
  }
}
