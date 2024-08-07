import 'package:flutter/material.dart';
import 'package:shop_joy/dio/api_provider.dart';
import 'package:shop_joy/models/products_categories_model.dart';

class ProductsCategoriesScreen extends StatefulWidget {
  final String category;
  const ProductsCategoriesScreen({super.key, required this.category});

  @override
  State<ProductsCategoriesScreen> createState() =>
      _ProductsCategoriesScreenState();
}

class _ProductsCategoriesScreenState extends State<ProductsCategoriesScreen> {
  bool isLoading = true;
  ProductsCategoriesModel? productsCategoriesModel;

  @override
  void initState() {
    super.initState();
    getProductsCategories();
  }

  Future getProductsCategories() async {
    productsCategoriesModel =
        await ApiProvider().getProductsCategories(widget.category);
    if (productsCategoriesModel == null) {
      // Handle the case where productsCategoriesModel is null
      print('Error: productsCategoriesModel is null');
      return;
    }
    print('Products Categories Model: $productsCategoriesModel');
    print('Products: ${productsCategoriesModel!.products}');
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.category
            .split('-')
            .map((word) =>
                word[0].toUpperCase() + word.substring(1).toLowerCase())
            .join(' ')),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : productsCategoriesModel?.products == null
                  ? const Center(child: Text('No products available'))
                  : GridView.builder(
                      padding: const EdgeInsets.all(8),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              childAspectRatio: 1.5,
                              mainAxisExtent: 370),
                      itemCount: productsCategoriesModel!.products!.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> product = productsCategoriesModel!
                            .products![index] as Map<String, dynamic>;
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
                                image: NetworkImage(product["thumbnail"]),
                                width: 130,
                                height: 130,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 130,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product["title"],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                      '____________________',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'price: ',
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey[700]),
                                        ),
                                        Text(
                                          product["price"].toString(),
                                          style: const TextStyle(
                                              color: Colors.blue, fontSize: 13),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'discount percentage: ',
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey[700]),
                                        ),
                                        Text(
                                          product["discountPercentage"]
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.red, fontSize: 13),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      product["description"],
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 11),
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      height: 27,
                                      child: FloatingActionButton.extended(
                                        onPressed: () {},
                                        elevation: 0,
                                        icon: const Icon(
                                          Icons.add,
                                          size: 15,
                                        ),
                                        label: const Text(
                                          "Add to cart",
                                          style: TextStyle(fontSize: 13),
                                        ),
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
      ),
    );
  }
}
