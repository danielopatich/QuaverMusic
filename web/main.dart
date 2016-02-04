// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
//import 'package:stagexl/stagexl.dart';

List<ButtonElement> buttons = new List();
CanvasElement dough = querySelector('dough');
Element doughBowl;
Element grid;
ButtonElement resetButton;

//Stage stage = new Stage(querySelector('#stage'));
//
//RenderLoop renderLoop = new RenderLoop();

//class Dough extends Sprite {
//  Dough(int width, int height) {
//    graphics.rect(0, 0, width, height);
//
//    // need resource manager ...? //
//    Dough<BitmapData> dough = BitmapData.load('./assets/dough-beat-1.png');
//    dough.then((BitmapData bitmapData) {
//
//      Bitmap bitmap = new Bitmap(bitmapData);
//      bitmap.scaleX = 0.5;
//      bitmap.scaleY = 0.5;
//      bitmap.x = 50;
//      bitmap.y = 30;
//      stage.addChild(bitmap);
//    });
//  }
//}

void main() {
  doughBowl = querySelector("#doughBowl");
  grid = querySelector('#grid');
  resetButton = querySelector("#resetButton");
  resetButton.onClick.listen(reset);
  produceDough();

//  var dough = new Dough(25, 25);
//  dough.x = 50;
//  dough.y = 50;
//  dough.addTo(stage);
//
//  bool lockCenter = true;
//
//  dough.onMouseDown.listen((me) => dough.startDrag(lockCenter));
//  dough.onMouseUp.listen((me) => dough.stopDrag());
}

void reset (Event e) {
  print('You reset the dough!');
  grid.children.clear();
  produceDough();
}

produceDough() {
  for (var i = 0; i < 8; i++) {
    buttons.add(new ButtonElement());
    buttons[i].classes.add("dough");
    buttons[i].onClick.listen(drag);
    doughBowl.children.add(buttons[i]);
  }
}

void drag(Event e) {
  Element dough = e.target;

  if (dough.parent == doughBowl) {
    grid.children.add(dough);
  } else {
    doughBowl.children.add(dough);
  }
}