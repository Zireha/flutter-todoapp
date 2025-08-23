class Task {
  final int? id;
  final String taskTitle;
  final String taskDescription;
  final String time;
  final String date;
  final int taskPriority;

  Task({
    this.id, required this.taskTitle, required this.taskDescription, required this.time, required this.date, required this.taskPriority
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "taskTitle" : taskTitle,
      "taskDescription" : taskDescription,
      "time" : time,
      "date" : date,
      "taskPriority" : taskPriority
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      taskTitle: map["taskTitle"],
      taskDescription: map["taskDescription"],
      time: map["time"],
      date: map["date"],
      taskPriority: map["taskPriority"]
    );
  }

}