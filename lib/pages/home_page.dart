import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gituserinfo/services/http_service.dart';

class HomePage extends StatefulWidget {
  static final String id = 'home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic> resBody = Map();

  @override
  void initState() {
    super.initState();

    _apiPostGet();
  }

  void _apiPostGet() {
    Network.GET(Network.API_GET, 'Khurshidddbek').then((response) {
      setState(() {
        resBody = jsonDecode(response.toString());
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xFF0b0c10),
        child: Column(
          children: [
            // Search
            Container(
              height: 120,
              width: double.infinity,
              color: Color(0xFF171b21),
              child: Column(
                children: [
                  SizedBox(height: 45,),

                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color(0xFF282828),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(width: 15,),

                          Icon(Icons.lock, color: Colors.white70,),

                          SizedBox(width: 15,),

                          Text('github.com', style: TextStyle(color: Colors.white70, fontSize: 20),),

                          // Login
                          Text('/${resBody["login"] == null ? '...' : resBody["login"]}', style: TextStyle(color: Colors.white30, fontSize: 20),),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Body
            Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // User photo || User name
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // User photo
                          CircleAvatar(
                            backgroundColor: Color(0xFF171b21),
                            radius: 60,
                            backgroundImage: NetworkImage(resBody["avatar_url"] == null ? 'https://avatars.githubusercontent.com/u/78873641?v=4' : resBody["avatar_url"]),
                          ),

                          SizedBox(width: 15,),

                          // Login || Username
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Username
                              Text(resBody["name"] == null ? '...' : resBody["name"], style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 35),),

                              // Login
                              Text(resBody["login"] == null ? '...' : resBody["login"], style: TextStyle(color: Colors.white30, fontSize: 30),),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: 20,),

                      // Repositories
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Repositories  ', style: TextStyle(color: Colors.white30, fontSize: 22),),

                          Container(
                            width: 35,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text('${resBody["public_repos"] == null ? '...' : resBody["public_repos"]}', style: TextStyle(color: Colors.white30, fontSize: 20),),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20,),

                      // bio
                      Text(resBody["bio"] == null ? '...' : resBody["bio"], style: TextStyle(color: Colors.white70, fontSize: 22, fontWeight: FontWeight.w600),),

                      SizedBox(height: 20,),

                      // blog
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.link_outlined, color: Colors.white30,),

                          SizedBox(width: 5,),

                          Text(resBody["blog"] == null ? '...' : resBody["blog"], style: TextStyle(color: Colors.white70, fontSize: 18),),
                        ],
                      ),
                    ],
                  ),
            )),
          ],
        ),
      ),
    );
  }
}