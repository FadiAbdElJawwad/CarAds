class UrlFormatter {
  static String? getDirectGoogleDriveUrl(String? url) {
    if (url == null || url.isEmpty) return url;
    
    if (!url.contains('drive.google.com')) return url;

    try {
      if (url.contains('/file/d/')) {
        final parts = url.split('/d/');
        if (parts.length > 1) {
          final id = parts[1].split('/')[0];
          if (id.isNotEmpty) {
            return 'https://drive.google.com/uc?export=view&id=$id';
          }
        }
      }
      
      if (url.contains('?id=')) {
        final parts = url.split('?id=');
        if (parts.length > 1) {
          final id = parts[1].split('&')[0];
          if (id.isNotEmpty) {
            return 'https://drive.google.com/uc?export=view&id=$id';
          }
        }
      }
    } catch (e) {
      // If parsing fails, return original URL
    }
    
    return url;
  }
}
