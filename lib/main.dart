import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LayoutBuilder Website',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LayoutBuilder Website'),
        leading: _buildLeading(context),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 600) {
            return _buildWideLayout(context);
          } else {
            return _buildNarrowLayout(context);
          }
        },
      ),
      drawer: _isDrawerOpen ? Drawer(child: _buildDrawerItems()) : null,
    );
  }

  Widget? _buildLeading(BuildContext context) {
    if (MediaQuery
        .of(context)
        .size
        .width < 600) {
      return IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          setState(() {
            _isDrawerOpen = !_isDrawerOpen;
          });
        },
      );
    } else {
      return null;
    }
  }

  Widget _buildWideLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: _buildLeftColumn(),
        ),
        Expanded(
          flex: 3,
          child: _buildRightColumn(),
        ),
      ],
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildLeftColumn(),
        _buildRightColumn(),
      ],
    );
  }

  Widget _buildLeftColumn() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Welcome to LayoutBuilder Website',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'This is an example of a Flutter website that uses LayoutBuilder to create a responsive layout.',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Learn more'),
          ),
        ],
      ),
    );
  }

  Widget _buildRightColumn() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'About Us',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Contact Us'),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItems() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DrawerHeader(
          child: Text('Menu'),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.info),
          title: const Text('About Us'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.email),
          title: const Text('Contact Us'),
          onTap: () {},
        ),
      ],
    );
  }

}