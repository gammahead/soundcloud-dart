import 'dart:async';
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;

part 'soundcloud_base.g.dart';
// TODO: Put public facing types in this file.

typedef bool TrackFilter(Track t);

class SoundcloudClient {

  final String _clientId;
  final String _clientSecret;
  final String _username;
  final String _password;
  AuthResponse _authResponse;

  static final String soundcloudApiUrl = "http://api.soundcloud.com";
  static final String authPath = '/oauth2/token';
  static final String tracksPath = '/tracks';

  SoundcloudClient(this._clientId, this._clientSecret, this._username, this._password);

  String get username => _username;

  String get clientId => _clientId;

  Future<AuthResponse> connect() async {
    print('>>> Attempting to connect');
    this._authResponse = _handleConnectResponse(await http.post(soundcloudApiUrl + authPath, body: {
      'client_id': this._clientId,
      'client_secret': this._clientSecret,
      'grant_type': 'password',
      'password': this._password,
      'username': this._username,
      'scope': ''
    }));
    return this._authResponse;
  }

  AuthResponse _handleConnectResponse(http.Response response) {
    print('>>> ' + response.statusCode.toString() + ' ' + response.reasonPhrase);

    if (response.statusCode != 200)
      throw('Failed to connect to ' + soundcloudApiUrl);

    return new AuthResponse.fromJson(json.decode(response.body));
  }

  Track _handleTrackResponse(http.Response response) {
    print('>>> ' + response.statusCode.toString() + ' ' + response.reasonPhrase);
    print('>>> ' + response.body);

    if (response.statusCode != 200)
      throw('Failed to connect to ' + soundcloudApiUrl);

    return new Track.fromJson(json.decode(response.body));
  }

  List<Track> _handleTracksResponse(http.Response response) {
    print('>>> ' + response.statusCode.toString() + ' ' + response.reasonPhrase);
    print('>>> ' + response.body);

    if (response.statusCode != 200)
      throw('Failed to connect to ' + soundcloudApiUrl);

    List<Map<String, dynamic>> tracks = json.decode(response.body);

    return tracks.map((track) => new Track.fromJson(track)).toList();
  }

  Future<Track> getTrack(int trackId) async {
    String trackUrl = soundcloudApiUrl + tracksPath +
        '/' + trackId.toString() + '?client_id=' + this.clientId;
    print('>>> Attempting GET ' + trackUrl);

    Track track = _handleTrackResponse(await http.get(trackUrl));

    return track;
  }

  Future<List<Track>> getTracks(List<int> trackIds,
      [TrackFilter trackFilter]) async {

    if (trackFilter == null) {
      trackFilter = (Track t) => true;
    }

    String tracksUrl = soundcloudApiUrl + tracksPath + '?ids='
        + trackIds.join(",") + '&client_id=' + this.clientId;
    print('>>> Attempting GET ' + tracksUrl);

    return _handleTracksResponse(await http.get(tracksUrl))
        .where((Track t) => trackFilter(t))
        .toList();
  }

  Future<List<Track>> getRecentTracks({int limit = 200,
    TrackFilter trackFilter}) async {

    assert(limit <= 200, 'limit must be less than 200');

    if (trackFilter == null) {
      trackFilter = (Track t) => true;
    }

    String tracksUrl = soundcloudApiUrl + tracksPath + '?limit='
        + limit.toString() + '&client_id=' + this.clientId;
    print('>>> Attempting GET ' + tracksUrl);

    return _handleTracksResponse(await http.get(tracksUrl))
        .where((Track t) => trackFilter(t))
        .toList();
  }
}

@JsonSerializable()
class AuthResponse extends Object with _$AuthResponseSerializerMixin {

  String access_token;
  int expires_in;
  String scope;
  String refresh_token;

  AuthResponse(this.access_token,
      this.expires_in,
      this.scope,
      this.refresh_token);

  factory AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);
}

@JsonSerializable()
class Track extends Object with _$TrackSerializerMixin {

  int reposts_count;
  String attachments_uri;
  String video_url;
  String track_type;
  int release_month;
  String original_format;
  String label_name;
  int duration;
  int id;
  bool streamable;
  int user_id;
  bool user_favorite;
  String title;
  int favoritings_count;
  bool commentable;
  String label_id;
  String state;
  bool downloadable;
  String waveform_url;
  String sharing;
  String description;
  int release_day;
  String purchase_url;
  String permalink;
  int comment_count;
  String purchase_title;
  String stream_url;
  String last_modified;
  User user;
  String genre;
  bool isrc;
  int download_count;
  String permalink_url;
  int playback_count;
  String kind;
  int release_year;
  String license;
  String artwork_url;
  String created_at;
  int bpm;
  String uri;
  int original_content_size;
  String key_signature;
  int user_playback_count;
  int release;
  String tag_list;
  String embeddable_by;
  Track(this.reposts_count,
      this.attachments_uri,
      this.video_url,
      this.track_type,
      this.release_month,
      this.original_format,
      this.label_name,
      this.duration,
      this.id,
      this.streamable,
      this.user_id,
      this.user_favorite,
      this.title,
      this.favoritings_count,
      this.commentable,
      this.label_id,
      this.state,
      this.downloadable,
      this.waveform_url,
      this.sharing,
      this.description,
      this.release_day,
      this.purchase_url,
      this.permalink,
      this.comment_count,
      this.purchase_title,
      this.stream_url,
      this.last_modified,
      this.user,
      this.genre,
      this.isrc,
      this.download_count,
      this.permalink_url,
      this.playback_count,
      this.kind,
      this.release_year,
      this.license,
      this.artwork_url,
      this.created_at,
      this.bpm,
      this.uri,
      this.original_content_size,
      this.key_signature,
      this.user_playback_count,
      this.release,
      this.tag_list,
      this.embeddable_by);

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);
}

@JsonSerializable()
class User extends _$UserSerializerMixin {

  String username;
  String permalink;
  String avatar_url;
  String kind;
  String uri;
  String last_modified;
  String permalink_url;
  int id;

  User(this.username,
      this.permalink,
      this.avatar_url,
      this.kind,
      this.uri,
      this.last_modified,
      this.permalink_url,
      this.id);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
