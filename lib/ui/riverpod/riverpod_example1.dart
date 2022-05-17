import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/app_manager.dart';
import '../common/main_content_page.dart';
import '../common/randomly_colored_tappable_box.dart';
import 'riverpod_example.dart';
import 'riverpod_example2.dart';

// final appManagerProvider = ChangeNotifierProvider((ref) {
//   return AppManager();
// });

class RiverpodExample1 extends StatelessWidget {
  const RiverpodExample1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // return ProviderScope(
      //overrides: [fileServiceProvider.overrideWithValue(MockFileService())],
      return Scaffold(
        appBar: AppBar(
          title: Text('RIVERPOD'),
        ),
        body: MainContentPage(title: 'RIVERPOD', leftSide: View1(), rightSide: View2()),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RiverpodExample2()),
            );
          },
          tooltip: 'next',
          child: Icon(Icons.add),
        ), // This t
     // ),
    );
  }
}

class View1 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void handleTap() => ref.read(appManagerProvider).count1++;
    int count = ref.watch(appManagerProvider.select((p) => p.count1));
    //int count = appManager.count1;
    return RandomlyColoredTappableBox(content: 'count1: $count', onTap: handleTap);
  }
}

class View2 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void handleTap() => ref.read(appManagerProvider).count2++;
    int count = ref.watch(appManagerProvider.select((p) => p.count2));
    return RandomlyColoredTappableBox(content: 'count2: $count', onTap: handleTap);
  }
}
