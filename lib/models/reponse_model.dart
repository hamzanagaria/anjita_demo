class ResponseData<T> {
  bool? status;
  T? object;
  dynamic data;

  ResponseData({this.status, this.object, this.data});

  ResponseData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    object = json['object'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = this.status;
    data['object'] = this.object;
    data['data'] = this.data;
    return data;
  }
}
