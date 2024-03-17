using Toybox.WatchUi as Ui;
using Toybox.System as Sys;
using Toybox.Math as Math;

class HomeDelegate extends Ui.MenuInputDelegate {
  var view, count;
  var transition = WatchUi.SLIDE_UP;

  // view is only needed if you need to access the menu array directly or replace it.  Otherwise
  // the item passed to onMenu can be modified 'in place'.
  function initialize(_view) {
    view = _view;
    MenuInputDelegate.initialize();
    count = 0;
  }

  /**
  * This section is the main interactive part. It is structured the same way as the graph.dot file. 
  * All sections which are not needed for the user interaction test, are not created and handled by the else block.
  */
  function onMenuItem(item, menuSize, testCase) {

    if (item.id == :Items3) {
      var subMenu = [
        new DMenuItem(:Test13, "Test 1", null),
        new DMenuItem(:Test23, "Test 2", null),
        new DMenuItem(:Test33, "Test 3", null),
        new DMenuItem(:Test43, "Test 4", null),
      ];
      var subview = new DMenu(subMenu, "Testfall?", 3, null);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)),transition);
    } else if (item.id == :Items5) {
      var subMenu = [
        new DMenuItem(:Test15, "Test 1", null),
        new DMenuItem(:Test25, "Test 2", null),
        new DMenuItem(:Test35, "Test 3", null),
        new DMenuItem(:Test45, "Test 4", null),
      ];
      var subview = new DMenu(subMenu, "Testfall?", 5, null);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)),transition);
    } else if (item.id == :Test13 || item.id == :Test23 || item.id == :Test33 || item.id == :Test43 || item.id == :Test15 || item.id == :Test25 || item.id == :Test35 || item.id == :Test45){
      // branch for selecting which testcase
      // home menu
      var subMenu = [
        new DMenuItem(:Displaydesign, "Displaydesign",null),
        new DMenuItem(:Uhren, "Uhren", null),
        new DMenuItem(:Protokoll, "Protokoll", null),
        new DMenuItem(:Aktivitaten, "Aktivitäten und Apps", null),
        new DMenuItem(:Darstellung, "Darstellung", null),
        new DMenuItem(:Benachrichtigungen, "Benachrichtigungen und Alarme", null),
        new DMenuItem(:Sensoren, "Sensoren und Zubehör", null),
        new DMenuItem(:Musik, "Musik", null),
        new DMenuItem(:Konnektivitat, "Konnektivität", null),
        new DMenuItem(:Ansagen, "Ansagen", null),
        new DMenuItem(:Benutzerprofil, "Benutzerprofil", null),
        new DMenuItem(:Sicherheit, "Sicherheit und Tracking", null),
        new DMenuItem(:Fitness, "Fitness", null),
        new DMenuItem(:Karte, "Karte", null),
        new DMenuItem(:Navigation, "Navigation", null),
        new DMenuItem(:PowerManager, "Power Manager", null),
        new DMenuItem(:System, "System", null),
      ];
      var subview;
      // set test case
      if(item.id == :Test13 || item.id == :Test15){
        subview = new DMenu(subMenu, "Home", menuSize, 1);
      } else if(item.id == :Test23 || item.id == :Test25){
        subview = new DMenu(subMenu, "Home", menuSize, 2);
      } else if(item.id == :Test33 || item.id == :Test35){
        subview = new DMenu(subMenu, "Home", menuSize, 3);
      } else if(item.id == :Test43 || item.id == :Test45){
        subview = new DMenu(subMenu, "Home", menuSize, 4);
      }
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :Displaydesign){
      var subMenu = [
        new DMenuItem(:Design1, "Design 1", null),
        new DMenuItem(:Design2, "Design 2", null),
        new DMenuItem(:Design2, "Design 3", null),
        new DMenuItem(:DesignNew, "Design hinzufügen", null),
      ];
      var subview = new DMenu(subMenu, "Displaydesign", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :Uhren){ 
      var subMenu = [
        new DMenuItem(:Alarme, "Alarme", null),
        new DMenuItem(:Timer, "Timer", null),
        new DMenuItem(:Stoppuhr, "Stoppuhr", null),
        new DMenuItem(:AlternativeZeitzonen, "Alternative Zeitzonen", null),
      ];
      var subview = new DMenu(subMenu, "Uhren", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :Alarme){
      var subMenu = [
        new DMenuItem(:Alarm1, "Alarm 1", null),
        new DMenuItem(:Alarm2, "Alarm 2", null),
        new DMenuItem(:Alarm2, "Alarm 3", null),
        new DMenuItem(:AlarmNew, "Alarm hinzufügen", null),
      ];
      var subview = new DMenu(subMenu, "Alarme", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :Protokoll){
      var subMenu = [
        new DMenuItem(:Rekorde, "Rekorde", null),
      ];
      var subview = new DMenu(subMenu, "Home", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    }else {
      System.println("subMenu not set for " + item.stringify());
    }
  }
}
