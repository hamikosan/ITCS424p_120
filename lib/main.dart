import 'package:flutter/material.dart';
/*import 'package:test123/pages/profile_page.dart';*/
/*import 'package:flutter/services.dart';*/
/*import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.google.android.gms.maps.CameraUpdateFactory
import com.google.android.gms.maps.GoogleMap
import com.google.android.gms.maps.OnMapReadyCallback
import com.google.android.gms.maps.SupportMapFragment
import com.google.android.gms.maps.model.LatLng
import com.google.android.gms.maps.model.MarkerOptions*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Japanese Food FC';

    return const MaterialApp(
      title: title,
      home: MyStatefulWidget(),
      );
  }
}
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static TextStyle optionStyle =
      const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  /*late GoogleMapController mapController;

    final LatLng _center = const LatLng(45.521563, -122.677433);

    void _onMapCreated(GoogleMapController controller) {
      mapController = controller;
    }*/
  static final List<Widget> _widgetOptions = <Widget>[
    
    GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(100, (index) {
            return const Center(
              child: 
              CardDetail(),
            );
           }),
                      
    ),
    //const ProfilePage(),
    Text(
      'Index 1: Profile',
      style: optionStyle,
    ),
    Text(
      'Google Map',
      style: optionStyle,
    ),
    /*src: https://codelabs.developers.google.com/codelabs/google-maps-in-flutter#3
    src: developers.google.com/maps/documentation/android-sdk/map-with-marker
    GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
    ),*/
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  //src: https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Japanese Food FC'),
      ),bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_accounts),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.room),
            label: 'Map',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      
    );
  }
} 
class CardDetail extends StatelessWidget{
  const CardDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    final card = Container(
    child: Column(
      children: <Widget>[
        
        Image.network('https://www.gamingscan.com/wp-content/uploads/2022/01/Xingqiu-Build-Guide-For-Genshin-Impact.jpg'),
        //Image.asset('assets/images/Youtube water.png'),      
        Container(
          padding: const EdgeInsets.all(10),
          child: const Text('Name'),
        ),
        FlatButton(
          color: Colors.teal,
          textColor: Colors.white,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const SecondRoute()));//src:https://www.appsdeveloperblog.com/navigate-to-a-new-screen-on-button-click-in-flutter/
          },
          child: const Text('More Detail'),
        ),
      ],
      
  ));

  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25.0),
      boxShadow: const <BoxShadow>[
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10.0,
          spreadRadius: 2.0,
          offset: Offset(2.0, 10.0)),
      ]),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: card,
    ),
  );
  }
  
}

class SecondRoute extends StatelessWidget {
    const SecondRoute({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Second Route'),
        ),
        body: Center(
          child: FlatButton(
            color: Colors.blueAccent,
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const MyApp())); //src:https://www.appsdeveloperblog.com/navigate-to-a-new-screen-on-button-click-in-flutter/
          },
          child: const Text('GO TO HOME'),
        ),
          ),
        );
    }
}
  
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.black,
          fontFamily: 'Roboto',
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shadowColor: Colors.grey,
                  elevation: 20,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0.0))))),
          inputDecorationTheme: InputDecorationTheme(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(0.0))),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              alignment: Alignment.centerLeft,
              primary: Colors.black,
            ),
          )),
      home: const ProfilePage(),
    );
  }
}  


