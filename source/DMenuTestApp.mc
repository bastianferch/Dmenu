using Toybox.Application as App;
using Toybox.WatchUi as Ui;
using Toybox.System as Sys;

class DMenuTestApp extends App.AppBase {
  function initialize() {
    AppBase.initialize();
  }

  // onStart() is called on application start up
  function onStart(state) {}

  // onStop() is called when your application is exiting
  function onStop(state) {}

  //! Return the initial view of your application here
  function getInitialView() {
    var homeMenu = [
      new DMenuItem(:Displaydesign, "Displaydesign", null, null),
      new DMenuItem(:Uhren, "Uhren", null, null),
      new DMenuItem(:Protokoll, "Protokoll", null, null),
      new DMenuItem(:Aktivitaten, "Aktivitäten und Apps", null, null),
      new DMenuItem(:Darstellung, "Darstellung", null, null),
      new DMenuItem(:Benachrichtigungen, "Benachrichtigungen und Alarme", null, null),
    ];
    var view = new DMenu(homeMenu, "Home", 3);
    return [view, new DMenuDelegate(view, new HomeDelegate(view))];
  }
}
