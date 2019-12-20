import 'dart:io';

import 'package:path/path.dart';

String renderTemplate(String template, Map<String, String> partials) {
  return template.replaceAllMapped(RegExp(r'{{\s?include (.+\.html)\s?}}'), (
    Match match,
  ) {
    if (partials.containsKey(match[1])) return partials[match[1]];

    return '';
  });
}

List<String> listHtmlFilenames(String directory) {
  return Directory(directory)
      .listSync()
      .where((FileSystemEntity entity) {
        return entity is File && extension(entity.path) == '.html';
      })
      .map((FileSystemEntity entity) => basename(entity.path))
      .toList();
}
