import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'profiletambahan.dart';

class ProfileScreen extends StatefulWidget {
  final String email;

  const ProfileScreen({super.key, required this.email});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentIndex = 0;

  final List<Map<String, String>> _missions = [
    {'judul': 'Moon Landing', 'sub': 'Apollo exploration mission'},
    {'judul': 'Mars Expedition', 'sub': 'Collecting Mars surface data'},
    {'judul': 'Satellite Repair', 'sub': 'Fixing communication systems'},
    {'judul': 'Alien Signal Scan', 'sub': 'Scanning deep space frequencies'},
    {'judul': 'Galaxy Mapping', 'sub': 'Exploring unknown galaxies'},
    {'judul': 'Moon Landing', 'sub': 'Apollo exploration mission'},
    {'judul': 'Moon Landing', 'sub': 'Apollo exploration mission'},
    {'judul': 'Moon Landing', 'sub': 'Apollo exploration mission'},
    {'judul': 'Moon Landing', 'sub': 'Apollo exploration mission'},
    {'judul': 'Moon Landing', 'sub': 'Apollo exploration mission'},
    {'judul': 'Moon Landing', 'sub': 'Apollo exploration mission'},
    {'judul': 'Moon Landing', 'sub': 'Apollo exploration mission'},
    {'judul': 'Moon Landing', 'sub': 'Apollo exploration mission'},
    {'judul': 'Moon Landing', 'sub': 'Apollo exploration mission'},
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Space Crew Dashboard'),
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.black,
          bottom: _currentIndex == 0
              ? const TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black54,
                  indicatorColor: Colors.red,
                  tabs: [
                    Tab(text: 'Crew Info'),
                    Tab(text: 'Missions'),
                  ],
                )
              : null,
        ),
        body: _currentIndex == 0 ? _buildProfileTabs() : _buildLogs(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (i) {
            if (i == 2) {
              Get.to(() => const ProfileTambahan());
            } else {
              setState(() => _currentIndex = i);
            }
          },
          selectedItemColor: Colors.cyan,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Crew'),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Logs'),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profile'),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileTabs() {
    return TabBarView(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.cyan,
                    child: Icon(Icons.rocket_launch, size: 55, color: Colors.black),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'ACTIVE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.email, color: Colors.cyan),
                  const SizedBox(width: 8),
                  Text(
                    widget.email,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                icon: const Icon(Icons.logout),
                label: const Text('Exit Station'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
        ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: _missions.length,
          itemBuilder: (_, i) => Card(
            color: Colors.grey[900],
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.cyan,
                child: Text('${i + 1}', style: const TextStyle(color: Colors.black)),
              ),
              title: Text(_missions[i]['judul']!, style: const TextStyle(color: Colors.white)),
              subtitle: Text(_missions[i]['sub']!, style: const TextStyle(color: Colors.white70)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLogs() {
    const logs = [
      'Mission completed',
      'Oxygen checked',
      'Navigation activated',
      'Galaxy scan completed',
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: logs.length,
      itemBuilder: (_, i) => Card(
        color: Colors.grey[900],
        child: ListTile(
          leading: const Icon(Icons.check_circle, color: Colors.cyan),
          title: Text(logs[i], style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}