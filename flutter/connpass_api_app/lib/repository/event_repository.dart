class EventRepository{
  EventRepository({
    this.eventId,
    this.title,
    this.catchMessage,
    this.description,
    this.eventUrl,
    this.hashTag,
    this.startedAt,
    this.endedAt,
    this.limit,
    this.eventType,
    this.address,
    this.place,
  });

  factory EventRepository.fromJson(Map<String, dynamic> json) {
    return EventRepository(
        eventId: json['event_id'] as int,
        title: json['title'] as String,
        catchMessage: json['catch'] as String,
        description: json['description'] as String,
        eventUrl: json['event_url']as String,
        hashTag: json['hash_tag']as String,
        startedAt: json['started_at'] as String,
        endedAt: json['ended_at'] as String,
        limit: json['limit'] as int,
        eventType: json['event_type'] as String,
        address: json['address'] as String,
        place: json['place'] as String,
    );
  }

  final int eventId;
  final String title;
  final String catchMessage;
  final String description;
  final String eventUrl;
  final String hashTag;
  final String startedAt;
  final String endedAt;
  final int limit;
  final String eventType;
  final String address;
  final String place;

  Map<String, Object> toJson() => {
    'event_id': eventId,
    'title': title,
    'catch': catchMessage,
    'description': description,
    'event_url': eventUrl,
    'hash_tag': hashTag,
    'started_at': startedAt,
    'ended_at': endedAt,
    'limit': limit,
    'event_type': eventType,
    'address': address,
    'place': place,
  };
}