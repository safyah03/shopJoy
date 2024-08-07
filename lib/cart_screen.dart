import 'package:flutter/material.dart';
import 'package:shop_joy/dio/api_provider.dart';
import 'package:shop_joy/models/carts_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isLoading = true;
  CartsModel? cartsModel;

  @override
  void initState() {
    super.initState();
    getUserCarts();
  }

  Future<void> getUserCarts() async {
    cartsModel = await ApiProvider().getUserCarts();
    if (cartsModel == null) {
      print('Error: cartsModel is null');
      return;
    }
    print('Carts Model: $cartsModel');
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: double.infinity,
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : cartsModel?.products == null
                ? const Center(child: Text('No Carts available'))
                : Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          padding: const EdgeInsets.all(8),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            childAspectRatio: 1.5,
                            mainAxisExtent: 320,
                          ),
                          itemCount: cartsModel!.products!.length,
                          itemBuilder: (context, index) {
                            Product product = cartsModel!.products![index];
                            return Card(
                              color: Colors.blue[100],
                              elevation: 5,
                              margin: const EdgeInsets.all(8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                    image:
                                        NetworkImage(product.thumbnail ?? ''),
                                    width: 130,
                                    height: 130,
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    width: 130,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.title ?? 'No Title',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Text('____________________',
                                            style:
                                                TextStyle(color: Colors.grey)),
                                        const SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Text(
                                              'Price: ',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.grey[700]),
                                            ),
                                            Text(
                                              product.price?.toString() ??
                                                  'N/A',
                                              style: const TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 13),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Discount Percentage: ',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.grey[700]),
                                            ),
                                            Text(
                                              product.discountPercentage
                                                      ?.toString() ??
                                                  'N/A',
                                              style: const TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 13),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Quantity: ',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.grey[700]),
                                            ),
                                            Text(
                                              product.quantity?.toString() ??
                                                  'N/A',
                                              style: const TextStyle(
                                                  color: Colors.purple,
                                                  fontSize: 13),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 15),
                                        Container(
                                          height: 27,
                                          child: FloatingActionButton.extended(
                                            backgroundColor: Colors.red,
                                            onPressed: () {},
                                            elevation: 0,
                                            icon: const Icon(Icons.remove,
                                                size: 13),
                                            label: const Text(
                                                "Remove from cart",
                                                style: TextStyle(fontSize: 11)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.blue[100],
                              borderRadius: BorderRadius.circular(17),
                              border: Border.all(color: Colors.blue, width: 3)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Total Price : ",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 20),
                              ),
                              Text(
                                cartsModel!.total.toString(),
                                style: const TextStyle(fontSize: 20),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}
