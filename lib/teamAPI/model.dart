class Teams {
  String abbreviation;
  String city;

  Teams({required this.abbreviation, required this.city});

  Teams.fromJson(Map<String, dynamic> json)
      : abbreviation = json['abbreviation'],
        city = json['city'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['abbreviation'] = this.abbreviation;
    data['city'] = this.city;
    return data;
  }
}

// class Dogs {
//   String message;
//   String status;

//   Dogs({required this.message, required this.status});

//   Dogs.fromJson(Map<String, dynamic> json)
//       : message = json['message'],
//         status = json['status'];

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['message'] = this.message;
//     data['status'] = this.status;
//     return data;
//   }
// }
