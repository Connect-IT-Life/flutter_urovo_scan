import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_urovo_scan_platform_interface.dart';

/// An implementation of [FlutterUrovoScanPlatform] that uses method channels.
class MethodChannelFlutterUrovoScan extends FlutterUrovoScanPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_urovo_scan');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> getBatteryLevel() async {
    if (!Platform.isAndroid) {
      throw Exception('Available only for Android');
    }

    try {
      final result =
          await methodChannel.invokeMethod<String>('getBatteryLevel');
      return result;
    } catch (e) {
      throw Exception('[MethodChannelError] ${e.toString()}');
    }
  }

  @override
  Future<String?> getScannerState() async {
    if (!Platform.isAndroid) {
      throw Exception('Available only for Android');
    }

    try {
      final result =
          await methodChannel.invokeMethod<String>('getScannerState');
      return result;
    } catch (e) {
      throw Exception('[MethodChannelError] ${e.toString()}');
    }
  }

  @override
  Future<String?> openScanner() async {
    if (!Platform.isAndroid) {
      throw Exception('Available only for Android');
    }

    try {
      final result = await methodChannel.invokeMethod<String>('openScanner');
      return result;
    } catch (e) {
      throw Exception('[MethodChannelError] ${e.toString()}');
    }
  }

  @override
  Future<String?> closeScanner() async {
    if (!Platform.isAndroid) {
      throw Exception('Available only for Android');
    }

    try {
      final result = await methodChannel.invokeMethod<String>('closeScanner');
      return result;
    } catch (e) {
      throw Exception('[MethodChannelError] ${e.toString()}');
    }
  }

  @override
  Future<int?> getOutputMode() async {
    if (!Platform.isAndroid) {
      throw Exception('Available only for Android');
    }

    try {
      final result = await methodChannel.invokeMethod<int>('getOutputMode');
      return result;
    } catch (e) {
      throw Exception('[MethodChannelError] ${e.toString()}');
    }
  }

  @override
  Future<String?> setOutputMode(int outputMode) async {
    if (!Platform.isAndroid) {
      throw Exception('Available only for Android');
    }

    try {
      final result = await methodChannel
          .invokeMethod<String>('setOutputMode', {"output_mode": outputMode});
      return result;
    } catch (e) {
      throw Exception('[MethodChannelError] ${e.toString()}');
    }
  }

  @override
  Future<String?> getTriggerMode() async {
    if (!Platform.isAndroid) {
      throw Exception('Available only for Android');
    }

    try {
      final result = await methodChannel.invokeMethod<String>('getTriggerMode');
      return result;
    } catch (e) {
      throw Exception('[MethodChannelError] ${e.toString()}');
    }
  }

  @override
  Future<String?> setTriggerMode(String mode) async {
    if (!Platform.isAndroid) {
      throw Exception('Available only for Android');
    }

    try {
      final result = await methodChannel
          .invokeMethod<String>('setTriggerMode', {"mode": mode.toUpperCase()});

      return result;
    } catch (e) {
      throw Exception('[MethodChannelError] ${e.toString()}');
    }
  }

  @override
  Future<String?> getParamsInts() async {
    if (!Platform.isAndroid) {
      throw Exception('Available only for Android');
    }

    try {
      final result = await methodChannel.invokeMethod<String>('getParamsInts');
      return result;
    } catch (e) {
      throw Exception('[MethodChannelError] ${e.toString()}');
    }
  }

  @override
  Future<String?> startDecode() async {
    if (!Platform.isAndroid) {
      throw Exception('Available only for Android');
    }

    try {
      final result = await methodChannel.invokeMethod<String>('startDecode');
      return result;
    } catch (e) {
      throw Exception('[MethodChannelError] ${e.toString()}');
    }
  }

  @override
  Future<String?> stopDecode() async {
    if (!Platform.isAndroid) {
      throw Exception('Available only for Android');
    }

    try {
      final result = await methodChannel.invokeMethod<String>('stopDecode');
      return result;
    } catch (e) {
      throw Exception('[MethodChannelError] ${e.toString()}');
    }
  }

  @override
  Future<String?> piccOpen() async {
    if (!Platform.isAndroid) {
      throw Exception('Available only for Android');
    }
    try {
      final result = await methodChannel.invokeMethod<String>('piccOpen');
      return result;
    } catch (e) {
      throw Exception('[MethodChannelError] ${e.toString()}');
    }
  }

  @override
  Future<String?> piccClose() async {
    if (!Platform.isAndroid) {
      throw Exception('Available only for Android');
    }
    try {
      final result = await methodChannel.invokeMethod<String>('piccClose');
      return result;
    } catch (e) {
      throw Exception('[MethodChannelError] ${e.toString()}');
    }
  }

  @override
  Future<String?> piccRequest(String mode) async {
    if (!Platform.isAndroid) {
      throw Exception('Available only for Android');
    }
    try {
      final result = await methodChannel.invokeMethod<String>('piccRequest', {'mode': mode});
      return result;
    } catch (e) {
      throw Exception('[MethodChannelError] ${e.toString()}');
    }
  }

  @override
  Future<String?> piccAntisel() async {
    if (!Platform.isAndroid) {
      throw Exception('Available only for Android');
    }
    try {
      final result = await methodChannel.invokeMethod<String>('piccAntisel');
      return result;
    } catch (e) {
      throw Exception('[MethodChannelError] ${e.toString()}');
    }
  }

  @override
  Future<String?> piccActivate() async {
    if (!Platform.isAndroid) {
      throw Exception('Available only for Android');
    }
    try {
      final result = await methodChannel.invokeMethod<String>('piccActivate');
      return result;
    } catch (e) {
      throw Exception('[MethodChannelError] ${e.toString()}');
    }
  }

  @override
  Future<String?> piccDeactivate(int mode) async {
    if (!Platform.isAndroid) {
      throw Exception('Available only for Android');
    }
    try {
      final result = await methodChannel.invokeMethod<String>('piccDeactivate', {'mode': mode});
      return result;
    } catch (e) {
      throw Exception('[MethodChannelError] ${e.toString()}');
    }
  }

  @override
  Future<Map<String, dynamic>?> piccApduTransmit(Uint8List cmd) async {
    if (!Platform.isAndroid) {
      throw Exception('Available only for Android');
    }
    try {
      final result = await methodChannel.invokeMapMethod<String, dynamic>('piccApduTransmit', {'cmd': cmd});
      return result;
    } catch (e) {
      throw Exception('[MethodChannelError] ${e.toString()}');
    }
  }
}
