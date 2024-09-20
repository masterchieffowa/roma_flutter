// class NotificationClass {
//
//   String title;
//   String description;
//   String date;
//   String time;
//   String image;
//
//   NotificationClass({
//     required this.title,
//     required this.description,
//     required this.date,
//     required this.time,
//     required this.image,
//   });
//
//   factory NotificationClass.fromJson(Map<String, dynamic> json) {
//     return NotificationClass(
//       title: json['title'],
//       description: json['description'],
//       date: json['date'],
//       time: json['time'],
//       image: json['image'],
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     'title': title,
//     'description': description,
//     'date': date,
//     'time': time,
//     'image': image,
//   };
//
//   @override
//   String toString() {
//     return 'Notification{title: $title, description: $description, date: $date, time: $time, image: $image}';
//   }
// }
//
