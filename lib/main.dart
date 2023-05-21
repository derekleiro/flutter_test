import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyItem extends StatefulWidget {
  final Item? item;
  const MyItem({Key? key, this.item}) : super(key: key);

  @override
  State<MyItem> createState() => _MyItemState();
}

class _MyItemState extends State<MyItem> {
  int inCart = 1;

  void _increaseQuantity() {
    setState(() {
      inCart += 1;
    });
  }

  void _decreaseQuantity() {
    if (inCart != 1) {
      setState(() {
        inCart -= 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return (Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Container(
          color: const Color.fromARGB(255, 240, 240, 240),
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          child: Column(children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Image.network(widget.item!.image),
                    ),
                    Flexible(
                        flex: 3,
                        child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(widget.item!.description,
                                        style: const TextStyle(fontSize: 18.0)),
                                    Row(
                                      children: [
                                        const Text("Kes "),
                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Text(
                                                "${widget.item!.price * inCart}",
                                                style: const TextStyle(
                                                    fontSize: 22.0,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        Text(
                                            "/ $inCart item${inCart > 1 ? 's' : ''}"),
                                      ],
                                    ),
                                  ],
                                ),
                                if (widget.item!.outOfStock)
                                  const Text("This vendor is out of this item",
                                      style: TextStyle(color: Colors.red))
                                else
                                  const Text("In Stock",
                                      style: TextStyle(color: Colors.green))
                              ],
                            )))
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Row(
                        children: [
                          Expanded(
                              child: Material(
                            type: MaterialType.transparency,
                            child: Ink(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 230, 230, 230),
                              ),
                              child: InkWell(
                                onTap: _decreaseQuantity,
                                child: const SizedBox(
                                  height: 35,
                                  child: Center(
                                      child: Icon(
                                    Icons.remove,
                                    size: 20.0,
                                    color: Colors.black,
                                  )),
                                ),
                              ),
                            ),
                          )),
                          Expanded(
                              child: Material(
                                  type: MaterialType.transparency,
                                  child: Ink(
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: SizedBox(
                                          height: 35,
                                          child: Center(
                                              child: Text("$inCart")))))),
                          Expanded(
                              child: Material(
                            type: MaterialType.transparency,
                            child: Ink(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 230, 230, 230),
                              ),
                              child: InkWell(
                                onTap: _increaseQuantity,
                                child: const SizedBox(
                                  height: 35,
                                  child: Center(
                                      child: Icon(
                                    Icons.add,
                                    size: 20.0,
                                    color: Colors.black,
                                  )),
                                ),
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                    Flexible(
                        flex: 3,
                        child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(children: [
                              if (widget.item!.outOfStock)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Material(
                                      type: MaterialType.transparency,
                                      child: Ink(
                                        height: 35,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: const Color.fromARGB(
                                                    255, 220, 220, 220),
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(2.5)),
                                        child: InkWell(
                                          onTap: () {},
                                          child: const Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text(
                                                "Buy from other vendors",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Material(
                                      type: MaterialType.transparency,
                                      child: Ink(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(50.0)),
                                        child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                          onTap: () {},
                                          child: const Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Icon(
                                              Icons.delete,
                                              size: 20.0,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              else
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Material(
                                      type: MaterialType.transparency,
                                      child: Ink(
                                        height: 35,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: const Color.fromARGB(
                                                    255, 220, 220, 220),
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(2.5)),
                                        child: InkWell(
                                          onTap: () {},
                                          child: const Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text("Save for later",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Material(
                                      type: MaterialType.transparency,
                                      child: Ink(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(50.0)),
                                        child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                          onTap: () {},
                                          child: const Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Icon(
                                              Icons.delete,
                                              size: 20.0,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                            ])))
                  ],
                ),
              ],
            ),
          ]),
        )));
  }
}

class Item {
  final String image;
  final String description;
  final double price;
  final bool outOfStock;

  Item(this.image, this.description, this.price, this.outOfStock);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String image =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-5MCe35cjgpA2ktPdSGge3s8HlX_93ptTMY7g-XtQSTFgvToKW7pNPxb8RA7w2k4jOxg&usqp=CAU";
    List<Item> items = [
      Item(image, "Bifacial module up to 632w", 20011.50, true),
      Item(image, "Bifacial module up to 632w", 30106.00, false)
    ];

    return MaterialApp(
        home: Scaffold(
            body: Column(
      children: [for (Item item in items) MyItem(item: item)],
    )));
  }
}
