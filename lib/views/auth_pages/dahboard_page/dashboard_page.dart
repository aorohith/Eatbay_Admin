import 'package:eatbay_admin/views/product_section.dart/admin_product_list.dart';
import 'package:eatbay_admin/views/settings_page/admin_settings_page.dart';
import 'package:eatbay_admin/views/users_list_section/admin_users.dart';
import 'package:eatbay_admin/views/widgets/admin_dashboard_tiles.dart';
import 'package:eatbay_admin/views/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DashBoard"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Column(
            children: [
              BigText(
                text: "Top Sales",
                size: 22,
              ),
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://wcs.smartdraw.com/chart/img/basic-bar-graph.png?bn=15100111830"))),
              ),
              SizedBox(
                height: 10,
              ),
              AdminDashboardTile(
                icon: Icons.swipe_up_sharp,
                text: "Total Sails",
                onClick: () {},
              ),
              SizedBox(
                height: 10,
              ),
              AdminDashboardTile(
                icon: Icons.attach_money_rounded,
                text: "Total Users",
                onClick: () {Get.to(AdminUsersListPage());},
                trailingText: "80K"
              ),
              SizedBox(
                height: 10,
              ),
              AdminDashboardTile(
                icon: Icons.supervised_user_circle_sharp,
                text: "Total Food Product",
                onClick: () {Get.to(AdminProductList());},
                trailingText: "10K",
              ),
              SizedBox(
                height: 10,
              ),
              AdminDashboardTile(
                icon: Icons.settings,
                text: "Settings",
                trailingText: "",
                onClick: () {
                  Get.to(const AdminSettingsPage());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

