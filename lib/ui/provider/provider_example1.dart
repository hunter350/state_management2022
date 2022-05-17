import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../logic/app_manager.dart';
import '../common/main_content_page.dart';
import '../common/randomly_colored_tappable_box.dart';

class ProviderExample1 extends StatelessWidget {
  const ProviderExample1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return ProviderScope(
    //overrides: [fileServiceProvider.overrideWithValue(MockFileService())],
    //child: Scaffold(
    return Scaffold(
      appBar: AppBar(
        title: Text('RIVERPOD'),
      ),
      body: MainContentPage(
          title: 'RIVERPOD', leftSide: View1(), rightSide: View2()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProviderExample1()),
          );
        },
        tooltip: 'next',
        child: Icon(Icons.add),
      ), // This t
      // ),
    );
  }
}

class View1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void handleTap() => context.read<AppManager>().count1++;
    int count = context.select((AppManager m) => m.count1);
    return RandomlyColoredTappableBox(content: 'count1: $count', onTap: handleTap);
  }
}

class View2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void handleTap() => context.read<AppManager>().count2++;
    int count = context.select((AppManager m) => m.count2);
    return RandomlyColoredTappableBox(content: 'count2: $count', onTap: handleTap);
  }
}
