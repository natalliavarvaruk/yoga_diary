import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(
        'Your yoga diary',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      leading: IconButton(
        onPressed: () {}, // authorization - later
        icon: Icon(Icons.account_circle),
        color: Theme.of(context).primaryIconTheme.color,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
