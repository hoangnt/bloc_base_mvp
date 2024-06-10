class BaseUrl {
  static const String prdUrl = 'https://prod.com.vn';
  static const String stgUrl = 'https://stg.com.vn';
  static const String devUrl = 'https://dev.com.vn';

  static String getServerUrl() {
    return devUrl;
  }
}
