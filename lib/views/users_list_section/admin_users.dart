import 'package:eatbay_admin/views/users_list_section/admin_user_detail..dart';
import 'package:eatbay_admin/views/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminUsersListPage extends StatefulWidget {
  const AdminUsersListPage({Key? key}) : super(key: key);

  @override
  State<AdminUsersListPage> createState() => _AdminUsersListPageState();
}

class _AdminUsersListPageState extends State<AdminUsersListPage> {
  String dropdownValue = 'Active';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
        actions: [
          SearchWidget(),
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: const CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Mohanlal_Viswanathan_Nair_BNC.jpg/640px-Mohanlal_Viswanathan_Nair_BNC.jpg"),
                ),
                title: const Text("Mohanlal"),
                subtitle: const Text("Total of25 Orders"),
                trailing: dropdown(),
                onTap: () {
                  Get.to(AdminUserDetailViewPage());
                },
              ),
            );
          },
        ),
      ),
    );
  }

  DropdownButtonHideUnderline dropdown() {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_drop_down),
        elevation: 16,
        style: const TextStyle(color: Colors.green),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>['Active', 'DeActivate', 'Block', 'UnBLock']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
