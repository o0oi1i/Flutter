class Advertise {
  List<AdvertiseItem> result = [];

  Advertise({this.result});

  Advertise.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      json['result'].forEach((v) {
        result.add(new AdvertiseItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AdvertiseItem {
  String aId;
  String title;
  String status;
  String pic;
  String url;

  AdvertiseItem({
    this.aId,
    this.title,
    this.status,
    this.pic,
    this.url,
  });

  AdvertiseItem.fromJson(Map<String, dynamic> json) {
    aId = json['_id'];
    title = json['title'];
    status = json['status'];
    pic = json['pic'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.aId;
    data['title'] = this.title;
    data['status'] = this.status;
    data['pic'] = this.pic;
    data['url'] = this.url;
    return data;
  }
}
