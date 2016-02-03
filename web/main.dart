// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';

List<ButtonElement> buttons = new List();
Element doughBowl;
Element grid;
ButtonElement resetButton;


void main() {
  doughBowl = querySelector("#doughBowl");
  grid = querySelector('#grid');

  resetButton = querySelector("#resetButton");
  resetButton.onClick.listen(reset);

  produceDough();
}

void drag(Event e) {
  Element dough = e.target;

  if (dough.parent == doughBowl) {
    grid.children.add(dough);
  } else {
    doughBowl.children.add(dough);
  }
}

void reset (Event e) {
  print('You reset the dough!');
  grid.children.clear();
  produceDough();
}

produceDough() {
  buttons.clear();
  for (var i = 0; i < 8; i++) {
    buttons.add(new ButtonElement());
    buttons[i].classes.add("dough");
    buttons[i].onClick.listen(drag);
    doughBowl.children.add(buttons[i]);
  }
}

