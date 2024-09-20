class MessageModel{
  String id;
  String senderId;
  String receiverId;
  String date;
  String time;
  String content;
  String type;

  MessageModel({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.date,
    required this.time,
    required this.content,
    required this.type,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
    id: json["id"],
    senderId: json["senderId"],
    receiverId: json["receiverId"],
    date: json["date"],
    time: json["time"],
    content: json["content"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "senderId": senderId,
    "receiverId": receiverId,
    "date": date,
    "time": time,
    "content": content,
    "type": type,
  };

}