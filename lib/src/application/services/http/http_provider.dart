import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'http_service.dart';

final httpProvider = Provider<HttpService>((ref) => DioHttpService());
