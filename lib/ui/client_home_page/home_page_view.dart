import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dear_diary/db/models/Post.dart';
import 'package:dear_diary/widgets/DiaryForm.dart';
import 'package:dear_diary/widgets/DiaryCard.dart';
import 'package:fcode_common/fcode_common.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_page.dart';

class HomeView extends StatefulWidget {
  static int count = 1;

  final String name;

  HomeView({this.name});

  @override
  _HomeView createState() => _HomeView();
}

class _HomeView extends State<HomeView> {
  int countPosts = 1;
  FormView formView;

  String name = "John";

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
  DateTime selectedDate = DateTime.now();



  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    print(widget.name);
    //add a new post
    void callback(String msg, String description) async {
      homeBloc.add(AddPostCardEvent(new Post(
          userName: widget.name,
          massage: msg,
          description: description,
          created: Timestamp.now())));
    }

    Future<void> _selectDate(BuildContext context) async {
      final DateTime picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101, 2));
      if (picked != null && picked != selectedDate){
        setState(() {
          selectedDate = picked;
        });
        await homeBloc.add(
            GetPostByDataEvent(Timestamp.fromDate(selectedDate)));
      }
    }

    return BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (pre, current) => pre.posts != current.posts,
        builder: (context, state) {
          if (state.posts == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Text("Dear, ${widget.name}"),
                actions: <Widget>[
                  Column(
                    children: [
                      IconButton(
                        padding: const EdgeInsets.all(15.0),
                        icon: Icon(
                          Icons.calendar_today,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          _selectDate(context);
                        },
                      ),
                    ],
                  ),
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
                            'To select posts by date, pick up a date from calender at the appbar',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                          ),
                          for (var item in state.posts)
                            new CardWidget(
                                item.userName,
                                item.massage,
                                item.description,
                                item.created.toDate().toString()),
                        ],
                        scrollDirection: Axis.vertical,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }
}
