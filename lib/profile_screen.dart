import 'package:flutter/material.dart';
import 'package:shop_joy/dio/api_provider.dart';
import 'package:shop_joy/models/user_info_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLoading = true;
  UserInfoModel? userInfoModel;

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  Future getUserInfo() async {
    userInfoModel = await ApiProvider().getUserInfo();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(23.0),
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Text(
                  'Profile',
                  style: TextStyle(color: Colors.blue[800], fontSize: 40),
                ),
                const Text("______________________________________________"),
                const SizedBox(
                  height: 30,
                ),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          border: Border.all(color: Colors.blue, width: 3)),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(userInfoModel!.image!),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.only(bottom: 2, end: 2),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.blue[100],
                        child: const Icon(
                          Icons.edit_rounded,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "First Name : ",
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    Text(
                      userInfoModel!.firstName!,
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Last Name : ",
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    Text(
                      userInfoModel!.lastName!,
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Gender : ",
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    Text(
                      userInfoModel!.gender!,
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Birth Date : ",
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    Text(
                      userInfoModel!.birthDate!,
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Email : ",
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    Text(
                      userInfoModel!.email!,
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Phone : ",
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    Text(
                      userInfoModel!.phone!,
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Address : ",
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    Text(
                      userInfoModel!.address!.address!,
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ],
            ),
    ));
  }
}
