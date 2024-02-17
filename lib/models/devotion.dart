class Devotion {
  int id;
  String bibleVerse;
  String bibleVerseMessage;
  String devotionTitle;
  String messageDate;
  String devotionMessage;
  String devotionPrayer;
  String devotionWriter;
  String creationDate;
  String prayerPoint;

  Devotion({
    required this.id,
    required this.bibleVerse,
    required this.bibleVerseMessage,
    required this.devotionTitle,
    required this.messageDate,
    required this.devotionMessage,
    required this.devotionPrayer,
    required this.devotionWriter,
    required this.creationDate,
    required this.prayerPoint,
  });

  factory Devotion.fromJson(Map<String, dynamic> json) {
    return Devotion(
        id: json['id'] ?? "",
        bibleVerse: json['bible_verse'] ?? "",
        bibleVerseMessage: json['bible_verse_message'] ?? "",
        devotionTitle: json['devotion_title'] ?? "",
        messageDate: json['message_date'] ?? "",
        devotionMessage: json['devotion_message'] ?? "",
        devotionPrayer: json['devotion_prayer'] ?? "",
        devotionWriter: json['devotion_writer'] ?? "",
        creationDate: json['creation_date'] ?? "",
        prayerPoint: json['prayer_point'] ?? "");
  }
}

class MonthDevotions {
  final String month;
  final List<Devotion> devotions;

  MonthDevotions({required this.month, required this.devotions});

  factory MonthDevotions.fromJson(String month, List<dynamic> json) {
    List<Devotion> devotions = json.map((m) => Devotion.fromJson(m)).toList();
    return MonthDevotions(month: month, devotions: devotions);
  }
}

List<MonthDevotions> organizeDevotionsByMonth(Map<String, dynamic> json) {
  List<MonthDevotions> result = [];

  json.forEach((month, devotions) {
    result.add(MonthDevotions.fromJson(month, devotions));
  });

  return result;
}
