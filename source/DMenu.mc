using Toybox.WatchUi as Ui;
using Toybox.System as Sys;
using Toybox.Graphics as Gfx;

var menuSize;
var testCase;

// Inherit from this if you want to store additional information in the menu entry and/or change how
// the menu is drawn - for example adding in a status icon.
// Any overridden drawing should be constrained within the items boundaries, i.e. y .. y + height / menuSize.
class DMenuItem {
  const LABEL_FONT = Gfx.FONT_TINY;
  const SELECTED_LABEL_FONT = Gfx.FONT_TINY;
  const VALUE_FONT = Gfx.FONT_TINY;
  const PAD = 0;

  var id, label, value;
  var index; // filled in with its index, if selected

  // _id 		  is typically a symbol but can be anything and is just used in menu delegate to identify
  //            which item has been selected.
  // _label	  the text to show as the item name.  Can be any object responding to toString ().
  // _value     the text to show when the item is in the selectable position.  Use null for no text
  //			  otherwise any object responding to toString () can be used.
  function initialize(_id, _label, _value) {
    id = _id;
    label = _label;
    value = _value;
  }

  function stringify() {
    return "DMenuItem{id:" + id + ", label:" + label + ", value:" + value + "}";
  }

  function draw(dc, y, highlight) {
    if (highlight) {
      setHighlightColor(dc);
      drawHighlightedLabel(dc, y);
    } else {
      setColor(dc);
      drawLabel(dc, y);
    }
  }

  function setHighlightColor(dc) {
    dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_WHITE);
  }

  function setColor(dc) {
    dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_WHITE);
  }

  function drawLabel(dc, y) {
    var width = dc.getWidth();
    var h_entry = dc.getHeight() / menuSize;
    var lab = label.toString();
    var labDims = dc.getTextDimensions(lab, LABEL_FONT);
    var yL = y + (h_entry - labDims[1]) / 2;

    dc.drawText(width / 2, yL, LABEL_FONT, lab, Gfx.TEXT_JUSTIFY_CENTER);
  }

  function drawHighlightedLabel(dc, y) {
    var width = dc.getWidth();
    var h_entry = dc.getHeight() / menuSize;
    var lab = label.toString();
    var labDims = dc.getTextDimensions(lab, SELECTED_LABEL_FONT);
    var yL, yV, h;

    if (labDims[0] > width) {
      // show too long label
      // System.println(labDims + " " + lab); // DEBUG
      var pos;
      for (var i = 0; dc.getTextWidthInPixels(lab.substring(0, i), SELECTED_LABEL_FONT) < width; i++) {
        pos = i.toNumber();
      }
      h = labDims[1] * 2 + PAD;
      yL = y + (h_entry - h) / 2;
      yV = yL + labDims[1] + PAD;
      // System.println(lab.substring(pos - 1, lab.length()).toString() + " " + Gfx.TEXT_JUSTIFY_CENTER); // DEBUG
      dc.drawText(width / 2, yV, SELECTED_LABEL_FONT, lab.substring(pos - 1, lab.length()).toString(), Gfx.TEXT_JUSTIFY_CENTER);
      lab = lab.substring(0, pos - 1) + "-";
    } else if (value != null) {
      // Show label and value.
      var val = value.toString();
      var valDims = dc.getTextDimensions(val, VALUE_FONT);

      h = labDims[1] + valDims[1] + PAD;
      yL = y + (h_entry - h) / 2;
      yV = yL + labDims[1] + PAD;
      dc.drawText(width / 2, yV, VALUE_FONT, val, Gfx.TEXT_JUSTIFY_CENTER);
    } else {
      yL = y + (h_entry - labDims[1]) / 2;
    }
    dc.drawText(width / 2, yL, SELECTED_LABEL_FONT, lab, Gfx.TEXT_JUSTIFY_CENTER);
  }
}

class DMenu extends Ui.View {
  var itemArray;
  var title;
  var index;

  var nextIndex;
  hidden var drawMenu;

