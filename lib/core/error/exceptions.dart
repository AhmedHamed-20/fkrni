import 'error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerException({required this.errorMessageModel});
}

class AppDataBaseException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const AppDataBaseException(this.errorMessageModel);
}
