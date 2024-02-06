import 'package:apicall_with_model/api_services.dart';
import 'package:apicall_with_model/single_post_with_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class ScreenWithModel extends StatefulWidget {
  const ScreenWithModel({super.key});

  @override
  State<ScreenWithModel> createState() => _ScreenWithModelState();
}

class _ScreenWithModelState extends State<ScreenWithModel> {

  bool isReady = false;
  SinglePostWithModel singlePostWithModel = SinglePostWithModel();
  _getSinglePost(){
    isReady = true;
    ApiServices().getSinglePostWithModel().then((value){
      setState(() {
        singlePostWithModel = value!;
        isReady = false;
      });

    }).onError((error, stackTrace) {
      print(error);
      setState(() {
        isReady = false;
      });
    });

  }


@override
  void initState() {
    _getSinglePost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Call With Model'),
        centerTitle: true,
      ),
      body: isReady == true?
        Center(child: CircularProgressIndicator(),):
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(singlePostWithModel.userId.toString()),
              Text(singlePostWithModel.title.toString()),
              Text(singlePostWithModel.body.toString()),
            ],
          )
    );
  }
}
