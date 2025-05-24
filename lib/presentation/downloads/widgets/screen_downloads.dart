import 'package:flutter/material.dart';
import 'package:netflixclone/presentation/widgets/app_bar_widget.dart';
class ScreenDownloads extends StatelessWidget {
  const ScreenDownloads({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(50), child: AppBarWidget()),
      body: Text('Downloads'),
    );
  }
}
