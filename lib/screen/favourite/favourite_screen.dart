import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter/provider/favourite_provider.dart';
import 'package:provider_flutter/screen/favourite/myfavourite.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    print('buld');
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite_App'),
        actions: [
          InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyFavouriteItemScreen()));
              },
              child: Icon(Icons.favorite)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
                itemBuilder: (context,index){
                  return Consumer<FavouriteItemProvider>(builder: (context,value,child){
                    return ListTile(
                      onTap: (){
                        if(value.selectedItem.contains(index)){
                          value.removeItem(index);
                        }else{
                          value.addItem(index);
                        }
                      },
                      title: Text(
                          'Item '+index.toString()
                      ),
                      trailing: Icon(
                          value.selectedItem.contains(index)? Icons.favorite:Icons.favorite_border_outlined),
                    );
                  });
                }),
          )
        ],
      ),
    );
  }
}
