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

  HomeView();

  @override
  _HomeView createState() => _HomeView();
}

class _HomeView extends State<HomeView> {
  int countPosts = 1;
  FormView formView;
  Widget currentPage;

  List<CardWidget> postWidgets = [];
  List<Post> list = [];

  String name = "John default";

  _HomeView();

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

    void callback(String msg, String description) async {
      homeBloc.add(addPostCard(new Post(
          userName: name,
          massage: msg,
          description: description,
          created: Timestamp.now())));
    }

    //getPosts function
    Future<String> getPosts() async {

    }

    setState(() {
      name = homeBloc.getName();
      print("Home state Name----------${name}");
    });

    return BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (pre, current) => pre.posts != current.posts,
        builder: (context, state) {
          for (int i = 0; i < list.length; i++) {
            postWidgets.add(new CardWidget(
                list[i].userName, list[i].massage, list[i].description));
          }
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
                      children: postWidgets,
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
