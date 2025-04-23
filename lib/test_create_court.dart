import 'services/court_service.dart';

void main() {
  final courtService = CourtService();

  courtService.createCourt('New Court', '8:00 AM - 10:00 AM', 'Tempelhof, Berlin');

  print("All Courts:");
  final allCourts = courtService.getAvailableCourts();
  for (var court in allCourts) {
    print(
        'Court Name: ${court["courtName"]}, Time: ${court["time"]}, Location: ${court["location"]}');
  }
}