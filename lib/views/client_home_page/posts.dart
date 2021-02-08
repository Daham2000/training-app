import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dear_diary/db/repository/postRepository/PostRepository.dart';
import 'package:dear_diary/db/models/Post.dart';
import 'package:dear_diary/widgets/CardList.dart';
import 'package:dear_diary/widgets/DiaryForm.dart';
import 'package:dear_diary/widgets/DiaryCard.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

String userName;

class PostState extends StatefulWidget {

  final String UserName;
  PostState(this.UserName);
  static int count = 1;
  static String msg="Reasons why english learning is so important";
  static String description = "English is the Language of International Communication \n"
      "English gives access to more entertainment and more access to the Internet \n"
      "English makes it easier to travel";

  List<CardWidget> postWidgets = [];

  @override
  _PostState createState() => _PostState(foo: this.UserName,countPosts:count, msg:msg,
      description:description, postWidgets: postWidgets);
}

class _PostState extends State<PostState> {
  int countPosts = 1;
  FormView formView;
  Widget currentPage;

  String msg="";
  String description = "";

  List<CardWidget> postWidgets = [];
  List<CardWidget> postWidgets2 = [];

  Future<void> setData() async{
    Future<List<CardWidget>> data = PostService().getData();
    postWidgets2 = await data;
    setState(() {
      postWidgets = postWidgets2.reversed.toList();
    });
  }

  String foo;
  _PostState({this.foo, this.countPosts, this.msg, this.description, this.postWidgets});


  @override
  void initState() {
    setData();
    super.initState();
    formView = FormView(foo, callback);
    currentPage = formView;
  }

  //callback function
  void callback(msg, description) async {
  
    PostService(pid:"post ${Timestamp.now()}").updatePostData
      (new Post(foo, msg, description, Timestamp.now()));

    await setData();

    setState(() {
      this.msg = msg;
      this.description = description;
    });

  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    int counter = 3;

    return Scaffold(
        appBar: AppBar(
          title: Text("Dear, $foo"),
          backgroundColor: Colors.blueAccent,

          actions: <Widget>[
            Container(
              padding: const EdgeInsets.only(right: 15.0),
              child: Badge(
                badgeContent: Text('$counter', style: TextStyle(
                  color: Colors.white,
                ),),
                position: BadgePosition.topEnd(top: 6.0, end: -4.0),
                child: Icon(
                    Icons.notifications,
                  size: 30.0,
                ),
              ),
            ),
            IconButton(
              padding: const EdgeInsets.only(right: 15.0),
              icon: const Icon(Icons.person_rounded, color: Colors.white,),
            )

          ],

        ),

        backgroundColor: Colors.blue,
        body: Center(
          child: new ListView(
            children: <Widget>[

              new Container(
                  child: FormView(foo, callback),
              ),
              new Container(
                height: 350,
                child: new ListView(
                  children: postWidgets,
                  scrollDirection: Axis.vertical,
                ),
              ),
              //new ContactRow()
            ],
          ),
        ),

      );

  }

}
