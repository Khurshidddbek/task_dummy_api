import 'package:flutter/material.dart';
import 'package:task_dummy_api/model/post_model.dart';
import 'package:task_dummy_api/services/http_service.dart';

class HomePage extends StatefulWidget {
  static final String id = 'home_page';

  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String result_1 = '';
  String result_2 = '';
  String result_3 = '';
  String result_4 = '';
  String result_5 = '';

  void _showResponse_1(String response) {
    setState(() {
      result_1 = response;
    });
  }

  void _showResponse_2(String response) {
    setState(() {
      result_2 = response;
    });
  }

  void _showResponse_3(String response) {
    setState(() {
      result_3 = response;
    });
  }

  void _showResponse_4(String response) {
    setState(() {
      result_4 = response;
    });
  }

  void _showResponse_5(String response) {
    setState(() {
      result_5 = response;
    });
  }

  void _apiPostList() {
    Network.LIST(Network.API_LIST, Network.paramsEmpty()).then((response) => {
      _showResponse_1(response),
    });
  }

  void _apiPostGet() {
    Network.GET(Network.API_GET + '1', Network.paramsEmpty()).then((response) => {
     _showResponse_2(response),
    });
  }

  void _apiPostCreate(Post post) {
    Network.POST(Network.API_CREATE, Network.paramsCreate(post)).then((response) => {
      print(response),
      _showResponse_3(response),
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Post post = Post(id : 1, name: 'test', salary: '123', age: '23');

    _apiPostList();
    _apiPostGet();
    _apiPostCreate(post);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // API_LIST
              Text('Method GET', style: TextStyle(fontWeight: FontWeight.bold),),
              Expanded(
                child: ListView(
                  children: [
                    Text(result_1 != null ? result_1 : 'No Data'),
                  ],
                ),
              ),

              Divider(height: 5, color: Colors.black,),

              // API_GET
              Text('Method GET', style: TextStyle(fontWeight: FontWeight.bold),),
              Expanded(
                child: ListView(
                  children: [
                    Text(result_2 != null ? result_2 : 'No Data'),
                  ],
                ),
              ),

              Divider(height: 5, color: Colors.black,),

              // API_CREATE
              Text('Method POST', style: TextStyle(fontWeight: FontWeight.bold),),
              Expanded(
                child: ListView(
                  children: [
                    Text(result_3 != null ? result_3 : 'No Data'),
                  ],
                ),
              ),

              Divider(height: 5, color: Colors.black,),
            ],
          ),
        ),
        ),
    );
  }
}
