import 'package:eatbay_admin/views/widgets/big_text.dart';
import 'package:eatbay_admin/views/widgets/signin_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class AdminComplaintPage extends StatelessWidget {
  const AdminComplaintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Complaint Ticket"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormField(
                maxLines: 10,
                decoration: const InputDecoration(
                  labelText: "   Your reply is here!!!",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 25),
                ),
              ),
              _complaintTile(onClick: () {}, text: "Anand H"),
              
              _complaintTile(onClick: () {}, text: "9568655656"),
              _complaintTile(
                  onClick: () {},
                  text:
                      "Fully damaged refer the photos Lorem\nis simply dummy text of the printing and \ntypesetting industry. Lorem Ipsum has\nthe industry's standard dummy text ever \nsince the 1500s, when an unknown pr",
                  height: 130),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _images(),
                  _images(),
                  _images(),
                  _images(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  LoginButton(
                    text: "Close",
                    onClick: () {},
                    color: Colors.red,
                  ),
                  LoginButton(
                    text: "Reply",
                    onClick: () {},
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _complaintTile({
    required Callback onClick,
    required String text,
    double height = 80,
  }) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            right: 10,
            left: 10,
          ),
          child: Row(
            children: [
              SizedBox(width: 20),
              BigText(text: text),
            ],
          ),
        ),
      ),
    );
  }

  _images() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://img.freepik.com/free-photo/big-hamburger-with-double-beef-french-fries_252907-8.jpg?w=2000'),
        ),
      ),
    );
  }
}
