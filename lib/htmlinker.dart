String renderTemplate(String template, Map<String, String> partials) {
  return template.replaceAllMapped(RegExp(r'{{\s?include (.+\.html)\s?}}'), (
    Match match,
  ) {
    if (partials.containsKey(match[1])) return partials[match[1]];

    return '';
  });
}
