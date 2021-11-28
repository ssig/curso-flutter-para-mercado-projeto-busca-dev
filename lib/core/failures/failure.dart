class Failure implements Exception {
  final String _message;
  const Failure({required String message}) : _message = message;
  String get message => _message;
}
