import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_joy/models/carts_model.dart';
import 'package:shop_joy/models/products_categories_model.dart';
import 'package:shop_joy/models/user_info_model.dart';

class ApiProvider {
  String baseUrl = "https://dummyjson.com";
  ProductsCategoriesModel? productsCategoriesModel;
  CartsModel? cartsModel;
  UserInfoModel? userInfoModel;

  Future userLogin({required String userName, required String password}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      FormData userData =
          FormData.fromMap({"username": userName, "password": password});

      Response response =
          await Dio().post("$baseUrl/auth/login", data: userData);
      await prefs.setString("userToken", response.data["token"]);
      await prefs.setInt("id", response.data['id']);

      print(response.data);

      String? userToken = prefs.getString("userToken");
      int? userId = prefs.getInt('id');
      print("User Token => $userToken");
      print("User ID => $userId");
      await prefs.remove("userToken");
      String? deleteUser = prefs.getString("userToken");
      print("User Token => $deleteUser");
      return "Login Success";
    } catch (e) {
      if (e is DioException) {
        print(e.response?.data["message"]);
        return e.response?.data["message"];
      }
    }
  }

  Future userRegister(
      {required String email,
      required String userName,
      required String password}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      FormData userData = FormData.fromMap(
          {"email": email, "username": userName, "password": password});

      Response response =
          await Dio().post('$baseUrl/users/add', data: userData);

      print(response.data);

      return "Register Success";
    } catch (e) {
      if (e is DioException) {
        print(e.response?.data["message"]);
        return e.response?.data["message"];
      }
    }
  }

  Future<List<String>> getCategoryList() async {
    try {
      Response response = await Dio().get("$baseUrl/products/category-list");
      if (response.statusCode == 200) {
        return List<String>.from(response.data);
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<ProductsCategoriesModel?> getProductsCategories(
      String category) async {
    try {
      Response response =
          await Dio().get("$baseUrl/products/category/$category");

      productsCategoriesModel = ProductsCategoriesModel.fromJson(response.data);
      if (response.statusCode == 200) {
        return productsCategoriesModel;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print(e);
      return ProductsCategoriesModel();
    }
  }

  Future<CartsModel?> getUserCarts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('id');
    try {
      Response response = await Dio().get('$baseUrl/carts/$userId');
      cartsModel = CartsModel.fromJson(response.data);
      if (response.statusCode == 200) {
        return cartsModel;
      } else {
        throw Exception('Failed to load carts');
      }
    } catch (e) {
      print(e);
      return CartsModel();
    }
  }

  Future<UserInfoModel?> getUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('id');
    try {
      Response response = await Dio().get('$baseUrl/users/$userId');
      userInfoModel = UserInfoModel.fromJson(response.data);
      if (response.statusCode == 200) {
        return userInfoModel;
      } else {
        throw Exception('Failed to load user info');
      }
    } catch (e) {
      print(e);
      return UserInfoModel();
    }
  }
}
