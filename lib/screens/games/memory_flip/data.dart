import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';

List<String> fillSourceArray() {
  return [
    '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20'
  ];
}

List getSourceArray(String level,) {
  List<String> levelAndKindList = [];
  List sourceArray = fillSourceArray();
  sourceArray.shuffle();
  if (level == 'hard') {
    for (int i = 0; i < 9; i++) {
      levelAndKindList.add(sourceArray[i]);
      levelAndKindList.add(sourceArray[i]);
    }
  } else if (level == 'intermediate') {
    for (int i = 0; i < 6; i++) {
      levelAndKindList.add(sourceArray[i]);
      levelAndKindList.add(sourceArray[i]);
    }
  } else if (level == 'easy') {
    for (int i = 0; i < 3; i++) {
      levelAndKindList.add(sourceArray[i]);
      levelAndKindList.add(sourceArray[i]);
    }
  }

  levelAndKindList.shuffle();
  return levelAndKindList;
}

List<bool> getInitialItemState(String level) {
  List<bool> initialItemState = [];
  if (level == 'hard') {
    for (int i = 0; i < 18; i++) {
      initialItemState.add(true);
    }
  } else if (level == 'intermediate') {
    for (int i = 0; i < 12; i++) {
      initialItemState.add(true);
    }
  } else if (level == 'easy') {
    for (int i = 0; i < 6; i++) {
      initialItemState.add(true);
    }
  }
  return initialItemState;
}

List<GlobalKey<FlipCardState>> getCardStateKeys(String level) {
  List<GlobalKey<FlipCardState>> cardStateKeys = [];
  if (level == 'hard') {
    for (int i = 0; i < 18; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  } else if (level == 'intermediate') {
    for (int i = 0; i < 12; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  } else if (level == 'easy') {
    for (int i = 0; i < 6; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  }
  return cardStateKeys;
}