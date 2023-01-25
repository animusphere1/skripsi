extension Title on String {
  // ignore: unnecessary_this
  String correctOverflow() => this.replaceAll('', '\u200B');
}
