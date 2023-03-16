import 'dart:math';

String emoji() {
  final random = Random().nextInt(10);
  final emojis = ["🤪", "✌️", "😎", "🤪", "👋", "👍", "😉", "✊", "🖖", "👊"];
  return emojis[random];
}
