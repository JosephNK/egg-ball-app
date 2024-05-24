part of '../controller.dart';

class FileController {
  FileController();

  final kRecentlyViewedFileName = 'recently_viewed.json';
  final kMaxCount = 10;
  final kJsonKey = 'urls';

  Future<bool> insertOrUpdateProductUrl(String url) async {
    final file = await _getJsonFile();

    final jsonData = await LFFileManager.shared.readAsFile(
      file,
      decodeJson: true,
    );

    dynamic content;
    if (jsonData != null) {
      final items = (jsonData[kJsonKey] as List)
          .map((item) => item as String)
          .whereNotNull()
          .toList();
      if (!items.contains(url)) {
        items.insert(0, url);
      }
      if (items.length > kMaxCount) {
        items.removeLast();
      }
      content = {
        kJsonKey: items,
      };
    } else {
      content = {
        kJsonKey: [url]
      };
    }

    return await LFFileManager.shared.createOrUpdateFile(
      file,
      content: content,
      encodeJson: true,
      flush: false,
    );
  }

  Future<List<String>> readProductUrls() async {
    final file = await _getJsonFile();

    final jsonData = await LFFileManager.shared.readAsFile(
      file,
      decodeJson: true,
    );

    if (jsonData != null) {
      return (jsonData[kJsonKey] as List)
          .map((item) => item as String)
          .whereNotNull()
          .toList();
    }

    return [];
  }

  Future<bool> deleteFile() async {
    final file = await _getJsonFile();
    return await LFFileManager.shared.deleteFile(file);
  }

  /// Private

  Future<File> _getJsonFile() async {
    final documentPath =
        await LFFileManager.shared.getApplicationDocumentsDirectoryPath();
    final file = File('$documentPath/$kRecentlyViewedFileName');
    return file;
  }
}
