import 'package:flutter/material.dart';

final ValueNotifier<int> favoriteCount = ValueNotifier(0);
final ValueNotifier<List<String>> favoriteItems = ValueNotifier([]);

void toggleFavorite(String item) {
  if (favoriteItems.value.contains(item)) {
    favoriteItems.value = List.from(favoriteItems.value)..remove(item);
  } else {
    favoriteItems.value = List.from(favoriteItems.value)..add(item);
  }
  favoriteCount.value = favoriteItems.value.length;
}
