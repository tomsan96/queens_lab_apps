import 'package:connpass_api_app/repository/events_repository.dart';

class ConnpassRepository {
  final int resultsReturned;
  final int resultsAvailable;
  final int resultsStart;
  final List<EventsRepository> events;

  ConnpassRepository({
    this.resultsReturned,
    this.resultsAvailable,
    this.resultsStart,
    this.events
  });

  factory ConnpassRepository.fromJson(Map<String, dynamic> json) {
    return ConnpassRepository(
        resultsReturned: json['results_returned'],
        resultsAvailable: json['results_available'],
        resultsStart: json['results_start'],
        events: json['events'] != null
          ? json['events'].map<EventsRepository>((e) => EventsRepository.fromJson(e)).toList()
              : null);
  }
}
