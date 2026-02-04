class UrlFormatter {
  static String? getDirectGoogleDriveUrl(String? url) {
    if (url == null || !url.startsWith('https://drive.google.com/file/d/')) {
      return url;
    }
    try {
      final id = url.split('/d/')[1].split('/')[0];
      return 'https://drive.google.com/uc?export=view&id=$id';
    } catch (e) {
      return url;
    }
  }
}