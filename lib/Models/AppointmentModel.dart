class AppointmentModel{
  String id;
  String name;
  String date;
  String time;
  String description;
  String status;
  String patientId;
  String doctorId;
  String patientName;
  String doctorName;

  AppointmentModel({
    required this.id,
    required this.name,
    required this.date,
    required this.time,
    required this.description,
    required this.status,
    required this.patientId,
    required this.doctorId,
    required this.patientName,
    required this.doctorName
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) => AppointmentModel(
    id: json["id"],
    name: json["name"],
    date: json["date"],
    time: json["time"],
    description: json["description"],
    status: json["status"],
    patientId: json["patientId"],
    doctorId: json["doctorId"],
    patientName: json["patientName"],
    doctorName: json["doctorName"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "date": date,
    "time": time,
    "description": description,
    "status": status,
    "patientId": patientId,
    "doctorId": doctorId,
    "patientName": patientName,
    "doctorName": doctorName
  };
}