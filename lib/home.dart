import 'package:attendance_app/login_form.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required String username}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey.withOpacity(0.5), width: 1)),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: const [
                        ClipOval(
                          child: Image(
                            image:
                                AssetImage('assets/images/easy_software.png'),
                            fit: BoxFit.cover,
                            width: 80,
                            height: 80,
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          'User',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Organization',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Text(
                            'Easy Software',
                            style: TextStyle(fontSize: 13),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Department',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Text(
                            'Mobile App Development',
                            style: TextStyle(fontSize: 13),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Today Attendance',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Text(
                            'Present',
                            style: TextStyle(fontSize: 13),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey.withOpacity(0.4), width: 1)),
                    child: Column(
                      children: [
                        Icon(
                          Icons.people,
                          size: 60,
                          color: Colors.green,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Attendance',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: SignOut,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey.withOpacity(0.4), width: 1)),
                      child: Column(
                        children: [
                          Icon(
                            Icons.logout,
                            size: 60,
                            color: Colors.green,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Log Out',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void SignOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('username');
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext ctx) => LoginScreen()));
  }
}
