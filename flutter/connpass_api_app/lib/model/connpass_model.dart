import 'package:connpass_api_app/model/event_model.dart';

class ConnpassModel {
  ConnpassModel({
    this.resultsReturned,
    this.resultsAvailable,
    this.resultsStart,
    this.events
  });

  factory ConnpassModel.fromJson(Map<String, dynamic> json) {
    return ConnpassModel(
        resultsReturned: json['results_returned'] as int,
        resultsAvailable: json['results_available'] as int,
        resultsStart: json['results_start'] as int,
        events: json['events'] != null
            ? json['events'].map<EventModel>((dynamic e)
        => EventModel.fromJson(e as Map<String, dynamic>))
            .toList() as List<EventModel>
            : null);
  }

  final int resultsReturned;
  final int resultsAvailable;
  final int resultsStart;
  final List<EventModel> events;
}
