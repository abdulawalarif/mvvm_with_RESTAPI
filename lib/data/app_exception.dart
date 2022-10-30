class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return '$_prefix $_message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Error During communication');
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Invalid request');
}

class UnauthorizeException extends AppException {
  UnauthorizeException([String? message])
      : super(message, 'Unauthorize request');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, 'Invali Input');
}
