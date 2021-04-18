abstract class BaseRemoteEntity<T> {
  T fromJsonToEntity(Map<String, dynamic> json);
}