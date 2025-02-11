import 'package:flutter_riverpod/flutter_riverpod.dart';

final globalIntProvider = StateProvider.family<int, String>(
  (_, __) => 0
);



final globalStringProvider = StateProvider.family<String, String>(
  (_, __) => ''
);



final globalBooleanProvider = StateProvider.family<bool?, String>(
  (_, __) => null
);
