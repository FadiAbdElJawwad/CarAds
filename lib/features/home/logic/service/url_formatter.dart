class UrlFormatter {
  static String? getDirectGoogleDriveUrl(String? url) {
    if (url == null || url.isEmpty) return url;
    
    if (!url.contains('drive.google.com')) return url;

    try {
      if (url.contains('/file/d/')) {
        final id = url.split('/d/')[1].split('/')[0];
        return 'https://drive.google.com/uc?export=view&id=$id';
      }
      
      if (url.contains('?id=')) {
        final id = url.split('?id=')[1].split('&')[0];
        return 'https://drive.google.com/uc?export=view&id=$id';
      }
    } catch (e) {
      // If parsing fails, return original URL
    }
    
    return url;
  }
}
