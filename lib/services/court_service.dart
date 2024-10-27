class CourtService {
  List<Map<String, String>> getAvailableCourts() {
    return [
      {"courtName": "Beach Center Berlin", "time": "12:00 PM - 2:00 PM", "location": "Mitte, Berlin"},
      {"courtName": "Sandy Sun Courts", "time": "3:00 PM - 5:00 PM", "location": "Kreuzberg, Berlin"},
      {"courtName": "Sunset Beach", "time": "5:30 PM - 7:30 PM", "location": "Prenzlauer Berg, Berlin"},
    ];
  }
}