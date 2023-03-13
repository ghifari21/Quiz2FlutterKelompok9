import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: MyApp(),));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  String optionDate = "1 Januari 2023";
  List<Map<String, dynamic>> listData = [
    {'key':'Walking', 'value':3},
    {'key':'Driving', 'value':10}
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello App',
      home: Scaffold(
        appBar: AppBar(
            leading: const FlutterLogo(),
            backgroundColor: Colors.blueGrey,
            title: const Text('Quiz Flutter'),
            actions: const <Widget>[ButtonNamaKelompok(), ButtonPerjanjian()]),
        body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_ios,),
                ),
                DropdownButton(
                  value: optionDate,
                  underline: Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 1.0, color: Colors.grey)
                        )
                    ),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: "1 Januari 2023",
                      child: Text("1 Januari 2023"),
                    ),
                    DropdownMenuItem(
                      value: "2 Januari 2023",
                      child: Text("2 Januari 2023"),
                    ),
                  ],
                  onChanged: (String? newValue) {
                    setState(() {
                      if (newValue != null) {
                        optionDate = newValue;
                      }
                    });
                  },
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_ios,),
                ),
              ],
            ),
            const SizedBox(height: 16.0,),
            Text(
              optionDate,
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w500,
                color: Colors.red
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2.0,
                  color: Colors.black
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(Icons.car_repair),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text("10 km"),
                          Text("20 jam, 30 menit"),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(Icons.nordic_walking),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text("20 km"),
                          Text("40 jam, 20 menit"),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(Icons.pedal_bike),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text("2 km"),
                          Text("2 jam"),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: listData.length,
                itemBuilder: (context, index){
                  return Card(
                    child: ListTile(
                      leading:  
                        Image.network(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                          height: 50,
                        ),
                      title: 
                        Text(
                          listData[index]['key'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      subtitle:
                        Text(
                          '${listData[index]['value']} km',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey
                          )
                        ),
                      trailing: 
                        const Icon(
                          Icons.more_vert,
                          color: Color.fromARGB(255, 143, 143, 143),
                        ),
                      onTap:(){
                        
                      },
                    )
                  );
                }
              )
            )
          ],
        ),
      ),
    );
  }
}

class ButtonNamaKelompok extends StatelessWidget {
  const ButtonNamaKelompok({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.account_circle_rounded),
      onPressed: () {
        // icon account di tap
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Nama Kelompok 9'),
            content: const Text('Ghifari Octaverin (ghifariocta@upi.edu) ; Alief Muhammad Abdillah (aliefmabdillah09@upi.edu)'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}


class ButtonPerjanjian extends StatelessWidget {
  const ButtonPerjanjian({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.access_alarm_rounded),
      onPressed: () {
        // icon setting ditap
        const snackBar = SnackBar(
          duration: Duration(seconds: 20),
          content: Text('Kami berjanji tidak akan berbuat curang dan atau membantu kelompok lain berbuat curang'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}