import 'package:flutter/material.dart';
import'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:moes_calculator/ui/new_order_page.dart';
import 'package:path/path.dart';
import 'package:transparent_image/transparent_image.dart';

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
                  switch(snapshot.connectionState){
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center (
                        child: CircularProgressIndicator(),
                      );
                    default:
                      return SliverToBoxAdapter(
                          child: Container(
                            height: 200.0,
                            alignment: Alignment.center,
                            child: ButtonBar(
                              mainAxisSize: MainAxisSize.min,
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
//                      return SliverStaggeredGrid.count(
//                        crossAxisCount: 1,
//                        mainAxisSpacing: 1.0,
//                        crossAxisSpacing: 1.0,
//                        staggeredTiles: snapshot.data.documents.map(
//                            (doc){
//                              return StaggeredTile.count(2, 1);
//                            }
//                        ).toList(),
//                        children: snapshot.data.documents.map(
//                            (doc){
//                              return FadeInImage.memoryNetwork(
//                                placeholder: kTransparentImage,
//                                image: doc.data["image"],
//                                fit: BoxFit.cover
//                              );
//                            }
//                        ).toList(),
//                      );
//                      return new ListView.builder(
//                          shrinkWrap: true,
//                          itemCount: snapshot.data.documents.length,
//                          padding: const EdgeInsets.only(top: 5.0),
//                          itemBuilder: (context, index) {
//                            DocumentSnapshot ds = snapshot.data.documents[index];
//                            return new Row(
//                              textDirection: TextDirection.ltr,
//                              children: <Widget>[
//                                Expanded (child:Text(ds["Attendant"]) ),
//                              ],
//                            );
//                          }
//                      );
                  }
                }
              },
            )
          ],
        )
      ],
    );
  }

  Widget _buildList(BuildContext context, DocumentSnapshot document) {
    return ListTile(
      title: Text(document['title']),
      subtitle: Text(document['body']),
    );
  }

}


