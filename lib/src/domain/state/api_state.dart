import 'package:doob/src/domain/model/delight.dart';
import 'package:flutter/material.dart';

import 'data_type.dart';

@immutable
abstract class ApiState extends DataType {
  get data => null;

  when({required Widget Function(dynamic download) data, required CircularProgressIndicator Function() loading, required Text Function(dynamic error, dynamic stackTrace) error}) {}
}

class InitialState extends ApiState {}

class LoadingState extends ApiState {}

class SuccessState extends ApiState {
  final dynamic data;

  SuccessState(this.data);
}

/// This state under 200 Status code with status false value.
class OtherState extends ApiState {
  final dynamic other;

  OtherState(this.other);
}

class TimeoutState extends ApiState {
  final dynamic error;

  TimeoutState(this.error);
}

class NetworkState extends ApiState {
  NetworkState();
}

class ConnectionTimeOut extends ApiState {
  ConnectionTimeOut();
}

class ErrorState extends ApiState {
  final dynamic error;
  final ErrorType errorType;

  ErrorState(this.error, this.errorType);
}

enum ErrorType { server, forbidden, badState, notFound, unknown }

ErrorType codeToType(int? statusCode) {
  return switch (statusCode) {
    404 => ErrorType.notFound,
    500 => ErrorType.server,
    400 => ErrorType.badState,
    503 => ErrorType.forbidden,
    _ => ErrorType.unknown
  };
}
