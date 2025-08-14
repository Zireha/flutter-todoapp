class Task {
  final int? id;
  final String? taskTitle;
  final String? taskDescription;
  final String? time;
  final String? date;
  final int? taskPriority;

  Task({
    this.id, this.taskTitle, this.taskDescription, this.time, this.date, this.taskPriority
  });

  Map<String, dynamic> toMap() {
    return {
      "id" : id,
      "taskTitle" : taskTitle,
      "taskDescription" : taskDescription,
      "time" : time,
      "date" : date,
      "taskPriority" : taskPriority
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id : map["id"],
      taskTitle: map["taskTitle"],
      taskDescription: map["taskDescription"],
      time: map["time"],
      date: map["date"],
      taskPriority: map["taskPriority"]
    );
  }

}