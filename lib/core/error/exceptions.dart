import 'error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerException({required this.errorMessageModel});
}

class DataBaseException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const DataBaseException(this.errorMessageModel);
}
