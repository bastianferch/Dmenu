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
    var transition = WatchUi.SLIDE_UP;

    if (item.id == :Displaydesign) {
      // TODO Dead end template
      var subMenu = [new DMenuItem(:Ende, "Ende", null, null)];
      var subView = new DMenu(subMenu, "Displaydesign", 0);
      WatchUi.pushView(subView, new DMenuDelegate(subView, new HomeDelegate(subView)), transition);
    }
    if (item.id == :Uhren) {
      var subMenu = [
        new DMenuItem(:Alarme, "Alarme", null, null),
        new DMenuItem(:Timer, "Timer", null, null),
        new DMenuItem(:Stoppuhr, "Stoppuhr", null, null),
        new DMenuItem(:AlternativeZeitzonen, "Alternative Zeitzonen", null, null),
      ];
      var subView = new DMenu(subMenu, "Uhren", 3);
      WatchUi.pushView(subView, new DMenuDelegate(subView, new HomeDelegate(subView)), transition);
    } else if (item.id == :Protokoll) {
      var subMenu = [
        new DMenuItem(:DieseWoche, "Diese Woche", null, null),
        new DMenuItem(:VorherigeWoche, "Vorherige Woche", null, null),
        new DMenuItem(:Rekorde, "Rekorde", null, null),
        new DMenuItem(:Gesamt, "Gesamt", null, null),
        new DMenuItem(:Optionen, "Optionen", null, null),
      ];
      var subView = new DMenu(subMenu, "Protokoll", 4);
      WatchUi.pushView(subView, new DMenuDelegate(subView, new HomeDelegate(subView)), transition);
    } else if (item.id == :DieseWoche) {
      var subMenu = [new DMenuItem(:Aktivitaet1, "Aktivität 1", null, null), new DMenuItem(:Aktivitaet2, "Aktivität 2", null, null)];
      var subView = new DMenu(subMenu, "Diese Woche", 2);
      WatchUi.pushView(subView, new DMenuDelegate(subView, new HomeDelegate(subView)), transition);
    } else if (item.id == :VorherigeWoche) {
      var subMenu = [new DMenuItem(:Woche1_1_7, "Woche 1.1.-7.1.", null, null), new DMenuItem(:Woche8_1_14, "Woche 8.1.-14.1.", null, null)];
      var subView = new DMenu(subMenu, "Vorherige Woche", 2);
      WatchUi.pushView(subView, new DMenuDelegate(subView, new HomeDelegate(subView)), transition);
    } else if (item.id == :Rekorde) {
      var subMenu = [
        new DMenuItem(:RekordeLaufen, "Rekorde Laufen", null, null),
        new DMenuItem(:RekordeRadfahren, "Rekorde Radfahren", null, null),
        new DMenuItem(:RekordeSchwimmen, "Rekorde Schwimmen", null, null),
        new DMenuItem(:Krafttraining, "Krafttraining", null, null),
      ];
      var subView = new DMenu(subMenu, "Rekorde", 4);
      WatchUi.pushView(subView, new DMenuDelegate(subView, new HomeDelegate(subView)), transition);
    } else if (item.id == :Gesamt) {
      var subMenu = [
        new DMenuItem(:HistoryLaufen, "History Laufen", null, null),
        new DMenuItem(:HistoryRadfahren, "History Radfahren", null, null),
        new DMenuItem(:HistorySchwimmen, "History Schwimmen", null, null),
      ];
      var subView = new DMenu(subMenu, "Gesamt", 3);
      WatchUi.pushView(subView, new DMenuDelegate(subView, new HomeDelegate(subView)), transition);
    } else if (item.id == :Optionen) {
      // TODO Dead end template
      var subMenu = [new DMenuItem(:Ende, "Ende", null, null)];
      var subView = new DMenu(subMenu, "Optionen", 0);
      WatchUi.pushView(subView, new DMenuDelegate(subView, new HomeDelegate(subView)), transition);
    } else if (item.id == :Alarme) {
      System.println("Alarme");
    } else {
      System.println("subMenu not set for " + item.stringify());
    }
  }
}
