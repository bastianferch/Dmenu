using Toybox.Graphics;
using Toybox.WatchUi;

class SmipleTextView extends WatchUi.View {
  hidden var myText;
  var message;

  function initialize(_message) {
    message = _message;
    View.initialize();
  }

  function onShow() {
    myText = new WatchUi.Text({
      :text => message,
      :color => Graphics.COLOR_WHITE,
      :font => Graphics.FONT_SMALL,
      :locX => WatchUi.LAYOUT_HALIGN_CENTER,
      :locY => WatchUi.LAYOUT_VALIGN_CENTER,
    });
  }

  function onUpdate(dc) {
    dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
    dc.clear();
    myText.draw(dc);
  }
}
