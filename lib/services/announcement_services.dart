import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants.dart';
import '../models/announcement.dart';

class AnnouncementService {

  AnnouncementService();

  Future<List<Announcement>> getAllAnnouncements() async {
    final response = await http.get(Uri.parse('$baseurl/announcement'));
    if (response.statusCode == 200) {
      print(response.body);
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((json) => Announcement.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load announcements');
    }
  }

  Future<Announcement> postAnnouncement(Announcement announcement) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final response = await http.post(
      Uri.parse('$baseurl/announcement'),
      headers: headers,
      body: jsonEncode(announcement.toJson()),
    );

    if (response.statusCode == 201) {
      return Announcement.fromJson(json.decode(response.body));
    } else {
      print('Failed to post announcement: ${response.statusCode} ${response.body}');
      throw Exception('Failed to post announcement');
    }
  }

  
}
