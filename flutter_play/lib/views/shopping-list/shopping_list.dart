import 'package:flutter/material.dart';

class Product {
  final String name;
  final int id;

  Product({
    this.id,
    this.name
  });
}

// Creating a custom callback type (based on VoidCallback creation)
typedef CartChangedCallback = void Function(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  final bool inCart;
  final CartChangedCallback onCartChanged;
  final Product product;

  ShoppingListItem({
    this.product,
    this.inCart,
    this.onCartChanged
  })
  // This is a call to the super() constructor, just like base() in C#
  : super(key: ObjectKey(product.id));

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if(!inCart) return null;
    //
    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCartChanged(product, inCart);
      },
      leading: CircleAvatar(
        child: Text(product.name[0].toUpperCase()),
        backgroundColor: _getColor(context),
      ),
      title: Text(product.name, style: _getTextStyle(context))
    );
  }

}

class ShoppingList extends StatefulWidget {
  final List<Product> products;

  ShoppingList({
    Key key,
    this.products
  }) : super(key: key);

  @override
  _ShoppingListState createState() {
    return _ShoppingListState();
  }

}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = Set<Product>();

  void _handleCartChangedProduct(Product product, bool inCart) {
    setState(() {
      if(inCart) {
        _shoppingCart.remove(product);
      } else {
        _shoppingCart.add(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: ListTileTheme(
        child: ListView(
        padding: EdgeInsets.symmetric(vertical: 8),
        children: widget.products.map((product) {
          return ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChangedProduct,
          );
        }).toList(),
      ),
      ),
    );
  }

}