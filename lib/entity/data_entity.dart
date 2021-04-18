class UIDataEntity<T> {
  bool isError = false;
  String message = "";
  T data;

  UIDataEntity({this.isError = false, this.message, this.data});
}