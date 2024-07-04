String getLimitedOverview(String text, int limit) {
  final sentences = text.split(RegExp(r'(?<=[.!?])\s+'));
  if (sentences.length <= limit) {
    return text;
  }
  return sentences.take(limit).join(' ');
}
