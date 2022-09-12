import 'package:flutter/material.dart';
import 'package:fyp/Components/header_widget.dart';
import 'package:fyp/Model/Student/student.dart';
import 'package:fyp/constants.dart';

class ProfilePage extends StatefulWidget {
  final Student student;
  ProfilePage({required this.student});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    String pic = widget.student.profilePic + ".jpg";
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(color: Colors.white),
          title: const Text(
            'Profile',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: primaryColor,
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: 100,
                child: const HeaderWidget(
                  100,
                  false,
                  Icon(Icons.house_rounded),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage('assets/profile/' + pic),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.student.firstName + " " + widget.student.lastName,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding:
                                const EdgeInsets.only(left: 8.0, bottom: 4.0),
                            alignment: Alignment.topLeft,
                            child: const Text(
                              "User Information",
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Card(
                            child: Container(
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      ...ListTile.divideTiles(
                                        color: Colors.grey,
                                        tiles: [
                                          ListTile(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 12,
                                                    vertical: 4),
                                            leading:
                                                const Icon(Icons.my_location),
                                            title: const Text("Province"),
                                            subtitle: Text(
                                              widget.student.province,
                                            ),
                                          ),
                                          ListTile(
                                            leading: const Icon(Icons.email),
                                            title: const Text("Email"),
                                            subtitle:
                                                Text(widget.student.email),
                                          ),
                                          ListTile(
                                            leading: const Icon(
                                                Icons.perm_identity_outlined),
                                            title: const Text("Tazkira Number"),
                                            subtitle: Text(
                                                widget.student.tazkiraNumber),
                                          ),
                                          ListTile(
                                            leading: const Icon(Icons.book),
                                            title:
                                                const Text("Favorite Subject"),
                                            subtitle: Text(
                                                widget.student.favoriteSubject),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
