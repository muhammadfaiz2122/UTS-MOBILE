import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final String email;
  const ProfileScreen({super.key, required this.email});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentIndex = 0;

  final List<Map<String, String>> _materi = [
    {'judul': 'Belajar Widget', 'sub': 'Text, Icon, Button'},
    {'judul': 'Widget Layout', 'sub': 'Row, Column, Stack, Container'},
    {'judul': 'Navigasi', 'sub': 'Stack, Bottom, Tab'},
    {'judul': 'ListView', 'sub': 'Data Statis'},
    {'judul': 'Form Input', 'sub': 'TextField & Validasi'},
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          bottom: _currentIndex == 0
              ? const TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white70,
                  indicatorColor: Colors.white,
                  tabs: [
                    Tab(text: 'Info'),
                    Tab(text: 'Materi'),
                  ],
                )
              : null,
        ),
        body: _currentIndex == 0 ? _buildProfileTabs() : _buildDaftar(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          selectedItemColor: Colors.indigo,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Daftar'),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileTabs() {
    return TabBarView(
      children: [
        // Tab Info
        SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.indigo,
                    child: Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Online',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.email, color: Colors.grey),
                  const SizedBox(width: 8),
                  Text(
                    widget.email,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                icon: const Icon(Icons.logout),
                label: const Text('Logout'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),

        // Tab Materi
        ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: _materi.length,
          itemBuilder: (_, i) => Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.indigo,
                child: Text('${i + 1}'),
              ),
              title: Text(_materi[i]['judul']!),
              subtitle: Text(_materi[i]['sub']!),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDaftar() {
    const aktivitas = [
      'Login berhasil',
      'Melihat profil',
      'Cek materi Flutter',
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: aktivitas.length,
      itemBuilder: (_, i) => Card(
        child: ListTile(
          leading: const Icon(Icons.check_circle, color: Colors.indigo),
          title: Text(aktivitas[i]),
        ),
      ),
    );
  }
}
