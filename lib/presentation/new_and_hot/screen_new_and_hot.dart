import 'package:flutter/material.dart';

import '../widgets/app_bar_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(50), child: AppBarWidget(title: 'New & Hot',)),
      body: Text('Hot & New'),
    );
  }
}
