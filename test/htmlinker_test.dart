import 'package:htmlinker/htmlinker.dart';
import 'package:test/test.dart';

void main() {
  test('Render template', () {
    var template = '''
    {{ include header.html }}
    <body>
      This is page content
    </body>
    {{include footer.html}}
    ''';

    var partials = {
      'header.html': '''<html>
    <head>
      <title>This is page title</title>
    </head>''',
      'footer.html': '''<footer>This is page footer</footer>
    </html>'''
    };

    var expected = '''
    <html>
    <head>
      <title>This is page title</title>
    </head>
    <body>
      This is page content
    </body>
    <footer>This is page footer</footer>
    </html>
    ''';

    expect(renderTemplate(template, partials), expected);
  });

  test('Listing HTML filenames inside directory', () {
    var expected = ['header.html', 'body.html', 'footer.html'];

    expect(listHtmlFilenames('test/samples'), unorderedEquals(expected));
  });
}
