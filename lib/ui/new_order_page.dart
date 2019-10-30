import 'package:flutter/material.dart';
import 'package:moes_calculator/helpers/order_helper.dart';

class NewOrderPage extends StatefulWidget {

  final Order order;
  NewOrderPage({this.order});

  @override
  _NewOrderPageState createState() => _NewOrderPageState();
}

class _NewOrderPageState extends State<NewOrderPage> {

  bool _orderEdited = false;
  Order _editedOrder;
  int qtdItens;

  @override
  void initState() {

    super.initState();

    if(widget.order == null){
      _editedOrder = Order();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(_editedOrder.attendantName ?? "Novo Pedido"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            GestureDetector(
              child: Container(
                width: 140.0,
                height: 140.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("images/homer2.png")
                  )
                ),
              )

            ),
            TextField(
              decoration: InputDecoration(labelText: "Nome do cliente"),
              onChanged: (text){
                _orderEdited = true;
                setState(() {
                  _editedOrder.clientName = text;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: "Quantidade de Produtos"),
              onChanged: (text){
                _orderEdited = true;
                qtdItens = int.parse(text);
              },
              keyboardType: TextInputType.number,

            ),
          ],
        ),
      ),
    );
  }
}
