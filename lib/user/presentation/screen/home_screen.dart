import 'package:dsc_sample_api_rest/user/datasources/model/user_model.dart';
import 'package:dsc_sample_api_rest/user/datasources/remotedatasouce/user_remote_data_source.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserRemoteDataSource user = UserRemoteDataSource();
    return Scaffold(
        body: FutureBuilder(
      future: user.remoteData(),
      builder: (BuildContext context, AsyncSnapshot<UserModel> snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        return Center(
          child: ListView.builder(
              itemCount: snapshot.data.data.length,
              itemBuilder: (_, i) {
                final user = snapshot.data.data[i];
                return Center(
                  child: Column(
                    children: [
                      Text('${user.firstName}'),
                      CircleAvatar(
                        backgroundImage: NetworkImage(user.avatar),
                      )
                    ],
                  ),
                );
              }),
        );
      },
    ));
  }
}