  var menuHeight = null;
  function initialize(_itemArray, _menuTitle, _menuSize, _testCase) {
    System.println("menu size: " + _menuSize + ", testCase: " + _testCase);
    itemArray = _itemArray;
    title = _menuTitle;
    menuSize = _menuSize;
    testCase = _testCase;

    if (itemArray.size() > 2 && menuSize > 3) {
      index = 1;
      nextIndex = 1;
    } else {
      index = 0;
      nextIndex = 0;
    }

    View.initialize();
  }

  function onShow() {
    drawMenu = new DrawMenu();
  }

  function onHide() {
    drawMenu = null;
  }

  // Return the menuItem with the matching id.  The menu item has its index field updated
  // with the index it was found at.  Returns null if not found.
  function itemWithId(id) {
    for (var idx = 0; idx < itemArray.size(); idx++) {
      if (itemArray[idx].id == id) {
        itemArray[idx].index = idx;
        return itemArray[idx];
      }
    }
    return null;
  }

  function animateComplete() {
    drawMenu.t = 0;
    WatchUi.requestUpdate();
  }

  const ANIM_TIME = 0.2; // 0 disable animation, values between 0.1 and 0.5 look okay
  function updateIndex(offset) {
    if (itemArray.size() <= 1) {
      return;
    }

    if (offset == 1) {
      // Scroll down. Use 1000 as end value as cannot use 1. Scale as necessary in draw call.
      if (ANIM_TIME > 0) {
        Ui.animate(drawMenu, :t, Ui.ANIM_TYPE_LINEAR, 1000, 0, ANIM_TIME, method(:animateComplete));
      }
    } else {
      // Scroll up.
      if (ANIM_TIME > 0) {
        Ui.animate(drawMenu, :t, Ui.ANIM_TYPE_LINEAR, -1000, 0, ANIM_TIME, method(:animateComplete));
      }
    }

    nextIndex = index + offset;

    // Cope with a 'feature' in modulo operator not handling -ve numbers as desired.
    nextIndex = nextIndex < 0 ? itemArray.size() + nextIndex : nextIndex;

    nextIndex = nextIndex % itemArray.size();

    Ui.requestUpdate();
    index = nextIndex;
  }

  function selectedItem() {
    itemArray[index].index = index;
    System.println("selected item label: " + itemArray[index].label); // DEBUG
    return itemArray[index];
  }

  // Dc as device context
  function onUpdate(dc) {
    var width = dc.getWidth();
    var height = dc.getHeight();
    menuHeight = height;
    dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
    dc.fillRectangle(0, 0, width, height);

    // Draw the menu items.
    if (drawMenu == null) {
      return;
    }

    drawMenu.index = index;
    drawMenu.nextIndex = nextIndex;
    drawMenu.menu = self;

    drawMenu.draw(dc);

    var pen_width = 2;

    // Draw the decorations(lines around the selected object)
    var h_entry = height / menuSize;
    // y for the middle of the items.
    var y = h_entry * ((menuSize - 1) / 2);
    dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_WHITE);
    dc.setPenWidth(pen_width);
    dc.drawLine(0, y - pen_width, width, y - pen_width);
    dc.drawLine(0, y + h_entry + pen_width, width, y + h_entry + pen_width);

    drawArrows(dc);
  }

  const GAP = 3;
  const TS = 3;

  // The arrows are drawn with lines as polygons don't give different sized triangles depending
  // on their orientation.
  function drawArrows(dc) {
    var x = dc.getWidth() / 2;
    var y;

    dc.setPenWidth(1);
    dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_WHITE);

    if (nextIndex != 0) {
      y = GAP;

      for (var i = 0; i < TS; i++) {
        dc.drawLine(x - i, y + i, x + i + 1, y + i);
      }
    }

    if (nextIndex != itemArray.size() - 1) {
      y = dc.getHeight() - TS - GAP;

      var d;
      for (var i = 0; i < TS; i++) {
        d = TS - 1 - i;
        dc.drawLine(x - d, y + i, x + d + 1, y + i);
      }
    }
  }
}

// Done as a class so it can be animated.
class DrawMenu extends Ui.Drawable {
  const TITLE_FONT = Gfx.FONT_TINY;
  var t = 0; // 'time' in the animation cycle 0...1000 or -1000...0.
  var index, nextIndex, menu;

  function initialize() {
    Drawable.initialize({});
  }

