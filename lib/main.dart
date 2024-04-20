import 'package:flutter/material.dart';

void main() {
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
      },
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
        decoration: BoxDecoration(
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
              const SizedBox(height: 20.0),
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
                  Navigator.pushNamed(context, '/Sell');
                },
                child: Text('Sell Waste'),
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

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('images/bg2.jpg'), // Path to your background image
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
                const TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20.0),
                const TextField(
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
                  onPressed: () {
                    // Add login logic here
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

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

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
                  style: const TextStyle(
                    color: Colors.white, // Text color of the input field
                    fontWeight: FontWeight.bold, // Bold font weight
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white, // Background color
                    labelText: 'Username',
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
                ),
                const SizedBox(height: 20.0),
                TextField(
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
                  onPressed: () {
                    // Add signup logic here
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: gsmController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'GSM'),
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
