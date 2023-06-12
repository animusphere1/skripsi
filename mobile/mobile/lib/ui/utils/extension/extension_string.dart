extension Title on String {
  // ignore: unnecessary_this
  String correctOverflow() => this.replaceAll('', '\u200B');

  String toCamelCase() {
    var listText = [];

    // ignore: unnecessary_this
    for (var i in this.split(' ')) {
      listText.add('${i[0].toUpperCase()}${i.substring(1).toLowerCase()}');
    }

    return listText.join(' ');
  }
}
