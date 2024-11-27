class FirebaseModel<T> {
  bool status;
  DateTime? timeStamp;
  String? message;
  T? data;

  FirebaseModel({
    this.status = false,
    this.timeStamp,
    this.message,
    this.data,
  });

  bool isSuccess() {
    return status;
  }

  factory FirebaseModel.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    return FirebaseModel<T>(
      status: json['status'] ?? false,
      timeStamp: json['timeStamp'] != null ? DateTime.tryParse(json['timeStamp']) : null,
      message: json['message'],
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }
}