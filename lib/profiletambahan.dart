import 'package:flutter/material.dart';

class ProfileTambahan extends StatelessWidget {
  const ProfileTambahan({super.key});

  @override
  Widget build(BuildContext context) {
    final headerImage = Container(
      width: double.infinity,
      height: 320,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(top: 44),
        child: Column(
          children: const [
            CircleAvatar(
              radius: 64,
              backgroundImage: AssetImage(
                'assets/images/WhatsApp.jpg',
              ),
            ),
            SizedBox(height: 10),
            Text("ini PR dari bapak untuk menambahkan Profile di halaman baru"),
            
            Text(
              'Muhammad Faiz Satrio Adhi',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Software Development Engineer',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );

    final personalInfo = Container(
      margin: const EdgeInsets.all(54),
      child: Column(
        children: [
          const SizedBox(height: 20),

          Row(
            children: const [
              Icon(
                Icons.mail,
                color: Color.fromRGBO(4, 79, 79, 0.698),
              ),
              SizedBox(width: 15),
              Text('MuhammadFaiz23@gmail.com'),
            ],
          ),

          const SizedBox(height: 15),

          Row(
            children: const [
              Icon(
                Icons.phone_android,
                color: Color.fromRGBO(4, 79, 79, 0.698),
              ),
              SizedBox(width: 15),
              Text('+62 81234567890'),
            ],
          ),

          const SizedBox(height: 15),

          Row(
            children: const [
              Icon(
                Icons.group_add,
                color: Color.fromRGBO(4, 79, 79, 0.698),
              ),
              SizedBox(width: 15),
              Text('Add to Group'),
            ],
          ),

          const SizedBox(height: 15),

          Row(
            children: const [
              Icon(
                Icons.comment,
                color: Color.fromRGBO(4, 79, 79, 0.698),
              ),
              SizedBox(width: 15),
              Text('Show all Comments'),
            ],
          ),
        ],
      ),
    );

    final followButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: const Color.fromARGB(
          177,
          141,
          215,
          215,
        ),
      ),
      onPressed: () {},
      child: const Text('FOLLOW ME'),
    );

    final numberInfo = Container(
      height: 100,
      decoration: BoxDecoration(
        boxShadow: const [

        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 270,
        horizontal: 24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Photos',
                style: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '150',
                style: TextStyle(
                  color: Color.fromARGB(255, 8, 177, 166),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Followers',
                style: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '3275',
                style: TextStyle(
                  color: Color.fromARGB(255, 8, 177, 166),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Following',
                style: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '1250',
                style: TextStyle(
                  color: Color.fromARGB(255, 8, 177, 166),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.grey[200],

      body: Stack(
        children: [
          Column(
            children: [
              headerImage,
              personalInfo,
              followButton,
            ],
          ),

          numberInfo,
        ],
      ),
    );
  }
}