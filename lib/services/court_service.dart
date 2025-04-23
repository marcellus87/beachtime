class CourtService {
  List<Map<String, String>> _courts = [];
  CourtService() {
     _courts = [
        {"courtName": "Beach Center Berlin", "time": "12:00 PM - 2:00 PM", "location": "Mitte, Berlin"},
        {"courtName": "Sandy Sun Courts", "time": "3:00 PM - 5:00 PM", "location": "Kreuzberg, Berlin"},
        {"courtName": "Sunset Beach", "time": "5:30 PM - 7:30 PM", "location": "Prenzlauer Berg, Berlin"},
        {"courtName": "Urban Beach", "time": "10:00 AM - 12:00 PM", "location": "Friedrichshain, Berlin"},
        {"courtName": "City Sands", "time": "2:00 PM - 4:00 PM", "location": "Charlottenburg, Berlin"},
        {"courtName": "Tiergarten Beach", "time": "4:00 PM - 6:00 PM", "location": "Tiergarten, Berlin"},
      ];
  }

  List<Map<String, String>> getAvailableCourts() {
    return _courts;
  }

  List<Map<String, String>> getCourtsByLocation(String location) {
    return _courts
        .where((court) => court["location"] == location)
        .toList();
  }

    List<String> getLocations() {
    return getAvailableCourts().map((court) => court["location"]!).toSet().toList();
  }
  void createCourt(String name, String time, String location) {
    final newCourt = {"courtName": name, "time": time, "location": location};
    _courts.add(newCourt);
  }
}