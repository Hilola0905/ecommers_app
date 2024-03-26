
import 'package:ecommers_app/data/models/category_model.dart';
import 'package:ecommers_app/screens/add_category/add_category_screen.dart';
import 'package:ecommers_app/screens/add_product/add_product_screen.dart';
import 'package:ecommers_app/screens/product_detail/product_detail_screen.dart';
import 'package:ecommers_app/screens/tabs/tab_screen.dart';
import 'package:ecommers_app/screens/update_category/update_category_screen.dart';
import 'package:ecommers_app/screens/update_product/update_product_screen.dart';
import 'package:ecommers_app/screens/update_profile/update_profile.dart';
import 'package:flutter/material.dart';

import 'auth/login/login_screen.dart';
import 'auth/registor/registor_screen.dart';
import 'auth/splash/splash_screen.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return navigate(const SplashScreen());

      case RouteNames.tabRoute:
        return navigate(const TabScreen());

      case RouteNames.loginRoute:
        return navigate(const LoginScreen());

      case RouteNames.registerRoute:
        return navigate(const RegisterScreen());
      case RouteNames.updateProfileRoute:
        return navigate(const UpdateProfile());
        case RouteNames.addCategoryRoute:
        return navigate(const AddCategoryScreen());
      case RouteNames.updatedCategoryRoute:
        return navigate( UpdateCategoryScreen(categoryModel: settings.arguments as CategoryModel  ));
      case RouteNames.updatedProductRoute:
        return navigate( UpdateProductScreen(docId: settings.arguments as String));
 case RouteNames.addProductRoute:
        return navigate(const AddProductScreen());
 case RouteNames.detailProductRoute:
        return navigate(const ProductDetailScreen());

      default:
        return navigate(
          const Scaffold(
            body: Center(
              child: Text("This kind of rout does not exist!"),
            ),
          ),
        );
    }
  }

  static navigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}

class RouteNames {
  static const String splashScreen = "/";
  static const String tabRoute = "/tab_route";
  static const String loginRoute = "/login_route";
  static const String updateProfileRoute = "/update_profile_route";
  static const String registerRoute = "/register_route";
  static const String addCategoryRoute = "/add_category_route";
  static const String updatedCategoryRoute = "/update_category_route";
  static const String addProductRoute = "/add_Product_route";
  static const String detailProductRoute = "/ detail_Product_route";
  static const String updatedProductRoute = "/update_Product_route";
}
