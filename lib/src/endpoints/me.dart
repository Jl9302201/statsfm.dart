part of statsfm;

class Me extends EndpointBase {
  @override
  String get _path => 'v1/me';

  Me(StatsfmApiBase api) : super(api);

  Future<UserPrivate> get() async {
    final String jsonString = await _api._get(_path);
    var map = json.decode(jsonString);

    return UserPrivate.fromJson(map['item']);
  }

  Future<void> deleteAccount() async {
    // TODO: implement
    throw UnimplementedError();
  }

  Future<UserPrivacySettings> privacySettings() async {
    final String jsonString = await _api._get('$_path/privacy');
    var map = json.decode(jsonString);

    return UserPrivacySettings.fromJson(map['item']);
  }

  Future<UserPrivacySettings> updatePrivacySettings(
      UserPrivacySettings privacySettings) async {
    final String jsonString = await _api._put(
      '$_path/privacy',
      json.encode(privacySettings.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
    var map = json.decode(jsonString);

    return UserPrivacySettings.fromJson(map['item']);
  }

  Future<bool> customIdAvailable(String customId) async {
    final String jsonString = await _api._put(
      '$_path/customid-available',
      json.encode({'customId': customId}),
      headers: {'Content-Type': 'application/json'},
    );
    var map = json.decode(jsonString);

    return map['item'] as bool;
  }

  Future<UserProfile> profile() async {
    final String jsonString = await _api._get('$_path/profile');
    var map = json.decode(jsonString);

    return UserProfile.fromJson(map['item']);
  }

  Future<UserProfile> updateProfile(UserPrivacySettings privacySettings) async {
    final String jsonString = await _api._put(
      '$_path/profile',
      json.encode(privacySettings.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
    var map = json.decode(jsonString);

    return UserProfile.fromJson(map['item']);
  }

  Future<List<UserImport>> imports() async {
    final String jsonString = await _api._get('$_path/imports');
    var map = json.decode(jsonString);

    var importsMap = map['items'] as Iterable<dynamic>;
    return importsMap.map((m) => UserImport.fromJson(m)).toList();
  }

  Future<UserImport> import() async {
    // TODO: implement
    throw UnimplementedError();
  }

  Future<void> removeImport(int id) async {
    await _api._delete('$_path/imports/$id', '');
  }
}
