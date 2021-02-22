abstract class ICustomAppStorage {
  void saveKey(String key, dynamic value);
  void removeKey(String key);
  readKey(String key);
  Future<Map<String, String>> getAllKeys();
  void deleteAllKeys();
}
