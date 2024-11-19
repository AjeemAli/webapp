import 'package:flutter/material.dart';
import '../../../src/constant/app_colors.dart';
import '../../../src/constant/app_string.dart';
import '../../../src/constant/app_text_style.dart';
import 'home_header.dart'; // Import HomeHeader
import 'home_menu_item.dart'; // Import HomeMenuItem

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appTitle, style: AppTextStyles.heading),
        backgroundColor: AppColors.primary,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting Section
              HomeHeader(),

              const SizedBox(height: 20),


              QuickAccessSection(),

              const SizedBox(height: 20),

              VerseOfTheDay(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Surah"),
          BottomNavigationBarItem(icon: Icon(Icons.headset), label: "Audio"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
      ),
    );
  }
}

// Quick Access Section Widget
class QuickAccessSection extends StatelessWidget {
  final List<Map<String, dynamic>> features = [
    {"icon": Icons.book, "title": AppStrings.readSurah, "route": "/surah"},
    {"icon": Icons.headset, "title": AppStrings.listenRecitation, "route": "/audio"},
    {"icon": Icons.menu_book, "title": AppStrings.viewTafsir, "route": "/tafsir"},
    {"icon": Icons.alarm, "title": AppStrings.dailyReminder, "route": "/reminder"},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3 / 2,
      ),
      itemCount: features.length,
      itemBuilder: (context, index) {
        final feature = features[index];
        return HomeMenuItem(
          title: feature['title'],
          icon: feature['icon'],
          route: feature['route'],
        );
      },
    );
  }
}

// Verse of the Day Widget
class VerseOfTheDay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.verseOfTheDay, style: AppTextStyles.subheading),
            SizedBox(height: 12),
            Text(
              "إِنَّ هَٰذَا ٱلۡقُرۡءَانَ يَہۡدِي لِلَّتِي هِيَ أَقۡوَمُ",
              style: AppTextStyles.arabic,
              textAlign: TextAlign.right,
            ),
            SizedBox(height: 8),
            Text(
              "Indeed, this Qur'an guides to that which is most suitable.",
              style: AppTextStyles.caption,
            ),
          ],
        ),
      ),
    );
  }
}
