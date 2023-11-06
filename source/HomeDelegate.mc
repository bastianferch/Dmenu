using Toybox.WatchUi as Ui;
using Toybox.System as Sys;
using Toybox.Math as Math;

class HomeDelegate extends Ui.MenuInputDelegate {
  var view, count;

  // view is only needed if you need to access the menu array directly or replace it.  Otherwise
  // the item passed to onMenu can be modified 'in place'.
  function initialize(_view) {
    view = _view;
    MenuInputDelegate.initialize();
    count = 0;
  }

  function onMenuItem(item) {
    if (item.id == :Uhren) {
      System.println("Uhren");
      var submenu = [
        new DMenuItem(:Alarme, "Alarme", null, null),
        new DMenuItem(:Timer, "Timer", null, null),
        new DMenuItem(:Stoppuhr, "Stoppuhr", null, null),
        new DMenuItem(:AlternativeZeitzonen, "Alternative Zeitzonen", null, null),
      ];
      var subView = new DMenu(submenu, "Uhren", 3);
      WatchUi.pushView(subView, new DMenuDelegate(subView, new HomeDelegate(subView)), WatchUi.SLIDE_UP);
    } else if (item.id == :Alarme) {
      System.println("Alarme");
    } else {
      System.println("submenu not set for " + item.stringify());
    }
  }
}
