# soundcloud

A microscopic library for using Dart to interface with the soundcloud api

Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).

## Usage

A simple usage example:

    import 'package:soundcloud/soundcloud.dart';

    main() {
      SoundcloudClient client = new SoundcloudClient(clientId, clientSecret, username, password);
    }
