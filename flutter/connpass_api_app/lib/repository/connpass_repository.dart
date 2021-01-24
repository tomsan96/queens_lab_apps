import 'package:connpass_api_app/repository/event_repository.dart';

class ConnpassRepository {
  ConnpassRepository({
    this.resultsReturned,
    this.resultsAvailable,
    this.resultsStart,
    this.events
  });

  factory ConnpassRepository.fromJson(Map<String, dynamic> json) {
    return ConnpassRepository(
        resultsReturned: json['results_returned'] as int,
        resultsAvailable: json['results_available'] as int,
        resultsStart: json['results_start'] as int,
        events: json['events'] != null
          ? json['events'].map<EventRepository>((dynamic e)
            => EventRepository.fromJson(e as Map<String, dynamic>))
              .toList() as List<EventRepository>
                : null);
  }

  final int resultsReturned;
  final int resultsAvailable;
  final int resultsStart;
  final List<EventRepository> events;
}
