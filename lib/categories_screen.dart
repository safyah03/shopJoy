import 'package:flutter/material.dart';
import 'package:shop_joy/dio/api_provider.dart';
import 'package:shop_joy/products_categories_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  bool isLoading = true;
  List<String> categoryList = [];
  List<String> filteredCategoryList = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getCategoryList();
    _searchController.addListener(() {
      filterCategories();
    });
  }

  Future getCategoryList() async {
    final categories = await ApiProvider().getCategoryList();
    setState(() {
      categoryList = categories;
      filteredCategoryList = categories;
      isLoading = false;
    });
  }

  void filterCategories() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredCategoryList = categoryList
          .where((category) => category.toLowerCase().contains(query))
          .toList();
    });
  }

  final Map<String, String> categoryImages = {
    'beauty': 'assets/images/beauty.png',
    'fragrances': 'assets/images/fragrances.png',
    'furniture': 'assets/images/furniture.png',
    'groceries': 'assets/images/groceries.png',
    'home-decoration': 'assets/images/home-decoration.png',
    'kitchen-accessories': 'assets/images/kitchen-accessories.png',
    'laptops': 'assets/images/laptops.png',
    'mens-shirts': 'assets/images/mens-shirts.png',
    'mens-shoes': 'assets/images/mens-shoes.png',
    'mens-watches': 'assets/images/mens-watches.png',
    'mobile-accessories': 'assets/images/mobile-accessories.png',
    'motorcycle': 'assets/images/motorcycle.png',
    'skin-care': 'assets/images/skin-care.png',
    'smartphones': 'assets/images/smartphones.png',
    'sports-accessories': 'assets/images/sports-accessories.png',
    'sunglasses': 'assets/images/sunglasses.png',
    'tablets': 'assets/images/tablets.png',
    'tops': 'assets/images/tops.png',
    'vehicle': 'assets/images/vehicle.png',
    'womens-bags': 'assets/images/womens-bags.png',
    'womens-dresses': 'assets/images/womens-dresses.png',
    'womens-jewellery': 'assets/images/womens-jewellery.png',
    'womens-shoes': 'assets/images/womens-shoes.png',
    'womens-watches': 'assets/images/womens-watches.png',
  };

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 45,
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Icon(
                      Icons.search,
                      size: 24,
                    ),
                  ),
                  hintText: 'Search...',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
                ),
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : GridView.builder(
                    padding: const EdgeInsets.all(8),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            childAspectRatio: 1.5,
                            mainAxisExtent: 170),
                    itemCount: filteredCategoryList.length,
                    itemBuilder: (context, index) {
                      String category = filteredCategoryList[index];
                      String imagePath =
                          categoryImages[category] ?? 'assets/images/logo.png';

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductsCategoriesScreen(category: category),
                            ),
                          );
                        },
                        child: Card(
                          color: Colors.blue[100],
                          elevation: 5,
                          margin: const EdgeInsets.all(8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(imagePath, width: 60, height: 60),
                              const SizedBox(height: 15),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6.0, vertical: 3),
                                  child: Text(
                                    category
                                        .split('-')
                                        .map((word) =>
                                            word[0].toUpperCase() +
                                            word.substring(1).toLowerCase())
                                        .join(' '),
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
