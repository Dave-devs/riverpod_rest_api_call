import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodLogger extends ProviderObserver {
  @override
  void didAddProvider(
      ProviderBase<Object?> provider,
      Object? value,
      ProviderContainer container
      ) {
   if (kDebugMode) {
     print('$provider $value $container');
   }
    super.didAddProvider(provider, value, container);
  }

  @override
  void didUpdateProvider(
      ProviderBase<Object?> provider,
      Object? previousValue,
      Object? newValue,
      ProviderContainer container
      ) {
    if (kDebugMode) {
      print('$provider $previousValue $newValue $container');

    }super.didUpdateProvider(provider, previousValue, newValue, container);
  }

  @override
  void didDisposeProvider(ProviderBase<Object?> provider, ProviderContainer container) {
    if (kDebugMode) {
      print('$provider $container');

    }super.didDisposeProvider(provider, container);
  }

  @override
  void providerDidFail(
      ProviderBase<Object?> provider,
      Object error,
      StackTrace stackTrace,
      ProviderContainer container
      ) {
    if (kDebugMode) {
      print('$provider $error $stackTrace $container');
    }
    super.providerDidFail(provider, error, stackTrace, container);
  }
}