import 'package:flutter/material.dart';
import './productModel.dart';
import './apiProductService.dart';

class productData extends StatelessWidget {
  productData({super.key});

  productAPI api = productAPI();

  @override
  Widget build(BuildContext context) {
    // api.getProducts();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
          future: api.getProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  // itemCount: snapshot.data.lenght,
                  itemBuilder: (context, index) {
                    Products products = snapshot.data[index];
                    return Card(
                      color: Colors.white,
                      child: Column(
                        children: [
                          AspectRatio(
                            aspectRatio: 2 / 1,
                            child: Image(image: NetworkImage(products.image)),
                          ),
                          Text(
                            products.title,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text('\$${products.price.toString()}'),
                        ],
                      ),
                    );
                  });
              // return ListView.builder(
              //   itemCount: 20,
              //   itemBuilder: (context, index) {
              //     Products products = snapshot.data[index];
              //     return ListTile(
              //       leading: CircleAvatar(
              //         backgroundImage: NetworkImage(products.image),
              //       ),
              //       title: Text(products.title),
              //       subtitle: Text(products.price.toString()),
              //     );
              //   },
              // );
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
