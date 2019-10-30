import 'package:flutter/material.dart';
import'package:cloud_firestore/cloud_firestore.dart';
import 'package:moes_calculator/ui/new_order_page.dart';
import 'package:path/path.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget _buildBodyBack() => Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 211, 118, 130),
            Color.fromARGB(255, 253, 181, 168)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        )
      ),
    );

    return Stack(
      children: <Widget>[
        _buildBodyBack(),
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Atendimento Moe's"),
                centerTitle: true,
              ),
            ),
            FutureBuilder<QuerySnapshot>(
              future: Firestore.instance.collection("pedidos").orderBy("Date").getDocuments(),
              builder: (context, snapshot){
                if(!snapshot.hasData)
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 200.0,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  );
                else{
                  print(snapshot.data.documents.length);
                  return SliverToBoxAdapter(
                      child: Container(
                        height: 200.0,
                        alignment: Alignment.center,
                        child: ButtonBar(
                          mainAxisSize: MainAxisSize.min ,
                          children: <Widget>[
                            new RaisedButton(
                              child: new Text("Cadastrar"),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => NewOrderPage()));
                              },
                            )
                          ],
                        )
                      )
                  );
                }
              },
            )
          ],
        )
      ],
    );
  }

}
