import 'dart:convert';

import 'package:apicall_with_model/single_post_with_model.dart';
import 'package:http/http.dart' as http;

class ApiServices{

  Future<SinglePostWithModel?> getSinglePostWithModel()async{

    try{

      var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));

      if(response.statusCode == 200 || response.statusCode == 201){
        
        SinglePostWithModel model = SinglePostWithModel.fromJson(json.decode(response.body));
        return model;
      }

    }catch(e)
    {
      print(e.toString());
    }
  }
}