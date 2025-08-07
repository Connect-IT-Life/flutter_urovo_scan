import 'dart:typed_data';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_urovo_scan_method_channel.dart';

abstract class FlutterUrovoScanPlatform extends PlatformInterface {
  /// Constructs a FlutterUrovoScanPlatform.
  FlutterUrovoScanPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterUrovoScanPlatform _instance = MethodChannelFlutterUrovoScan();

  /// The default instance of [FlutterUrovoScanPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterUrovoScan].
  static FlutterUrovoScanPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterUrovoScanPlatform] when
  /// they register themselves.
  static set instance(FlutterUrovoScanPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getBatteryLevel() {
    throw UnimplementedError('getBatteryLevel() has not been implemented.');
  }

  Future<String?> getScannerState() {
    throw UnimplementedError('getScannerState() has not been implemented.');
  }

  Future<String?> openScanner() {
    throw UnimplementedError('openScanner() has not been implemented.');
  }

  Future<String?> closeScanner() {
    throw UnimplementedError('closeScanner() has not been implemented.');
  }

  Future<int?> getOutputMode() {
    throw UnimplementedError('getOutputMode() has not been implemented.');
  }

  Future<String?> setOutputMode(int outputMode) {
    throw UnimplementedError('setOutputMode() has not been implemented.');
  }

  Future<String?> getTriggerMode() {
    throw UnimplementedError('getTriggerMode() has not been implemented.');
  }

  Future<String?> setTriggerMode(String mode) {
    throw UnimplementedError('setTriggerMode() has not been implemented.');
  }

  Future<String?> getParamsInts() {
    throw UnimplementedError('getParamsInts() has not been implemented.');
  }

  Future<String?> startDecode() {
    throw UnimplementedError('startDecode() has not been implemented.');
  }

  Future<String?> stopDecode() {
    throw UnimplementedError('stopDecode() has not been implemented.');
  }

  Future<String?> piccOpen() {
    throw UnimplementedError('piccOpen() has not been implemented.');
  }

  Future<String?> piccClose() {
    throw UnimplementedError('piccClose() has not been implemented.');
  }

  Future<String?> piccRequest(String mode) {
    throw UnimplementedError('piccRequest() has not been implemented.');
  }

  Future<String?> piccAntisel() {
    throw UnimplementedError('piccAntisel() has not been implemented.');
  }

  Future<String?> piccActivate() {
    throw UnimplementedError('piccActivate() has not been implemented.');
  }

  Future<String?> piccDeactivate(int mode) {
    throw UnimplementedError('piccDeactivate() has not been implemented.');
  }

  Future<Map<String, dynamic>?> piccApduTransmit(Uint8List cmd) {
    throw UnimplementedError('piccApduTransmit() has not been implemented.');
  }

  Future<String?> iccOpen(int slot, int cardType, int volt) {
    throw UnimplementedError('iccOpen() has not been implemented.');
  }

  Future<String?> iccClose() {
    throw UnimplementedError('iccClose() has not been implemented.');
  }

  Future<String?> iccDetect() {
    throw UnimplementedError('iccDetect() has not been implemented.');
  }

  Future<String?> iccActivate() {
    throw UnimplementedError('iccActivate() has not been implemented.');
  }

  Future<Map<String, dynamic>?> iccApduTransmit(Uint8List cmd) {
    throw UnimplementedError('iccApduTransmit() has not been implemented.');
  }

  Future<String?> iccDeactivate() {
    throw UnimplementedError('iccDeactivate() has not been implemented.');
  }
}
