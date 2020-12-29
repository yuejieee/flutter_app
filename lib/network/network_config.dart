class NetworkConfig {
  String domain;
  String staticKey;
  String dynamicKey;
  String appVersion;
  String appType;
  String memberId = "0000";

  NetworkConfig({
    this.domain,
    this.staticKey,
    this.dynamicKey,
    this.appVersion,
    this.appType,
    this.memberId,
  });
}
