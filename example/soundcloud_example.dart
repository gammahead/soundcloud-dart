import 'package:soundcloud/soundcloud.dart';

typedef bool TrackFilter(Track t);

main() async {

  String clientId = 'clientId';
  String clientSecret = 'clientSecret';
  String username = 'username';
  String password = 'password';

  // Create a soundcloud client
  SoundcloudClient client = new SoundcloudClient(clientId, clientSecret, username, password);

  AuthResponse connectResponse = await client.connect();

  // Get a specific track
  Track first = await client.getTrack(434785983);

  // Create a track filter to apply to a set of fetched tracks
  bool Function(Track) trackFilter = (Track t) => t.genre != null
      && (t.genre.toLowerCase().contains(new RegExp(r'house'))
          || t.genre.toLowerCase().contains(new RegExp(r'techno')));

  // Use the client to fetch a list of recent tracks posted to soundcloud
  List<Track> tracks = await client.getRecentTracks(limit: 200,
      trackFilter: trackFilter);

  // Print the genre of each of the tracks fetched
  tracks.map((Track t) => t.genre).forEach((String s) => print(s));


}
