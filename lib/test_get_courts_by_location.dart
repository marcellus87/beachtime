import 'services/court_service.dart';

void main() {
 final courtService = CourtService();

 print("Courts in Mitte, Berlin:");
 final mitteCourts = courtService.getCourtsByLocation("Mitte, Berlin");
 if (mitteCourts.isEmpty) {
  print("No courts found in Mitte, Berlin.");
 } else {
  for (var court in mitteCourts) {
  print('Court Name: ${court["courtName"]}, Location: ${court["location"]}');
  }
 }
}