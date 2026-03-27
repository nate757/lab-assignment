import 'package:flutter/material.dart';

void main() {
  runApp(const BottomNavApp());
}

class BottomNavApp extends StatelessWidget {
  const BottomNavApp({super.key});

  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation',
      theme: ThemeData (primarySwatch: Colors.green),
      home: const MainScreen(),
    ); // MaterialApp
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State <MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    HomeScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ]; // <Widget>[]

  void _onItemTapped(int index) {
    setState(() {
    _selectedIndex = index;
  });
}

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bottom Navigation Demo')),
      body: _screens [_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(icon: Icon (Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),      
            label: 'Favorites',
          ), // BottomNavigationBarItem
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),  
        ], // <BottomNavigationBarItem>[]
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,

      ), // BottomNavigationBar
    ); // Scaffold
  }
}


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build (BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('Go to Details'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute (builder: (context) => const DetailsScreen()),
          );
        },
      ), // ElevatedButton
    ); // Center
  }
}


class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar (title: const Text('Details')),
      body: Center(
        child: ElevatedButton (
          child: const Text('Go Back'), 
          onPressed: () => Navigator.pop(context),
        ), // ElevatedButton
      ), // Center
    ); // Scaffold
  }
}

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen ({super.key});

  @override
  Widget build (BuildContext context) {
    return const Center (child: Text('Your favorite items appear here.'));
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build (BuildContext context) {
    return const Center(child: Text('User profile information.'));
  }
}