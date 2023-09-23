// ignore_for_file: public_member_api_docs, sort_constructors_first

class Todo {
  String title;
  String? desc;
  bool isdone;
  DateTime? completionTime;

  Todo({
    required this.title,
    this.desc,
    this.isdone = false,
    this.completionTime,
  });
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'completionTime': completionTime!.toIso8601String(),
      'isDone': isdone,
    };
  }
}
