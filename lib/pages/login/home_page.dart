import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _subPageIndex = 0;
  var appbar = "FOOD";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appbar,
          style: Theme.of(context).textTheme.headline3,),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Container(
                        width: 80.0,
                        height: 80.0,
                        child: Image.asset('assets/images/pro.jpg'),
                      )
                  ),

                  Text(
                    'Chonlada Savatkittikul',
                    style: TextStyle(fontSize: 25.0, color: Colors.white),
                  ),
                  Text(
                    'Savatkittikul_c@silpakorn.edu',
                    style: TextStyle(fontSize: 15.0, color: Colors.blueGrey),
                  ),
                ],
              ),
            ),
            _subPageIndex == 0?ListTile(
              title: _buildDrawerItem(Icon(Icons.fastfood,size: 50.0,color: Colors.deepPurple,), 'FOOD'),
              onTap: () => _showSubPage(0),
              selected: true,
            ):ListTile(
              title: _buildDrawerItem(Icon(Icons.fastfood,size: 50.0), 'FOOD'),
              onTap: () => _showSubPage(0),
              selected: false,
            ),
            _subPageIndex == 1?ListTile(
              title: _buildDrawerItem(Icon(Icons.person, size: 50.0,color: Colors.deepPurple,), 'PROFILE'),
              onTap: () => _showSubPage(1),
              selected: true,
            ):ListTile(
              title: _buildDrawerItem(Icon(Icons.person, size: 50.0,), 'PROFILE'),
              onTap: () => _showSubPage(1),
              selected: false,
            ),
          ],
        ),
      ),

      body: Container(
        decoration: const BoxDecoration(
          image: const DecorationImage(
              image: const AssetImage("assets/images/bghome.jpg"),
              fit: BoxFit.fill),
        ),
        child: _buildSubPage(),
      ),
    );
  }

  _showSubPage(int index) {
    if(index == 0){
      setState(() {
        _subPageIndex = 0;
        appbar = "FOOD";
      });
    }else{
      setState(() {
        _subPageIndex = 1;
        appbar = "PROFILE";
      });
    }
    Navigator.of(context).pop();
  }


  Widget _buildSubPage() {
    switch (_subPageIndex) {
      case 0: // home page
        return FoodPage();
      case 1:
        return ProFilePage();
      default:
        return SizedBox.shrink();
    }
  }

  Row _buildDrawerItem(Widget icon, String title) {
    return Row(
      children: [
        icon,
        SizedBox(width: 8.0),
        Text(title,style: TextStyle(fontSize: 20.0),),
      ],
    );
  }
}

class ProFilePage extends StatelessWidget {
  const ProFilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: const DecorationImage(
              image: const AssetImage("assets/images/bghome.jpg"),
              fit: BoxFit.fill),
        ),
        child: Center(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(80.0),
                child: Container(
                  width: 180.0,
                  height: 180.0,
                  child: Image.asset('assets/images/pro.jpg'),
                )
            ),

            Text(
              'Chonlada Savatkittikul',
              style: TextStyle(fontSize: 30.0, color: Colors.white,backgroundColor: Colors.black),
            ),
            Text(
              'Savatkittikul_c@silpakorn.edu',
              style: TextStyle(fontSize: 20.0, color: Colors.white,backgroundColor: Colors.black),
            ),
          ],
      ),
        ),),

    );
  }
}

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  State<FoodPage> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<FoodPage> {
  var _selectedBottomNavIndex = 0;
  final foodpage = [
    Center(
      child: Text(
        'FOOD MENU',
        style: TextStyle(fontSize: 60.0, color: Colors.white,backgroundColor: Colors.black),
        textAlign: TextAlign.center,
      ),
    ),
    Center(
      child: Text(
        'YOUR ORDER',
        style: TextStyle(fontSize: 60.0, color: Colors.white,backgroundColor: Colors.black),
        textAlign: TextAlign.center,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: const DecorationImage(
              image: const AssetImage("assets/images/bghome.jpg"),
              fit: BoxFit.fill),
        ),
        child: Center(
          child: foodpage[_selectedBottomNavIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Your Order',
          ),
        ],
        currentIndex: _selectedBottomNavIndex,
        onTap: (index) {
          setState(() {
            _selectedBottomNavIndex = index;
          });
        },
      ),
    );
  }
}







