import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dear_diary/db/models/Post.dart';
import 'package:dear_diary/db/repository/postRepository/PostRepository.dart';
import 'package:dear_diary/ui/login_page/login_page.dart';
import 'package:dear_diary/widgets/DiaryForm.dart';
import 'package:dear_diary/widgets/DiaryCard.dart';
import 'package:fcode_bloc/fcode_bloc.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_page.dart';

class HomeView extends StatefulWidget {
  static int count = 1;
  List<CardWidget> postWidgets = [];
  final String name;

  HomeView({this.name});

  @override
  _HomeView createState() => _HomeView(name: name);
}

class _HomeView extends State<HomeView> {
  int countPosts = 1;
  FormView formView;
  Widget currentPage;

  List<Post> list = [];

  String name;

  _HomeView({this.name});

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  int counter = 3;

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final homeBloc = BlocProvider.of<HomeBloc>(context);

    //add a new post
    void callback(String msg, String description) async {
      // list.clear();
      homeBloc.add(AddPostCard(new Post(
          userName: name,
          massage: msg,
          description: description,
          created: Timestamp.now())));
    }

    return BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (pre, current) => pre.posts != current.posts,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text("Dear, ${name}"),
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
                  icon: Icon(
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
                      children: <Widget>[
                        Text(
                          'You can see your all post card are here',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                        for (var item in state.posts)
                          new CardWidget(
                              item.userName, item.massage, item.description),
                      ],
                      scrollDirection: Axis.vertical,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
