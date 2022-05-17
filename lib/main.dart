import 'package:flutter/material.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:my_state_manage/ui/riverpod/riverpod_example.dart';
import 'logic/app_manager.dart';
import 'ui/getit/get_it_example.dart';
import 'ui/provider/provider_example.dart';
import 'package:provider/provider.dart';

final sl = GetIt.I;

void main() {
  sl.registerSingleton(AppManager());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //return ProviderScope(
    return  ChangeNotifierProvider(
      create:   (context) => AppManager(),
      child: MaterialApp(
        title: 'State',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('State'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // Text(
            //   'You have pushed the button this many times:',
            // ),
            //
            // Text(
            //   '${context.watch<MyModel>().count}',
            //   style: Theme.of(context).textTheme.headline4,
            // ),
            RaisedButton(
              child: Text(
                'Riverpod',
                style: TextStyle(fontSize: 30),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RiverpodExample()),
                );
              },
              color: Colors.lightBlueAccent,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
              elevation: 8.0,
            ),
            RaisedButton(
              child: Text(
                'Provider',
                style: TextStyle(fontSize: 30),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProviderExample()),
                );
              },
              color: Colors.lightBlueAccent,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
              elevation: 8.0,
            ),
            RaisedButton(
              child: Text(
                'GetIt',
                style: TextStyle(fontSize: 30),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GetItExample()),
                );
              },
              color: Colors.lightBlueAccent,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
              elevation: 8.0,
            ),
          ],
        ),
      ),
    );
  }
}
