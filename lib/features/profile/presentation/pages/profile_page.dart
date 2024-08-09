import 'package:e_cloth/features/profile/presentation/pages/trasaction_list_page.dart';
import 'package:e_cloth/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 330,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 60.0),
            color: const Color.fromARGB(255, 248, 253, 255), //

            child: Column(
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage(Assets.images.fotoProfile.path),
                  backgroundColor: Colors.red,
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'Adams',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'Adams123@gmail.com',
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              transform: Matrix4.translationValues(0, -30, 0),
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, -1),
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: ListView(
                children: [
                  const SizedBox(height: 15.0),
                  ListTile(
                    leading: IconButton(
                      icon: Assets.icons.box.image(fit: BoxFit.cover),
                      onPressed: () {},
                    ),
                    title: const Text('Purchase on going'),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const TrasactionListPage(status: 'On going'),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 5.0),
                  ListTile(
                    leading: IconButton(
                      icon: Assets.icons.history.image(fit: BoxFit.cover),
                      onPressed: () {},
                    ),
                    title: const Text('Purchase history'),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                    onTap: () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const TrasactionListPage(status: 'Finished'),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 5.0),
                  ListTile(
                    leading: IconButton(
                      icon: Assets.icons.logout.image(fit: BoxFit.cover),
                      onPressed: () {},
                    ),
                    title: const Text('Logout'),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
