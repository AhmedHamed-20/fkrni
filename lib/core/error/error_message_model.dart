import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String message;

  const ErrorMessageModel({required this.message});

  factory ErrorMessageModel.fromException(Object? object) {
    return ErrorMessageModel(
      message: object.toString(),
    );
  }
  @override
  List<Object?> get props => [
        message,
      ];
}
