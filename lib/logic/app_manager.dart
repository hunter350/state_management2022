import 'package:flutter/foundation.dart';

class AppManager with ChangeNotifier {
  //AppManager(this.locateFileService) {
   // locateFileService().loadFile('app.sav');
  //}
  //final FileService Function() locateFileService;

  int _count1 = 0;

  int get count1 => _count1;
  set count1(int count1) {
    _count1 = count1;
    notifyListeners();
  }

  int _count2 = 0;
  int get count2 => _count2;
  set count2(int count1) {
    _count2 = count1;
    notifyListeners();
  }
}
