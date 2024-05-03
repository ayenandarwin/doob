

class Success {
  Success({
    required this.status,
    required this.data,
  });
  late final bool status;
  late final String data;

  Success.fromJson(Map<String, dynamic> json) {
    status = json['success'];
    data = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = status;
    data['total_results'] = data;
    return data;
  }
}
