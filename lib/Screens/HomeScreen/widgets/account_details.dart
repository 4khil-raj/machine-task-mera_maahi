import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mere_maahi_dummy/Firebase/currentuser_repo.dart';
import 'package:mere_maahi_dummy/Screens/Account/editprofile.dart';
import 'package:mere_maahi_dummy/Screens/Account/premium/premium.dart';
import 'package:mere_maahi_dummy/Screens/ChatScreen/push.dart';

class HomeAccountDetailTile extends StatelessWidget {
  const HomeAccountDetailTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 48, 94, 132),
            Color.fromARGB(255, 41, 107, 42)
          ], // Gradient colors
          begin: Alignment.topLeft, // Gradient start point
          end: Alignment.bottomRight, // Gradient end point
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(userAllDetails!.profilePic!),
              radius: 30,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      userAllDetails!.name!.toUpperCase(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Icon(
                      Icons.verified,
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  const Text('SHA548A647b',
                      style: TextStyle(color: Colors.white)),
                  const Padding(
                    padding: EdgeInsets.only(left: 7),
                    child: Text(
                      '|',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (c) => const EditProfile())),
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                          color: Colors.blue[400],
                        ),
                      ))
                ],
              ),
              const Text('Account type - Free',
                  style: TextStyle(color: Colors.white)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () => customNavPush(context, const UpgradePremium()),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue[400],
                        borderRadius: BorderRadius.circular(20)),
                    height: 36,
                    width: 140,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.capslock_fill,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Upgrade Now',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
