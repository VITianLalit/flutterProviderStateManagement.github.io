import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter/provider/example_one_provider.dart';

class ExampleOneScreen extends StatefulWidget {
  const ExampleOneScreen({super.key});

  @override
  State<ExampleOneScreen> createState() => _ExampleOneScreenState();
}

class _ExampleOneScreenState extends State<ExampleOneScreen> {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExampleOneProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Provider'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleOneProvider>(builder: (context,value,child){
            return Slider(
                min: 0,
                max: 1,
                value: provider.value,
                onChanged: (val) {
                  print(val);
                  provider.setValue(val);
                });
          }),
          Consumer<ExampleOneProvider>(builder: (context,value,child){
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    width: 20,
                    decoration:
                    BoxDecoration(color: Colors.green.withOpacity(value.value)),
                    child: Center(
                      child: Text('Container_1'),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    width: 20,
                    decoration:
                    BoxDecoration(color: Colors.red.withOpacity(value.value)),
                    child: Center(
                      child: Text('Container_1'),
                    ),
                  ),
                )
              ],
            );
          }),


        ],
      ),
    );
  }
}
