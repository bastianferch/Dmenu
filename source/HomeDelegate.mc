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
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :Items5) {
      var subMenu = [
        new DMenuItem(:Test15, "Test 1", null),
        new DMenuItem(:Test25, "Test 2", null),
        new DMenuItem(:Test35, "Test 3", null),
        new DMenuItem(:Test45, "Test 4", null),
      ];
      var subview = new DMenu(subMenu, "Testfall?", 5, null);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (
      item.id == :Test13 ||
      item.id == :Test23 ||
      item.id == :Test33 ||
      item.id == :Test43 ||
      item.id == :Test15 ||
      item.id == :Test25 ||
      item.id == :Test35 ||
      item.id == :Test45
    ) {
      // branch for selecting which testcase
      // home menu
      var subMenu = [
        new DMenuItem(:Displaydesign, "Displaydesign", null),
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
      if (item.id == :Test13 || item.id == :Test15) {
        subview = new DMenu(subMenu, "Home", menuSize, 1);
      } else if (item.id == :Test23 || item.id == :Test25) {
        subview = new DMenu(subMenu, "Home", menuSize, 2);
      } else if (item.id == :Test33 || item.id == :Test35) {
        subview = new DMenu(subMenu, "Home", menuSize, 3);
      } else if (item.id == :Test43 || item.id == :Test45) {
        subview = new DMenu(subMenu, "Home", menuSize, 4);
      }
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :Displaydesign) {
      var subMenu = [
        new DMenuItem(:Display1, "Display 1", null),
        new DMenuItem(:Display2, "Display 2", null),
        new DMenuItem(:Display3, "Display 3", null),
        new DMenuItem(:DisplayNew, "Display hinzufügen", null),
      ];
      var subview = new DMenu(subMenu, "Displaydesign", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :Uhren) {
      var subMenu = [
        new DMenuItem(:Alarme, "Alarme", null),
        new DMenuItem(:Timer, "Timer", null),
        new DMenuItem(:Stoppuhr, "Stoppuhr", null), // Dead end
        new DMenuItem(:AlternativeZeitzonen, "Alternative Zeitzonen", null),
      ];
      var subview = new DMenu(subMenu, "Uhren", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :Alarme) {
      var subMenu = [
        new DMenuItem(:Alarm1, "Alarm 1", null),
        new DMenuItem(:Alarm2, "Alarm 2", null),
        new DMenuItem(:Alarm3, "Alarm 3", null),
        new DMenuItem(:AlarmNew, "Alarm hinzufügen", null),
      ];
      var subview = new DMenu(subMenu, "Alarme", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :Timer) {
      var subMenu = [
        new DMenuItem(:Timer1, "Timer 1", null),
        new DMenuItem(:Timer2, "Timer 2", null),
        new DMenuItem(:Timer3, "Timer 3", null),
        new DMenuItem(:TimerNew, "Timer hinzufügen", null),
      ];
      var subview = new DMenu(subMenu, "Timer", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :AlternativeZeitzonen) {
      var subMenu = [
        new DMenuItem(:Zeitzone1, "Zone 1", null),
        new DMenuItem(:Zeitzone2, "Zone 2", null),
        new DMenuItem(:Zeitzone3, "Zone 3", null),
        new DMenuItem(:ZeitzoneNew, "Zone hinzufügen", null),
      ];
      var subview = new DMenu(subMenu, "Zeitzonen", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :Protokoll) {
      var subMenu = [
        new DMenuItem(:DieseWoche, "Diese Woche", null),
        new DMenuItem(:VorherigeWochen, "Vorherige Wochen", null),
        new DMenuItem(:Rekorde, "Rekorde", null),
        new DMenuItem(:Gesamt, "Gesamt", null),
        new DMenuItem(:ProtokollOptionen, "Optionen", null),
      ];
      var subview = new DMenu(subMenu, "Protokoll", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :DieseWoche) {
      var subMenu = [
        new DMenuItem(:Aktivitaet1, "Aktivität 1", null),
        new DMenuItem(:Aktivitaet2, "Aktivität 2", null),
        new DMenuItem(:Aktivitaet3, "Aktivität 3", null),
        new DMenuItem(:AktivitaetNew, "AKtivität hinzufügen", null),
      ];
      var subview = new DMenu(subMenu, "Diese Woche", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :VorherigeWoche) {
      var subMenu = [
        new DMenuItem(:Woche1_1_7, "Woche 1.1.-7.1.", null),
        new DMenuItem(:Woche8_1_14, "Woche 8.1.-14.1.", null),
        new DMenuItem(:Woche15_1_22, "Woche 15.1.-22.1.", null),
      ];
      var subview = new DMenu(subMenu, "Vorherige Wochen", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :Rekorde) {
      var subMenu = [
        new DMenuItem(:RekordeLaufen, "Laufen", null),
        new DMenuItem(:RekordeRadfahren, "Radfahren", null),
        new DMenuItem(:RekordeSchwimmen, "Schwimmen", null),
        new DMenuItem(:RekordeKrafttraining, "Krafttraining", null), // Dead end
        new DMenuItem(:ProtokollOptionen, "Optionen", null),
      ];
      var subview = new DMenu(subMenu, "Rekorde", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :RekordeLaufen) {
      var subMenu = [
        new DMenuItem(:Laufen5km, "5km", null),
        new DMenuItem(:Laufen10km, "10km", null),
        new DMenuItem(:LaufenHalbmarathon, "Halbmarathon", null),
        new DMenuItem(:LaufenMarathon, "Marathon", null),
        new DMenuItem(:LaufenLaengsteStrecke, "längste Strecke", null),
        new DMenuItem(:LaufenAlleRekordeLoeschen, "alle Rekorde löschen", null),
      ];
      var subview = new DMenu(subMenu, "Rekorde Laufen", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :RekordeRadfahren) {
      var subMenu = [
        new DMenuItem(:Radfahren40km, "40km", null),
        new DMenuItem(:RadfahrenLaengsteTour, "längste Tour", null),
        new DMenuItem(:RadfahrenGroessterAnstieg, "größter Anstieg", null),
        new DMenuItem(:RadfahrenBesteWattLeistung, "beste Watt-Leistung", null),
        new DMenuItem(:RadfahrenAlleRekordeLoeschen, "alle Rekorde löschen", null),
      ];
      var subview = new DMenu(subMenu, "Rekorde Radfahren", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :RekordeSchwimmen) {
      var subMenu = [
        new DMenuItem(:Schwimmen100m, "100m", null),
        new DMenuItem(:Schwimmen400m, "400m", null),
        new DMenuItem(:Schwimmen750m, "750m", null),
        new DMenuItem(:Schwimmen1000m, "1000m", null),
        new DMenuItem(:Schwimmen1500m, "1500m", null),
        new DMenuItem(:SchwimmenLaengstesSchwimmen, "längstes Schwimmen", null),
        new DMenuItem(:SchwimmenAlleRekordeLoeschen, "alle Rekorde löschen", null),
      ];
      var subview = new DMenu(subMenu, "Rekorde Schwimmen", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :Gesamt) {
      var subMenu = [
        new DMenuItem(:HistoryLaufen, "History Laufen", null),
        new DMenuItem(:HistoryRadfahren, "History Radfahren", null),
        new DMenuItem(:HistorySchwimmen, "History Schwimmen", null),
      ];
      var subview = new DMenu(subMenu, "Gesamt", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :HistoryLaufen) {
      var subMenu = [
        // Dead end
        new DMenuItem(:LaufenWoche, "Laufen wöchentlich", null),
        new DMenuItem(:LaufenMonat, "Laufen monatlich", null),
      ];
      var subview = new DMenu(subMenu, "History Laufen", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :HistoryRadfahren) {
      var subMenu = [
        // Dead end
        new DMenuItem(:RadfahrenWoche, "Radfahren wöchentlich", null),
        new DMenuItem(:RadfahrenMonat, "Radfahren monatlich", null),
      ];
      var subview = new DMenu(subMenu, "History Radfahren", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :HistorySchwimmen) {
      var subMenu = [
        // Dead end
        new DMenuItem(:SchwimmenWoche, "Schwimmen wöchentlich", null),
        new DMenuItem(:SchwimmenMonat, "Schwimmen monatlich", null),
      ];
      var subview = new DMenu(subMenu, "History Schwimmen", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :Optionen) {
      var subMenu = [
        // Dead end
        new DMenuItem(:AlleAktivitaetenLoeschen, "Alle Aktivitäten löschen?", null),
        new DMenuItem(:GesamtwerteZuruecksetzen, "Gesamtwerte zurücksetzen", null),
      ];
      var subview = new DMenu(subMenu, "Optionen", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :AktivitaetenUndApps) {
      var subMenu = [
        new DMenuItem(:DetailsAktivitaet1, "Aktivität 1", null),
        new DMenuItem(:DetailsAktivitaet2, "Aktivität 2", null),
        new DMenuItem(:DetailsAktivitaet3, "Aktivität 3", null),
        new DMenuItem(:AktivitaetHinzufuegen, "Aktivität hinzufügen", null), // Dead end
      ];
      var subview = new DMenu(subMenu, "Aktivitäten und Apps", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :DetailsAktivitaet1) {
      var subMenu = [
        // Dead end
        new DMenuItem(:Aktivitaet1Einstellungen, "Aktivität 1-Einstellungen", null),
        new DMenuItem(:A1AusFavoritenEntfernen, "A1 Aus Favoriten entfernen", null),
        new DMenuItem(:A1AktivitaetKopieren, "A1 Aktivität kopieren", null),
        new DMenuItem(:A1AktivitaetNeuAnordnen, "A1 Aktivität Neu anordnen", null),
        new DMenuItem(:A1AusListeEntfernen, "A1 Aus Liste entfernen", null),
      ];
      var subview = new DMenu(subMenu, "Aktivität 1", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :DetailsAktivitaet2) {
      var subMenu = [
        // Dead end
        new DMenuItem(:A2Einstellungen, "Einstellungen", null),
        new DMenuItem(:A2AusFavoritenEntfernen, "Aus Favoriten entfernen", null),
        new DMenuItem(:A2AktivitaetKopieren, "Aktivität kopieren", null),
        new DMenuItem(:A2AktivitaetNeuAnordnen, "Neu anordnen", null),
        new DMenuItem(:A2AusListeEntfernen, "Aus Liste entfernen", null),
      ];
      var subview = new DMenu(subMenu, "Aktivität 2", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :DetailsAktivitaet3) {
      var subMenu = [
        // Dead end
        new DMenuItem(:A3Einstellungen, "Einstellungen", null),
        new DMenuItem(:A3AusFavoritenEntfernen, "Aus Favoriten entfernen", null),
        new DMenuItem(:A3AktivitaetKopieren, "Aktivität kopieren", null),
        new DMenuItem(:A3AktivitaetNeuAnordnen, "Aktivität Neu anordnen", null),
        new DMenuItem(:A3AusListeEntfernen, "Aus Liste entfernen", null),
      ];
      var subview = new DMenu(subMenu, "Aktivität 3", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :Darstellung) {
      var subMenu = [
        new DMenuItem(:UebersichtenBearbeiten, "Übersichten bearbeiten", null),
        new DMenuItem(:SteuerungenBearbeiten, "Steuerungen bearbeiten", null),
        new DMenuItem(:Morgenbericht, "Morgenbericht", null),
      ];
      var subview = new DMenu(subMenu, "Darstellung", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :UebersichtenBearbeiten) {
      var subMenu = [
        new DMenuItem(:Uebersicht1Verschieben, "Übersicht 1 verschieben", null),
        new DMenuItem(:Uebersicht2Verschieben, "Übersicht 2 verschieben", null),
        new DMenuItem(:Uebersicht3Verschieben, "Übersicht 3 verschieben", null),
      ];
      var subview = new DMenu(subMenu, "Übersichten bearbeiten", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :SteuerungenBearbeiten) {
      var subMenu = [
        new DMenuItem(:Steuerung1, "Steuerung 1", null),
        new DMenuItem(:Steuerung2, "Steuerung 2", null),
        new DMenuItem(:Steuerung3, "Steuerung 3", null),
      ];
      var subview = new DMenu(subMenu, "Steuerungen bearbeiten", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :Morgenbericht) {
      var subMenu = [
        new DMenuItem(:BerichtAnzeigen, "Bericht anzeigen", null),
        new DMenuItem(:BerichtBearbeiten, "Bericht bearbeiten", null),
        new DMenuItem(:DeinName, "Dein Name", null),
      ];
      var subview = new DMenu(subMenu, "Morgenbericht", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :Benachrichtigungen) {
      var subMenu = [
        new DMenuItem(:SmartNotifications, "Smart Notifications", null), //
        new DMenuItem(:Systemalarme, "Systemalarme", null),
      ];
      var subview = new DMenu(subMenu, "Benachrichtigungen und Alarme", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :SmartNotifications) {
      var subMenu = [
        new DMenuItem(:WährendDerAktivität, "Während der Aktivität", null),
        new DMenuItem(:AllgemeineNutzung, "Allgemeine Nutzung", null),
        new DMenuItem(:Signatur, "Signatur", null),
      ];
      var subview = new DMenu(subMenu, "Smart Notifications", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :Systemalarme) {
      var subMenu = [
        new DMenuItem(:SystemalarmeAlarme, "Systemalarme Alarme", null),
        new DMenuItem(:SystemalarmeBarometer, "Systemalarme Barometer", null),
        new DMenuItem(:SystemalarmeTelefon, "Systemalarme Telefon", null),
        new DMenuItem(:SystemalarmeFitness, "Systemalarme Fitness", null),
        new DMenuItem(:SystemalarmeAlarmeFürAbnormaleHF, "Systemalarme Alarme für abnormale HF", null),
      ];
      var subview = new DMenu(subMenu, "Systemalarme", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :SystemalarmeBarometer) {
      var subMenu = [
        new DMenuItem(:Unwetterwarnung, "Unwetterwarnung", null), //
      ];
      var subview = new DMenu(subMenu, "Systemalarme Barometer", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :SensorenUndZubehör) {
      var subMenu = [
        new DMenuItem(:AutoErkennung, "Auto-Erkennung", null),
        new DMenuItem(:SensorenNeuHinzufügen, "Sensoren Neu hinzufügen", null),
        new DMenuItem(:Sensor1, "Sensor 1", null),
        new DMenuItem(:Sensor2, "Sensor 2", null),
        new DMenuItem(:Sensor3, "Sensor 3", null),
        new DMenuItem(:SensorenKompass, "Sensoren Kompass", null),
        new DMenuItem(:SensorenHöhenmesser, "Sensoren Höhenmesser", null),
        new DMenuItem(:SensorenBarometer, "Sensoren Barometer", null),
        new DMenuItem(:SensorenGolfsensoren, "Sensoren Golfsensoren", null),
      ];
      var subview = new DMenu(subMenu, "Sensoren und Zubehör", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :SensorenKompass) {
      var subMenu = [
        new DMenuItem(:KompassKalibrieren, "Kompass Kalibrieren", null),
        new DMenuItem(:KompassAnzeige, "Kompass Anzeige", null),
        new DMenuItem(:KompassNordreferenz, "Kompass Nordreferenz", null),
        new DMenuItem(:KompassModus, "Kompass Modus", null),
      ];
      var subview = new DMenu(subMenu, "Sensoren Kompass", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :SensorenHöhenmesser) {
      var subMenu = [
        new DMenuItem(:HöhenmesserKalibrieren, "Höhenmesser Kalibrieren", null),
        new DMenuItem(:HöhenmesserAutoKalibrierung, "Höhenmesser Auto-Kalibrierung", null),
        new DMenuItem(:HöhenmesserSensormodus, "Höhenmesser Sensormodus", null),
        new DMenuItem(:HöhenmesserHöhe, "Höhenmesser Höhe", null),
      ];
      var subview = new DMenu(subMenu, "Sensoren Höhenmesser", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :SensorenBarometer) {
      var subMenu = [
        new DMenuItem(:BarometerKalibrieren, "Barometer Kalibrieren", null),
        new DMenuItem(:BarometerProfil, "Barometer Profil", null),
        new DMenuItem(:BarometerUnwetterwarnung, "Barometer Unwetterwarnung", null),
        new DMenuItem(:BarometerSensormodus, "Barometer Sensormodus", null),
        new DMenuItem(:BarometerDruck, "Barometer Druck", null),
      ];
      var subview = new DMenu(subMenu, "Sensoren Barometer", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :SensorenGolfsensoren) {
      var subMenu = [
        new DMenuItem(:GolfsensorenNeuHinzufügen, "Golfsensoren Neu hinzufügen", null), //
      ];
      var subview = new DMenu(subMenu, "Sensoren Golfsensoren", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :Musik) {
      var subMenu = [
        new DMenuItem(:Musikanbieter, "Musikanbieter", null), //
        new DMenuItem(:Kopfhörer, "Kopfhörer", null),
        new DMenuItem(:Audio, "Audio", null),
      ];
      var subview = new DMenu(subMenu, "Musik", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :Musikanbieter) {
      var subMenu = [
        new DMenuItem(:MeineMusik, "Meine Musik", null),
        new DMenuItem(:TelefonSteuern, "Telefon steuern", null),
        new DMenuItem(:MusikappsHinzufügen, "Musikapps hinzufügen", null),
      ];
      var subview = new DMenu(subMenu, "Musikanbieter", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :Kopfhörer) {
      var subMenu = [
        new DMenuItem(:KopfhörerNeuHinzufügen, "Kopfhörer Neu hinzufügen", null), //
      ];
      var subview = new DMenu(subMenu, "Kopfhörer", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :Konnektivität) {
      var subMenu = [
        new DMenuItem(:Telefon, "Telefon", null), //
        new DMenuItem(:WLAN, "WLAN", null),
      ];
      var subview = new DMenu(subMenu, "Konnektivität", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :Ansagen) {
      var subMenu = [
        new DMenuItem(:Rundenalarm, "Rundenalarm", null),
        new DMenuItem(:PaceGeschwindigkeitsalarm, "Pace/Geschwindigkeitsalarm", null),
        new DMenuItem(:HFAlarm, "HF-Alarm", null),
        new DMenuItem(:Leistungsalarm, "Leistungsalarm", null),
        new DMenuItem(:TimerEreignisse, "Timer-Ereignisse", null),
        new DMenuItem(:Trainingsalarme, "Trainingsalarme", null),
        new DMenuItem(:Aktivitätsalarme, "Aktivitätsalarme", null),
        new DMenuItem(:Audiosignale, "Audiosignale", null),
        new DMenuItem(:Dialekt, "Dialekt", null),
      ];
      var subview = new DMenu(subMenu, "Ansagen", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :PaceGeschwindigkeitsalarm) {
      var subMenu = [
        new DMenuItem(:PaceGeschwindigkeitsalarmStatus, "Status", null),
        new DMenuItem(:PaceGeschwindigkeitsalarmAlarmtyp, "Alarmtyp", null),
        new DMenuItem(:PaceGeschwindigkeitsalarmAlarmfrequenz, "Alarmfrequenz", null),
      ];
      var subview = new DMenu(subMenu, "Pace/Geschwindigkeitsalarm", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :HFAlarm) {
      var subMenu = [
        new DMenuItem(:HFAlarmStatus, "Status", null),
        new DMenuItem(:HFAlarmAlarmtyp, "Alarmtyp", null),
        new DMenuItem(:HFAlarmAlarmfrequenz, "Alarmfrequenz", null),
      ];
      var subview = new DMenu(subMenu, "HF-Alarm", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :Leistungsalarm) {
      var subMenu = [
        new DMenuItem(:LeistungsalarmStatus, "Status", null),
        new DMenuItem(:LeistungsalarmAlarmtyp, "Alarmtyp", null),
        new DMenuItem(:LeistungsalarmAlarmfrequenz, "Alarmfrequenz", null),
      ];
      var subview = new DMenu(subMenu, "Leistungsalarm", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :Benutzerprofil) {
      var subMenu = [
        new DMenuItem(:Fitnessalter, "Fitnessalter", null),
        new DMenuItem(:Geschlecht, "Geschlecht", null),
        new DMenuItem(:Geburtsjahr, "Geburtsjahr", null),
        new DMenuItem(:Größe, "Größe", null),
        new DMenuItem(:Gewicht, "Gewicht", null),
        new DMenuItem(:Handgelenkt, "Handgelenkt", null),
        new DMenuItem(:HerzfrequenzUndLeistungsbereiche, "Herzfrequenz- und Leistungsbereiche", null),
        new DMenuItem(:CriticalSwimSpeed, "Critical Swim Speed", null),
      ];
      var subview = new DMenu(subMenu, "Benutzerprofil", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :SicherheitUndTracking) {
      var subMenu = [
        new DMenuItem(:LiveTrack, "LiveTrack", null),
        new DMenuItem(:UnfallBenachrichtigung, "Unfall-Benachrichtigung", null),
        new DMenuItem(:Hilfe, "Hilfe", null),
        new DMenuItem(:Notfallkontakte, "Notfallkontakte", null),
      ];
      var subview = new DMenu(subMenu, "Sicherheit und Tracking", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :EinstellungenFitness) {
      var subMenu = [
        new DMenuItem(:HerzfrequenzAmHandgelenk, "Herzfrequenz am Handgelenk", null),
        new DMenuItem(:Pulsoximeter, "Pulsoximeter", null),
        new DMenuItem(:FitnessInaktivitaetsalarm, "Inaktivitätsalarm", null),
        new DMenuItem(:FitnessZielalarme, "Zielalarme", null),
        new DMenuItem(:MoveIQ, "Move IQ", null),
      ];
      var subview = new DMenu(subMenu, "Fitness", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :HerzfrequenzHandgelenk) {
      var subMenu = [
        new DMenuItem(:HerzfrequenzStatus, "Herzfrequenz am Handgelenk Status", null),
        new DMenuItem(:BeimSchwimmen, "Beim Schwimmen", null),
        new DMenuItem(:AlarmeAbnormaleHF, "Alarme für abnormale HF", null),
        new DMenuItem(:HerzfrequenzSenden, "Herzfrequenz senden", null),
      ];
      var subview = new DMenu(subMenu, "Herzfrequenz am Handgelenk", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } // Add the following code inside the HomeDelegate class, in the onMenuItem function
    else if (item.id == :Karte) {
      var subMenu = [
        new DMenuItem(:Kartenmanager, "Kartenmanager", null),
        new DMenuItem(:Kartendesign, "Kartendesign", null),
        new DMenuItem(:Ausrichtung, "Ausrichtung", null),
        new DMenuItem(:Benutzerpositionen, "Benutzerpositionen", null),
        new DMenuItem(:AutoZoom, "Auto-Zoom", null),
        new DMenuItem(:AufStrasseZeigen, "Auf Straße zeigen", null),
        new DMenuItem(:Trackaufzeichnung, "Trackaufzeichnung", null),
        new DMenuItem(:Trackfarbe, "Trackfarbe", null),
        new DMenuItem(:Detailgrad, "Detailgrad", null),
        new DMenuItem(:PlastischeKarte, "Plastische Karte", null),
        new DMenuItem(:Marine, "Marine", null),
        new DMenuItem(:SegmenteZeichnen, "Segmente zeichnen", null),
        new DMenuItem(:HöhenlinieZeichnen, "Höhenlinie zeichnen", null),
        new DMenuItem(:DesignWiederherstellen, "Design wiederherstellen", null),
      ];
      var subview = new DMenu(subMenu, "Karte", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :Kartenmanager) {
      var subMenu = [
        new DMenuItem(:TopoActiveKarten, "TopoActive-Karten", null),
        new DMenuItem(:KartenmanagerKarte1, "Karte 1", null),
        new DMenuItem(:KartenmanagerKarte2, "Karte 2", null),
        new DMenuItem(:KartenmanagerKarte3, "Karte 3", null),
      ];
      var subview = new DMenu(subMenu, "Kartenmanager", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :Navigation) {
      var subMenu = [
        new DMenuItem(:Datenseiten, "Datenseiten", null),
        new DMenuItem(:Richtungsanzeige, "Richtungsanzeige", null),
        new DMenuItem(:NavigationAlarme, "Navigation Alarme", null),
      ];
      var subview = new DMenu(subMenu, "Navigation", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :Datenseiten) {
      var subMenu = [
        new DMenuItem(:DatenseitenKarte, "Datenseiten Karte", null),
        new DMenuItem(:POIEntlangRoute, "POI entlang Route", null),
        new DMenuItem(:Kompass, "Kompass", null),
        new DMenuItem(:Höhenprofil, "Höhenprofil", null),
        new DMenuItem(:DatenseitenSeite1, "Datenseiten Seite 1", null),
        new DMenuItem(:DatenseitenSeite2, "Datenseiten Seite 2", null),
        new DMenuItem(:DatenseitenSeite3, "Datenseiten Seite 3", null),
      ];
      var subview = new DMenu(subMenu, "Datenseiten", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :NavigationAlarme) {
      var subMenu = [
        new DMenuItem(:DistanzZumEndgültigenZiel, "Distanz zum endgültigen Ziel", null),
        new DMenuItem(:ZielZeit, "Ziel: Zeit", null),
        new DMenuItem(:Streckenabw, "Streckenabw.", null),
        new DMenuItem(:Abbiegehinweise, "Abbiegehinweise", null),
      ];
      var subview = new DMenu(subMenu, "Alarme", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :PowerManager) {
      var subMenu = [
        new DMenuItem(:Energiesparmodus, "Energiesparmodus", null),
        new DMenuItem(:AkkulaufzeitInProzent, "Akku Laufzeit in %", null),
        new DMenuItem(:ErweiterteAkkulaufzeit, "Erw. Akkulaufzeit", null),
      ];
      var subview = new DMenu(subMenu, "Power Manager", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :Energiesparmodus) {
      var subMenu = [
        new DMenuItem(:EnergiesparmodusStatus, "Energiesparmodus Status", null), //
        new DMenuItem(:Bearbeiten, "Bearbeiten", null),
      ];
      var subview = new DMenu(subMenu, "Energiesparmodus", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :Bearbeiten) {
      var subMenu = [
        new DMenuItem(:BearbeitenDisplaydesign, "Displaydesign", null),
        new DMenuItem(:BearbeitenMusik, "Musik", null),
        new DMenuItem(:BearbeitenTelefon, "Telefon", null),
        new DMenuItem(:BearbeitenWLAN, "WLAN", null),
        new DMenuItem(:BearbeitenHFamHandgelenk, "HF am Handgelenk", null),
        new DMenuItem(:BearbeitenPulsoximeter, "Pulsoximeter", null),
        new DMenuItem(:BearbeitenBeleuchtung, "Beleuchtung", null),
      ];
      var subview = new DMenu(subMenu, "Bearbeiten", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :System) {
      var subMenu = [
        new DMenuItem(:Sprache, "Sprache", null),
        new DMenuItem(:Zeit, "Zeit", null),
        new DMenuItem(:Beleuchtung, "Beleuchtung", null),
        new DMenuItem(:Touchscreen, "Touchscreen", null),
        new DMenuItem(:TonUndVibration, "Ton und Vibration", null),
        new DMenuItem(:Schlafmodus, "Schlafmodus", null),
        new DMenuItem(:DND, "DND", null),
        new DMenuItem(:Hotkeys, "Hotkeys", null),
        new DMenuItem(:AutoSperre, "Auto-Sperre", null),
        new DMenuItem(:Format, "Format", null),
        new DMenuItem(:Leistungzustand, "Leistungzustand", null),
        new DMenuItem(:Datenaufzeichnung, "Datenaufzeichnung", null),
        new DMenuItem(:USBModus, "USB-Modus", null),
        new DMenuItem(:Reset, "Reset", null),
        new DMenuItem(:SoftwareUpdate, "Software-Update", null),
        new DMenuItem(:Info, "Info", null),
      ];
      var subview = new DMenu(subMenu, "System", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :Zeit) {
      var subMenu = [
        new DMenuItem(:Zeitformat, "Zeitformat", null),
        new DMenuItem(:Datumsformat, "Datumsformat", null),
        new DMenuItem(:UhrzeitEinstellen, "Uhrzeit einstellen", null),
        new DMenuItem(:ZeitAlarme, "Alarme", null),
        new DMenuItem(:GPSsynchronisieren, "Über GPS synchronisieren", null),
      ];
      var subview = new DMenu(subMenu, "Zeit", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :Beleuchtung) {
      var subMenu = [
        new DMenuItem(:BeleuchtungAktivität, "Während der Aktivität", null),
        new DMenuItem(:BeleuchtungNutzung, "Allgemeine Nutzung", null),
        new DMenuItem(:BeimSchlafen, "Beim Schlafen", null),
      ];
      var subview = new DMenu(subMenu, "Beleuchtung", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :Touchscreen) {
      var subMenu = [
        new DMenuItem(:TouchscreenAktivität, "Während der Aktivität", null), //
        new DMenuItem(:TouchscreenNutzung, "Allg. Nutzung", null),
      ];
      var subview = new DMenu(subMenu, "Touchscreen", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :TonUndVibration) {
      var subMenu = [
        new DMenuItem(:TonWarntöne, "Ton Warntöne", null),
        new DMenuItem(:Alarmvibration, "Alarmvibration", null),
        new DMenuItem(:Tastentöne, "Tastentöne", null),
        new DMenuItem(:Tastenvibration, "Tastenvibration", null),
      ];
      var subview = new DMenu(subMenu, "Ton und Vibration", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :Schlafmodus) {
      var subMenu = [
        new DMenuItem(:Plan, "Plan", null),
        new DMenuItem(:SchlafmodusDisplaydesign, "Displaydesign", null),
        new DMenuItem(:SchlafmodusBeleuchtung, "Beleuchtung", null),
        new DMenuItem(:SchlafmodusDND, "DND", null),
      ];
      var subview = new DMenu(subMenu, "Schlafmodus", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :DND) {
      var subMenu = [
        new DMenuItem(:DNDStatus, "Status", null),
        new DMenuItem(:DNDSchlafen, "Beim Schlafen", null),
        new DMenuItem(:DNDBearbeiten, "Bearbeiten", null),
      ];
      var subview = new DMenu(subMenu, "DND", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :Hotkeys) {
      var subMenu = [
        new DMenuItem(:Hotkey1, "Hotkey 1", null), //
        new DMenuItem(:Hotkey2, "Hotkey 2", null),
        new DMenuItem(:Hotkey3, "Hotkey 3", null),
      ];
      var subview = new DMenu(subMenu, "Hotkeys", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :AutoSperre) {
      var subMenu = [
        new DMenuItem(:SperreAus, "Aus", null),
        new DMenuItem(:SperreImmer, "Immer", null),
        new DMenuItem(:SperreWährendDerAktivität, "Während der Aktivität", null),
        new DMenuItem(:SperreNichtWährendDerAktivität, "Nicht während der Aktivität", null),
      ];
      var subview = new DMenu(subMenu, "Auto-Sperre", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :Format) {
      var subMenu = [
        new DMenuItem(:Einheiten, "Einheiten", null),
        new DMenuItem(:PräferenzFürPace, "Präferenz für Pace/Geschwindigkeit", null),
        new DMenuItem(:Wochenanfang, "Wochenanfang", null),
        new DMenuItem(:Positionsformat, "Positionsformat", null),
      ];
      var subview = new DMenu(subMenu, "Format", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :Datenaufzeichnung) {
      var subMenu = [
        new DMenuItem(:Frequenz, "Frequenz", null), //
        new DMenuItem(:HFVSpeichern, "HFV speichern", null),
      ];
      var subview = new DMenu(subMenu, "Datenaufzeichnung", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :USBModus) {
      var subMenu = [
        new DMenuItem(:Garmin, "Garmin", null), //
        new DMenuItem(:MTP, "MTP", null),
      ];
      var subview = new DMenu(subMenu, "USB-Modus", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :Reset) {
      var subMenu = [
        new DMenuItem(:WerkstandardWiederherstellen, "Werksstandard wiederherstellen", null),
        new DMenuItem(:AlleAktivitätenLöschen, "Alle Aktivitäten löschen?", null),
        new DMenuItem(:GesamtwerteZurücksetzen, "Gesamtwerte zurücksetzen", null),
        new DMenuItem(:DatenLöschenUndEinstellungenZurücksetzen, "Daten lösch. u. Einst. zurücksetzen", null),
      ];
      var subview = new DMenu(subMenu, "Reset", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else if (item.id == :SoftwareUpdate) {
      var subMenu = [
        new DMenuItem(:AutomatischesUpdate, "Aut. Update", null), //
        new DMenuItem(:NachUpdatesSuchen, "Nach Updates suchen", null),
      ];
      var subview = new DMenu(subMenu, "Software-Update", menuSize, testCase);
      WatchUi.pushView(subview, new DMenuDelegate(subview, new HomeDelegate(subview)), transition);
    } else {
      System.println("subMenu not set for " + item.stringify());
      WatchUi.pushView(new SmipleTextView("Nicht das richtige \n Ende erreicht. \n Gehe zurück um \nfortzufahren."), null, transition);
    }
  }
}
