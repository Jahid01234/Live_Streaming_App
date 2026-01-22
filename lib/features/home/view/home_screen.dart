import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_streaming_app/core/style/global_text_style.dart';
import 'package:live_streaming_app/features/home/controller/home_controller.dart';
import 'package:live_streaming_app/features/home/model/user_model.dart';
import 'package:live_streaming_app/features/home/view/widgets/user_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        title: Text(
          "Home ",
          style: globalTextStyle(
            color: Colors.grey,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: ()=> controller.logout(),
              icon: Icon(Icons.logout,size: 20),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 15,
          right: 15,
        ),
        child: StreamBuilder(
            stream: controller.getUsersStream(),
            builder: (context,snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }

              if(!snapshot.hasData || snapshot.data!.isEmpty){
                return Center(child: Text("No users available."));
              }
              List<UserModel> users = snapshot.data!;
              return GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: users.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      //mainAxisExtent: 12,
                      childAspectRatio: 0.78
                  ),
                  itemBuilder: (context, index){
                   final user = users[index];
                   return UserCard(
                       user: user,
                       onTap: (){},
                   );
                  },
              );
            },
        ),
      )
    );
  }
}