  function draw(dc) {
    var width = dc.getWidth();
    var height = dc.getHeight();
    var h_entry = height / menuSize;
    var items = menu.itemArray.size();

    nextIndex = menu.nextIndex;

    // y for the middle of the items.
    var y = h_entry * ((menuSize - 1) / 2) + (t / 1000.0) * h_entry;

    // Depending on where we are in the menu and in the animation some of
    // these will be unnecessary but it is easier to draw everything and
    // rely on clipping to avoid unnecessary drawing calls.
    drawTitle(dc, y);
    for (var i = -2; i < menuSize; i++) {
      drawItem(dc, nextIndex + i, y + h_entry * i, i == 0);
    }
  }

  function drawTitle(dc, center) {
    var width = dc.getWidth();
    var h_entry = dc.getHeight() / menuSize;
    var y_title = center - (nextIndex + 1) * h_entry;
    System.println("label " + menu.selectedItem().label + " y_title: " + y_title); // DEBUG

    dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_WHITE);
    // Check if any of the title is visible.,
    if (y_title - 1 < - h_entry) {
      return;
    } else if(y_title <= 0 && menuSize > 3){
      dc.fillRectangle(0, 0, width, h_entry * Math.floor(menuSize / 2) - h_entry);
    } else {
    dc.fillRectangle(0, 0, width, h_entry * Math.floor(menuSize / 2)); // TODO fix this for other number of menu items
    }

    if (menu.title != null) {
      var dims = dc.getTextDimensions(menu.title, TITLE_FONT);
      var h = (h_entry - dims[1]) / 2;
      dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
      dc.drawText(width / 2, y_title + h, TITLE_FONT, menu.title, Gfx.TEXT_JUSTIFY_CENTER);
    }
  }

  // highlight is the selected menu item that can optionally show a value.
  function drawItem(dc, idx, y, highlight) {
    var h_entry = dc.getHeight() / menuSize;

    // Cannot see item if it doesn't exist or will not be visible.
    if (idx < 0 || idx >= menu.itemArray.size() || menu.itemArray[idx] == null || y > dc.getHeight() || y < -h_entry) {
      return;
    }

    menu.itemArray[idx].draw(dc, y, highlight);
  }
}

class DMenuDelegate extends Ui.BehaviorDelegate {
  hidden var menu;
  hidden var userMenuDelegate;

  function initialize(_menu, _userMenuInputDelegate) {
    menu = _menu;
    userMenuDelegate = _userMenuInputDelegate;
    BehaviorDelegate.initialize();
  }

  function onSwipe(swipeEvent) {
    var d = swipeEvent.getDirection();
    if (d == WatchUi.SWIPE_UP) {
      return onNextPage();
    }
    if (d == WatchUi.SWIPE_DOWN) {
      return onPreviousPage();
    }

    return false;
  }

  function onTap(clickEvent) {
    var c = clickEvent.getCoordinates();
    var t = clickEvent.getType();

    if (t == WatchUi.CLICK_TYPE_TAP) {
      if (menu.menuHeight != null) {
        var h_entry = menu.menuHeight / menuSize;
        var middleItemStart = h_entry * Math.floor(menuSize/2);
        if (c[1] > (middleItemStart + h_entry)) { 
          return onNextPage();
        } else if (c[1] < middleItemStart) {
          return onPreviousPage();
        }
      }

      userMenuDelegate.onMenuItem(menu.selectedItem(), menuSize, testCase);
      Ui.requestUpdate();
      return true;
    }
    return false;
  }

  function onNextPage() {
    menu.updateIndex(1);
    return true;
  }

  function onPreviousPage() {
    menu.updateIndex(-1);
    return true;
  }

  function onSelect() {
    return false;
  }

  function onKey(keyEvent) {
    var k = keyEvent.getKey();
    if (k == WatchUi.KEY_START || k == WatchUi.KEY_ENTER) {
      userMenuDelegate.onMenuItem(menu.selectedItem(), menuSize, testCase);
      Ui.requestUpdate();
      return true;
    }
    return false;
  }

  function onBack() {
    Ui.popView(Ui.SLIDE_RIGHT);
    return true;
  }
}
