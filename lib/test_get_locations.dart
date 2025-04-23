import 'services/court_service.dart';

void main() {
  final courtService = CourtService();

  print("Locations:");
  final locations = courtService.getLocations();
  for (var location in locations) {
    print(location);
  }
}