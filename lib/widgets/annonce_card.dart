import 'package:colipar/models/announcement.dart';
import 'package:colipar/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../styles/text_styles.dart';

class AnnonceCard extends StatelessWidget {
  final Announcement announcement;
  const AnnonceCard({super.key, required this.announcement});

  @override
  Widget build(BuildContext context) {
    DateFormat customFormat = DateFormat("dd/MM/yyyy");
    return Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              height: 110,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.66,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                const CircleAvatar(
                                  radius: 5,
                                  backgroundColor: AppColors.blue,
                                ),
                                Container(
                                  width: 2,
                                  height: 20,
                                  color: AppColors.gray,
                                ),
                                const CircleAvatar(
                                  radius: 5,
                                  backgroundColor: AppColors.blue,
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    announcement.placeOfDeparture,
                                    style: AppTextStyles.bodyText2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    announcement.placeOfArrival,
                                    style: AppTextStyles.bodyText2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.directions_boat),
                            SizedBox(width: 10),
                            Text('${announcement.size}KG', style: AppTextStyles.bodyText2),
                          ],
                        )
                      ],
                    ),
                  ),
                  
                  Text(
                    customFormat.format(announcement.dateofDeparture),
                    style: AppTextStyles.bodyText2,
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            );
  }
}