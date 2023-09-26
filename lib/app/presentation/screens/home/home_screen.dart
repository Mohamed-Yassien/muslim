import 'package:flutter/material.dart';

import '../../../../core/strings.dart';
import '../archives/archived_screen.dart';
import '../surahs/surahs_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            AppStrings.homeTitle,
          ),
          bottom: const TabBar(
            dividerColor: Colors.transparent,
            indicatorColor: Colors.white,
            unselectedLabelColor: Colors.white,
            labelColor: Colors.white,
            tabs: [
              Tab(
                text: AppStrings.firstHomeTab,
              ),
              Tab(
                text: AppStrings.secondHomeTab,
              ),
            ],
          ),
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            SurahsScreen(),
            ArchivedListScreen(),
          ],
        ),
      ),
    );
  }
}
