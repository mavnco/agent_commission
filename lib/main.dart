import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AgentCommission(),
  ));
}
class AgentCommission extends StatefulWidget {
  const AgentCommission({Key? key}) : super(key: key);

  @override
  State<AgentCommission> createState() => _AgentCommission();
}

class _AgentCommission extends State<AgentCommission> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  double result=0,sPrice=0,nReport=0;
  String history = ' ';
  bool value = false;

  //listHis(String history, int result){
  //  return history + ' ' + result.toString();
  //}
  computation(){
    setState(() {
      sPrice = double.parse(controller1.text);
      nReport = double.parse(controller2.text);

      if(nReport <= 5){
        result = sPrice * 0.05;
      }
      if(nReport > 5){
        result = sPrice * 0.07;
      };

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agent Commission"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(23.0),
        child: Column(

          children: [
            Text(
              "Commission Computation",
              style:  TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),

            TextField(
              controller: controller1,
              decoration: InputDecoration(
                  labelText: "Total Selling Price",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero
                  )

              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: controller2,
              decoration: InputDecoration(
                  labelText: "Number of Reports / Clients",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero
                  )

              ),
            ),

            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: (){
                  computation();
                  controller1.clear();
                  controller2.clear();
                }, child: Text("Compute"))
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Total Agent Commission: ₱$result",
              style:  TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),

      ),
    );
  }
}
