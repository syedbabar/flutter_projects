/// albumId : 1
/// id : 1
/// title : "accusamus beatae ad facilis cum similique qui sunt"
/// url : "https://via.placeholder.com/600/92c952"
/// thumbnailUrl : "https://via.placeholder.com/150/92c952"

class Photos {
  int _albumId;
  int _id;
  String _title;
  String _url;
  String _thumbnailUrl;

  int get albumId => _albumId;
  int get id => _id;
  String get title => _title;
  String get url => _url;
  String get thumbnailUrl => _thumbnailUrl;

  Photos({
      int albumId, 
      int id, 
      String title, 
      String url, 
      String thumbnailUrl}){
    _albumId = albumId;
    _id = id;
    _title = title;
    _url = url;
    _thumbnailUrl = thumbnailUrl;
}

  Photos.fromJson(dynamic json) {
    _albumId = json["albumId"];
    _id = json["id"];
    _title = json["title"];
    _url = json["url"];
    _thumbnailUrl = json["thumbnailUrl"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["albumId"] = _albumId;
    map["id"] = _id;
    map["title"] = _title;
    map["url"] = _url;
    map["thumbnailUrl"] = _thumbnailUrl;
    return map;
  }

}