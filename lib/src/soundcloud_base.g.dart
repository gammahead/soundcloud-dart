// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soundcloud_base.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) =>
    new AuthResponse(json['access_token'] as String, json['expires_in'] as int,
        json['scope'] as String, json['refresh_token'] as String);

abstract class _$AuthResponseSerializerMixin {
  String get access_token;
  int get expires_in;
  String get scope;
  String get refresh_token;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'access_token': access_token,
        'expires_in': expires_in,
        'scope': scope,
        'refresh_token': refresh_token
      };
}

Track _$TrackFromJson(Map<String, dynamic> json) => new Track(
    json['reposts_count'] as int,
    json['attachments_uri'] as String,
    json['video_url'] as String,
    json['track_type'] as String,
    json['release_month'] as int,
    json['original_format'] as String,
    json['label_name'] as String,
    json['duration'] as int,
    json['id'] as int,
    json['streamable'] as bool,
    json['user_id'] as int,
    json['user_favorite'] as bool,
    json['title'] as String,
    json['favoritings_count'] as int,
    json['commentable'] as bool,
    json['label_id'] as String,
    json['state'] as String,
    json['downloadable'] as bool,
    json['waveform_url'] as String,
    json['sharing'] as String,
    json['description'] as String,
    json['release_day'] as int,
    json['purchase_url'] as String,
    json['permalink'] as String,
    json['comment_count'] as int,
    json['purchase_title'] as String,
    json['stream_url'] as String,
    json['last_modified'] as String,
    json['user'] == null
        ? null
        : new User.fromJson(json['user'] as Map<String, dynamic>),
    json['genre'] as String,
    json['isrc'] as bool,
    json['download_count'] as int,
    json['permalink_url'] as String,
    json['playback_count'] as int,
    json['kind'] as String,
    json['release_year'] as int,
    json['license'] as String,
    json['artwork_url'] as String,
    json['created_at'] as String,
    json['bpm'] as int,
    json['uri'] as String,
    json['original_content_size'] as int,
    json['key_signature'] as String,
    json['user_playback_count'] as int,
    json['release'] as int,
    json['tag_list'] as String,
    json['embeddable_by'] as String);

abstract class _$TrackSerializerMixin {
  int get reposts_count;
  String get attachments_uri;
  String get video_url;
  String get track_type;
  int get release_month;
  String get original_format;
  String get label_name;
  int get duration;
  int get id;
  bool get streamable;
  int get user_id;
  bool get user_favorite;
  String get title;
  int get favoritings_count;
  bool get commentable;
  String get label_id;
  String get state;
  bool get downloadable;
  String get waveform_url;
  String get sharing;
  String get description;
  int get release_day;
  String get purchase_url;
  String get permalink;
  int get comment_count;
  String get purchase_title;
  String get stream_url;
  String get last_modified;
  User get user;
  String get genre;
  bool get isrc;
  int get download_count;
  String get permalink_url;
  int get playback_count;
  String get kind;
  int get release_year;
  String get license;
  String get artwork_url;
  String get created_at;
  int get bpm;
  String get uri;
  int get original_content_size;
  String get key_signature;
  int get user_playback_count;
  int get release;
  String get tag_list;
  String get embeddable_by;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'reposts_count': reposts_count,
        'attachments_uri': attachments_uri,
        'video_url': video_url,
        'track_type': track_type,
        'release_month': release_month,
        'original_format': original_format,
        'label_name': label_name,
        'duration': duration,
        'id': id,
        'streamable': streamable,
        'user_id': user_id,
        'user_favorite': user_favorite,
        'title': title,
        'favoritings_count': favoritings_count,
        'commentable': commentable,
        'label_id': label_id,
        'state': state,
        'downloadable': downloadable,
        'waveform_url': waveform_url,
        'sharing': sharing,
        'description': description,
        'release_day': release_day,
        'purchase_url': purchase_url,
        'permalink': permalink,
        'comment_count': comment_count,
        'purchase_title': purchase_title,
        'stream_url': stream_url,
        'last_modified': last_modified,
        'user': user,
        'genre': genre,
        'isrc': isrc,
        'download_count': download_count,
        'permalink_url': permalink_url,
        'playback_count': playback_count,
        'kind': kind,
        'release_year': release_year,
        'license': license,
        'artwork_url': artwork_url,
        'created_at': created_at,
        'bpm': bpm,
        'uri': uri,
        'original_content_size': original_content_size,
        'key_signature': key_signature,
        'user_playback_count': user_playback_count,
        'release': release,
        'tag_list': tag_list,
        'embeddable_by': embeddable_by
      };
}

User _$UserFromJson(Map<String, dynamic> json) => new User(
    json['username'] as String,
    json['permalink'] as String,
    json['avatar_url'] as String,
    json['kind'] as String,
    json['uri'] as String,
    json['last_modified'] as String,
    json['permalink_url'] as String,
    json['id'] as int);

abstract class _$UserSerializerMixin {
  String get username;
  String get permalink;
  String get avatar_url;
  String get kind;
  String get uri;
  String get last_modified;
  String get permalink_url;
  int get id;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'username': username,
        'permalink': permalink,
        'avatar_url': avatar_url,
        'kind': kind,
        'uri': uri,
        'last_modified': last_modified,
        'permalink_url': permalink_url,
        'id': id
      };
}
