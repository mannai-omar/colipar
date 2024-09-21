import 'package:colipar/models/announcement.dart';
import 'package:colipar/services/announcement_services.dart';
import 'package:colipar/styles/colors.dart';
import 'package:colipar/styles/text_styles.dart';
import 'package:colipar/widgets/annonce_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Announcement>> futureAnnouncements;
  final AnnouncementService announcementService = AnnouncementService();

  @override
  void initState() {
    super.initState();
    futureAnnouncements = announcementService.getAllAnnouncements();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25,25,25,0),
        child: ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Liste des annonces',
              style: AppTextStyles.h2,
            ),
            Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white),
              child: const Icon(
                Icons.tune,
                color: AppColors.black,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        FutureBuilder<List<Announcement>>(
            future: futureAnnouncements,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No announcements found.'));
              } else {
                return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    //physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 0,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      Announcement announcement = snapshot.data![index];
                      return AnnonceCard(announcement: announcement);
                    });
              }
            }),
      ],
        ),
      ),
    );
  }
}
