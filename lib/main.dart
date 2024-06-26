import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  await Hive.openBox('users');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login/Signup Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/Sell': (context) => SellWastePage(),
        '/Estimate': (context) => EstimatedWeightPage(),
        '/Admin': (context) => AdminPage(),
        '/User': (context) => UserPage(),
      },
    );
  }
}

//User page

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  TextEditingController weightController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Approximate Weight of Paper (in kg)',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: locationController,
              decoration: InputDecoration(
                labelText: 'Pickup Location',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Process the weight and location entered by the user
                double weight = double.tryParse(weightController.text) ?? 0.0;
                String location = locationController.text;

                // Calculate the approximate amount based on weight
                double approximateAmount = weight * 13;

                // Open the Hive box for users
                var usersBox = await Hive.openBox('users');

                // Get the username from the users box
                String username = ''; // Initialize username variable
                usersBox.keys.forEach((key) {
                  if (usersBox.get(key) == location) {
                    username = key;
                  }
                });

                // Open the Hive box for users1
                var users1Box = await Hive.openBox('users1');

                // Store the username and location together in the users1 box
                users1Box.put(username, location);

                // Display confirmation message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        'Response submitted.You can get approximately ₹$approximateAmount. In a coming week if you want to make new entry do not make it our worked will do that after reaching to you'),
                  ),
                );
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('images/home.jpg'), // Path to your background image
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'PAYDIRT',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Admin');
                },
                child: Text('FOR ADMIN '),
              ),
              const SizedBox(height: 40.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text('Login'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: Text('Sign Up'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Estimate');
                },
                child: Text('Estimated weight'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/About');
                },
                child: Text('About us'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Signup',
          style: TextStyle(color: Colors.black), // Text color
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg.jpg'), // Path to your image asset
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Signup Page',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.black, // Text color
                    fontWeight: FontWeight.bold, // Bold font weight
                  ),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  style: TextStyle(
                    color: Colors.black, // Set text color to black
                    fontWeight: FontWeight.bold, // Bold font weight
                  ),
                  controller: usernameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white, // Background color
                    labelText: 'Username',
                    labelStyle: TextStyle(
                      color: Colors.black, // Text color of the label
                      fontWeight: FontWeight.bold, // Bold font weight
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none, // No border
                      borderRadius:
                          BorderRadius.circular(10.0), // Rounded corners
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  controller: passwordController,
                  style: const TextStyle(
                    color: Colors.white, // Text color of the input field
                    fontWeight: FontWeight.bold, // Bold font weight
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white, // Background color
                    labelText: 'Password',
                    labelStyle: const TextStyle(
                      color: Colors.black, // Text color of the label
                      fontWeight: FontWeight.bold, // Bold font weight
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none, // No border
                      borderRadius:
                          BorderRadius.circular(10.0), // Rounded corners
                    ),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () async {
                    var box = await Hive.openBox(
                        'users'); // Open a Hive box to store user data
                    String username = usernameController
                        .text; // Get the username from the text field
                    String password = passwordController
                        .text; // Get the password from the text field

                    // Check if the username already exists in the box
                    if (box.containsKey(username)) {
                      // If the username already exists, display a snackbar
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Username already exists! Please choose a different username.',
                          ),
                        ),
                      );
                    } else {
                      // If the username does not exist, store the new username-password pair in the Hive box
                      box.put(username, password);

                      print(
                          'Signup successful! Username: $username, Password: $password');
                    }
                  },
                  child: const Text('Signup'),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    // Navigate back to login page
                    Navigator.pop(context);
                  },
                  child: const Text('Back to Login'),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    // Navigate back to home page
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                  },
                  child: const Text('Back to Home'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AdminPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20.0),
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () async {
                    String enteredUsername = usernameController.text;
                    String enteredPassword = passwordController.text;

                    // Check if the user is an admin
                    if (enteredUsername == 'yash' &&
                        enteredPassword == 'yash') {
                      // Navigate to a new page where you can add functionality later
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Dashboard()),
                      );
                    } else {
                      // Display error message
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text('Invalid username or password.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20.0),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () async {
                    var box = await Hive.openBox('users');
                    String enteredUsername = usernameController.text;
                    String enteredPassword = passwordController.text;

                    String storedPassword =
                        box.get(enteredUsername, defaultValue: '');

                    if (storedPassword.isNotEmpty &&
                        enteredPassword == storedPassword) {
                      Navigator.pushNamed(context, '/User');
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text('Invalid username or password.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: const Text('Login'),
                ),
                const SizedBox(height: 20.0),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupPage()),
                    );
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//details page

class DetailsPage extends StatelessWidget {
  final String username;
  final double weight;
  final String location;

  DetailsPage(
      {required this.username, required this.weight, required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username: $username',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Weight Collected: $weight kg',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Location: $location',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: FutureBuilder(
        future: Hive.openBox('users1'), // Open the users1 box
        builder: (BuildContext context, AsyncSnapshot<Box> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              Box users1Box = snapshot.data!;
              var users1List =
                  users1Box.keys.toList(); // Get the list of usernames

              return ListView.builder(
                itemCount: users1List.length,
                itemBuilder: (BuildContext context, int index) {
                  String username = users1List[index];
                  String location = users1Box.get(username, defaultValue: '');

                  return ListTile(
                    // title: Text(
                    //   'Username: $username',
                    //   style: TextStyle(
                    //       color: Color.fromARGB(
                    //           255, 74, 74, 74)), // Set text color to black
                    // ),
                    subtitle: Text('pickup Location: $location'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        // Delete the username from the users1 box
                        users1Box.delete(username);
                        // Rebuild the UI to reflect the changes
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('User $username deleted.'),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text('No users found.'),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class EstimatedWeightPage extends StatefulWidget {
  @override
  _EstimatedWeightPageState createState() => _EstimatedWeightPageState();
}

class _EstimatedWeightPageState extends State<EstimatedWeightPage> {
  TextEditingController gsmController = TextEditingController();
  TextEditingController papersController = TextEditingController();
  TextEditingController lengthController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  double estimatedWeight = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estimated Weight Calculator'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'images/estimate.jpeg'), // Path to your background image
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                controller: gsmController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'GSM',
                ),
              ),
              TextField(
                controller: papersController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Number of Papers'),
              ),
              TextField(
                controller: lengthController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Length (in meters)'),
              ),
              TextField(
                controller: widthController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Width (in meters)'),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: calculateEstimatedWeight,
                child: Text('Calculate'),
              ),
              SizedBox(height: 20.0),
              Text(
                'Estimated Weight: ${estimatedWeight.toStringAsFixed(2)} kg',
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void calculateEstimatedWeight() {
    double gsm = double.tryParse(gsmController.text) ?? 0.0;
    int papers = int.tryParse(papersController.text) ?? 0;
    double length = double.tryParse(lengthController.text) ?? 0.0;
    double width = double.tryParse(widthController.text) ?? 0.0;

    double weight = (gsm * papers * length * width) / 1000;
    setState(() {
      estimatedWeight = weight;
    });
  }
}

class SellWastePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sell Waste'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to page to sell paper waste
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SellPaperWastePage()),
                );
              },
              child: Text('Sell Paper Waste'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to page to sell other waste
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SellOtherWastePage()),
                );
              },
              child: Text('Sell Other Waste'),
            ),
          ],
        ),
      ),
    );
  }
}

class SellPaperWastePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sell Paper Waste'),
      ),
      body: Center(
        child: Text('This is the page to sell paper waste.'),
      ),
    );
  }
}

class SellOtherWastePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sell Other Waste'),
      ),
      body: Center(
        child: Text(
          'Sorry currently we are not dealing in other wastes ,we will let you know when we will start ',
          style: TextStyle(
            fontSize: 20.00,
          ),
        ),
      ),
    );
  }
}
