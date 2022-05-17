import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../logic/app_manager.dart';
import '../../main.dart';
import '../common/main_content_page.dart';
import '../common/randomly_colored_tappable_box.dart';
import 'get_it_example1.dart';



class GetItExample2 extends StatefulWidget {
  const GetItExample2({Key? key}) : super(key: key);

  @override
  _GetItExampleState createState() => _GetItExampleState();
}

class _GetItExampleState extends State<GetItExample2> {
  _GetItExampleState() {
        //sl.registerSingleton(AppManager());
  }

  @override
  void dispose() {
   // sl.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return ProviderScope(
    //overrides: [fileServiceProvider.overrideWithValue(MockFileService())],
    //child: Scaffold(
    return Scaffold(
      appBar: AppBar(
        title: Text('Get_IT'),
      ),
      body: MainContentPage(
          title: 'Get_IT', leftSide: View1(), rightSide: View2()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GetItExample2()),
          );
        },
        tooltip: 'next',
        child: Icon(Icons.add),
      ), // This t
      // ),
    );
  }
}


class View1 extends StatelessWidget with GetItMixin {
  @override
  Widget build(BuildContext context) {
    void handleTap() => sl.get<AppManager>().count1++;
    int count = watchOnly((AppManager m) => m.count1);
    return RandomlyColoredTappableBox(content: 'count1: $count', onTap: handleTap);
  }
}

class View2 extends StatelessWidget with GetItMixin {
  @override
  Widget build(BuildContext context) {
    void handleTap() => sl.get<AppManager>().count2++;
    int count = watchOnly((AppManager m) => m.count2);
    return RandomlyColoredTappableBox(content: 'count2: $count', onTap: handleTap);
  }
}
