import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dear_diary/db/models/Post.dart';
import 'package:dear_diary/db/repository/postRepository/PostRepository.dart';
import 'package:dear_diary/widgets/DiaryForm.dart';
import 'package:dear_diary/widgets/DiaryCard.dart';
import 'package:fcode_bloc/fcode_bloc.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_page.dart';

class HomeView extends StatefulWidget {
  final String UserName;

  HomeView(this.UserName);

  static int count = 1;

  List<CardWidget> postWidgets = [];

  @override
  _HomeView createState() => _HomeView(name: UserName);
}

List<Post> list;

class _HomeView extends State<HomeView> {
  int countPosts = 1;
  FormView formView;
  Widget currentPage;

  List<CardWidget> postWidgets = [];

  String name;

  _HomeView({this.name});

  @override
  void initState() {
    postWidgets.clear();
    getPosts();
    super.initState();
  }

  //getPosts function
  void getPosts() async {
    Future<List<Post>> query =
        PostRepository().query(specification: ComplexSpecification([])).first;
    list = await query;
    setState(() {});
  }

  void callback(String msg, String description) async {
    PostRepository().add(item: new Post());
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    int counter = 3;

    for (int i = 0; i < list.length; i++) {
      postWidgets.add(new CardWidget(
          list[i].userName, list[i].massage, list[i].description));
    }

    return Container(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Dear, $name"),
          backgroundColor: Colors.blueAccent,
          actions: <Widget>[
            Container(
              padding: const EdgeInsets.only(right: 15.0),
              child: Badge(
                badgeContent: Text(
                  '$counter',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                position: BadgePosition.topEnd(top: 6.0, end: -4.0),
                child: Icon(
                  Icons.notifications,
                  size: 30.0,
                ),
              ),
            ),
            IconButton(
              padding: const EdgeInsets.only(right: 15.0),
              icon: const Icon(
                Icons.person_rounded,
                color: Colors.white,
              ),
            )
          ],
        ),
        backgroundColor: Colors.blue,
        body: Center(
          child: new ListView(
            children: <Widget>[
              new Container(
                child: FormView(name, callback),
              ),
              new Container(
                height: 350,
                child: new ListView(
                  children: postWidgets.reversed.toList(),
                  scrollDirection: Axis.vertical,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
