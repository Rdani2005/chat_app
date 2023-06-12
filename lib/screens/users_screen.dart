import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:chat_app/models/models.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final users = <User>[
    User(id: '1', name: "Danny", email: "danny@email.com", online: true),
    User(id: '2', name: "Danny", email: "danny@email.com", online: false),
    User(id: '3', name: "Danny", email: "danny@email.com", online: true),
    User(id: '4', name: "Danny", email: "danny@email.com", online: true),
    User(id: '5', name: "Danny", email: "danny@email.com", online: true),
  ];
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "My name",
            style: TextStyle(
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          elevation: 1,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.exit_to_app),
            color: Colors.black87,
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: const Icon(
                Icons.check_circle,
                color: Colors.blue,
              ),
            )
          ],
        ),
        body: SmartRefresher(
          onRefresh: _chargeUsers,
          controller: _refreshController,
          enablePullDown: true,
          header: WaterDropHeader(
            complete: Icon(
              Icons.check,
              color: Colors.blue[400],
            ),
            waterDropColor: Colors.blue[400]!,
          ),
          child: _listView(),
        ));
  }

  ListView _listView() {
    return ListView.separated(
        itemBuilder: (_, index) => _AvailableUser(user: users[index]),
        separatorBuilder: (_, i) => const Divider(),
        itemCount: users.length);
  }

  void _chargeUsers() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }
}

class _AvailableUser extends StatelessWidget {
  const _AvailableUser({
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user.name),
      subtitle: Text(user.email),
      leading: CircleAvatar(
        child: Text(user.name.substring(0, 2)),
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: user.online ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
