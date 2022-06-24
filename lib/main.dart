import 'package:attendance_app/login_form.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return LoginScreen();
    /*Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage('assets/images/easy_software.png'),
            width: 200,
            height: 200,),
            const SizedBox(height: 20,),

            const Text('Easy Software', style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),),
            const SizedBox(height: 20,),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: myController,
                cursorColor: Colors.black,
                onChanged: (text) {
                  print('First text field: ${text}');
                },
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    hintText: "Company ID"),
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    hintText: "Username"),
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    hintText: "Password"),
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                border: Border.all(width: 1, color: Colors.black)
              ),
              child: TextButton(
                  onPressed: () {},
                  child: const Text('Login', style: TextStyle(
                    color: Colors.black,
                    fontSize: 16
                  ),)),
            )
          ],
        ),
      )

    );*/
  }
}
