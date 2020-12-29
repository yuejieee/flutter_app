import 'package:flutter_app/network/basic_model.dart';
import 'package:flutter_app/network/network_config.dart';

class BaseModel extends BasicModel {
  @override
  NetworkConfig getConfig() {
    NetworkConfig config = NetworkConfig();
    config.appType = "15";
    config.appVersion = "5.16.0";
    config.dynamicKey = "bcssynwc7h2mbdwo";
    config.staticKey = "ABCDEFGHIJK12345";
    config.domain = "http://web81.micup.net";
    return config;
  }
}