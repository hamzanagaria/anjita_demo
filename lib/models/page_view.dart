class PageViewModel {
  String? name;
  String? path;

  PageViewModel({this.name, this.path});

  PageViewModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['path'] = path;
    return data;
  }
}
