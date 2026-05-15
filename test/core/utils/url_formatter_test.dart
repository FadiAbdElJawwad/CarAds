import 'package:car_ads/core/utils/url_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UrlFormatter', () {
    test('should return null if input is null', () {
      expect(UrlFormatter.getDirectGoogleDriveUrl(null), isNull);
    });

    test('should return empty string if input is empty', () {
      expect(UrlFormatter.getDirectGoogleDriveUrl(''), '');
    });

    test('should return original URL if it is not a Google Drive link', () {
      const url = 'https://example.com/image.png';
      expect(UrlFormatter.getDirectGoogleDriveUrl(url), url);
    });

    test('should convert Google Drive file/d/ link to direct link', () {
      const url = 'https://drive.google.com/file/d/12345abcde/view?usp=sharing';
      const expected = 'https://drive.google.com/uc?export=view&id=12345abcde';
      expect(UrlFormatter.getDirectGoogleDriveUrl(url), expected);
    });

    test('should convert Google Drive ?id= link to direct link', () {
      const url = 'https://drive.google.com/open?id=12345abcde';
      const expected = 'https://drive.google.com/uc?export=view&id=12345abcde';
      expect(UrlFormatter.getDirectGoogleDriveUrl(url), expected);
    });

    test('should handle Google Drive ?id= link with extra parameters', () {
      const url = 'https://drive.google.com/uc?id=12345abcde&export=download';
      const expected = 'https://drive.google.com/uc?export=view&id=12345abcde';
      expect(UrlFormatter.getDirectGoogleDriveUrl(url), expected);
    });

    test('should return original URL if Google Drive link parsing fails', () {
      const url = 'https://drive.google.com/file/d/';
      expect(UrlFormatter.getDirectGoogleDriveUrl(url), url);
    });
  });
}
