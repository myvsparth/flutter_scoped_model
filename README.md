# flutter_scoped_model
 How to implement Scoped Model in Flutter
## Introduction:
 This Article explains how state will be managed in flutter. There is a method you already know about is provider, Inherited Widget, redux etc. Scoped Mode is also a state management technique. Scoped Model is somehow advanced compared to Inherited Widget and it’s also better in performance as well. Now let’s see Scoped Model implementation in Flutter in detail.

## Plugin Required : scoped_model: ^1.0.1

## Steps:
 Step 1:
 First and basic step to create new application in flutter. If you are a beginner in flutter then you can check my blog Create a first app in Flutter. I have created an app named as “flutter_scoped_model”.

 Step 2:
 Now you can see that you will have counter app by default now our purpose is to make the same app using inherited widget.

 Step 3:
 Add dependency in pubspec.yaml file as below.
```
dependencies:
 flutter:
   sdk: flutter
 cupertino_icons: ^0.1.2
 scoped_model: ^1.0.1
```

 Step 4:
 Now Create a new file named as counter_model.dart. In this file we will implement class named  as CounterModel which contains count variable and increment() which increment count variable the notifyListeners() will notify to all the connected listeners when increment will be occured. Following is the programming implementation of that.
```
import 'package:scoped_model/scoped_model.dart';
 
class CounterModel extends Model {
 int count = 0;
 int get counts => count;
 increment() {
   count++;
   notifyListeners();
 }
}
```

 Step 5:
 Now in main.dart file we will define the scoped model scope using ScopedModel widget and all the child elements have access to scoped model class using ScopedModelDescedant<Dynamic> widget. Following is the programming implementation of that.
```
import 'package:flutter/material.dart';
import 'package:flutter_scoped_model/counter_model.dart';
import 'package:scoped_model/scoped_model.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Flutter Demo',
     theme: ThemeData(
       primarySwatch: Colors.blue,
     ),
     home: MyHomePage(title: 'Flutter Demo Home Page'),
   );
 }
}
 
class MyHomePage extends StatefulWidget {
 MyHomePage({Key key, this.title}) : super(key: key);
 final String title;
 @override
 _MyHomePageState createState() => _MyHomePageState();
}
 
class _MyHomePageState extends State<MyHomePage> {
 @override
 Widget build(BuildContext context) {
   return ScopedModel(
     model: CounterModel(),
     child: Scaffold(
       appBar: AppBar(
         title: Text(widget.title),
       ),
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Text(
               'You have pushed the button this many times:',
             ),
             ScopedModelDescendant<CounterModel>(
               builder: (context, _, model) => Text(
                 '${model.count}',
                 style: Theme.of(context).textTheme.display1,
               ),
             ),
           ],
         ),
       ),
       floatingActionButton: ScopedModelDescendant<CounterModel>(
         builder: (context, _, model) => FloatingActionButton(
           onPressed: (){
             model.increment();
           },
           tooltip: 'Increment',
           child: Icon(Icons.add),
         ),
       ),
     ),
   );
 }
}
```
 Hurrey…. Run the app and Test It on emulator/simulator or device :)))

## Conclusion:
 State Management is one of the key parts of performance improvement of the app and Scoped Model is one of the approaches of it and it has better performance then inherited widget.

 Git Repo: https://github.com/myvsparth/flutter_scoped_model
 
## Related to Tags: Flutter, State Management, Scoped Model

