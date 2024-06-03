class ForYouSong {
  bool? status;
  List<Data>? data;

  ForYouSong({this.status, this.data});

  ForYouSong.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? coverPhoto;
  String? thumbnail;
  String? audio;
  String? runTime;
  String? lyric;
  int? albumId;
  int? ownerId;
  String? status;
  String? type;
  String? mtv;
  Null? rejectReason;
  int? likeCount;
  int? commentCount;
  int? shareCount;

  Data(
      {this.id,
      this.name,
      this.coverPhoto,
      this.thumbnail,
      this.audio,
      this.runTime,
      this.lyric,
      this.albumId,
      this.ownerId,
      this.status,
      this.type,
      this.mtv,
      this.rejectReason,
      this.likeCount,
      this.commentCount,
      this.shareCount});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coverPhoto = json['cover_photo'];
    thumbnail = json['thumbnail'];
    audio = json['audio'];
    runTime = json['run_time'];
    lyric = json['lyric'];
    albumId = json['album_id'];
    ownerId = json['owner_id'];
    status = json['status'];
    type = json['type'];
    mtv = json['mtv'];
    rejectReason = json['reject_reason'];
    likeCount = json['like_count'];
    commentCount = json['comment_count'];
    shareCount = json['share_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['cover_photo'] = this.coverPhoto;
    data['thumbnail'] = this.thumbnail;
    data['audio'] = this.audio;
    data['run_time'] = this.runTime;
    data['lyric'] = this.lyric;
    data['album_id'] = this.albumId;
    data['owner_id'] = this.ownerId;
    data['status'] = this.status;
    data['type'] = this.type;
    data['mtv'] = this.mtv;
    data['reject_reason'] = this.rejectReason;
    data['like_count'] = this.likeCount;
    data['comment_count'] = this.commentCount;
    data['share_count'] = this.shareCount;
    return data;
  }
}
