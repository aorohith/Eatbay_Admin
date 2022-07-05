import 'package:eatbay_admin/views/widgets/core/constant.dart';
import 'package:eatbay_admin/views/widgets/small_text.dart';
import 'package:flutter/material.dart';

class AdminUserDetailViewPage extends StatelessWidget {
  const AdminUserDetailViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User ID"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Mohanlal_Viswanathan_Nair_BNC.jpg/640px-Mohanlal_Viswanathan_Nair_BNC.jpg"),
              ),
              const Text(
                "Mohanlal",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              h20,                            
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AdminUserDetailOrders(
                    count: "150",
                    text: "Orders",
                  ),
                  AdminUserDetailOrders(
                    count: "200+",
                    text: "Items Ordered",
                  ),
                  AdminUserDetailOrders(
                    count: "30K",
                    text: "Total Payed",
                  ),
                ],
              ),
              h30,
              Divider(),
              AdminViewDetailTile(
                mainText: "User Status",
                subText: "Active",
                color: Colors.green,
              ),
              AdminViewDetailTile(
                mainText: "Location",
                subText: "Thripunithura",
              ),
              
              AdminViewDetailTile(
                mainText: "Contact Number",
                subText: "9568526589",
              ),
              AdminViewDetailTile(
                mainText: "Email",
                subText: "sample@sample.com",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdminViewDetailTile extends StatelessWidget {
  String mainText;
  String subText;
  Color color;
  AdminViewDetailTile({
    Key? key,
    required this.mainText,
    required this.subText,
    this.color=const Color(0xff000000),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          h10,
          SmallText(
            text: mainText,
            size: 15,
          ),
          Text(
            subText,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color: color),
          ),
          Divider(),
        ],
      ),
    );
  }
}

class AdminUserDetailOrders extends StatelessWidget {
  String count;
  String text;

  AdminUserDetailOrders({
    Key? key,
    required this.text,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
        Text(
          text,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
