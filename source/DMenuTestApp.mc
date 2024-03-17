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
      new DMenuItem(:Items3, "3 Items", null),
      new DMenuItem(:Items5, "5 Items", null),
    ];
    var view = new DMenu(homeMenu, "Items?", 5, null);
    return [view, new DMenuDelegate(view, new HomeDelegate(view))];
  }
}
