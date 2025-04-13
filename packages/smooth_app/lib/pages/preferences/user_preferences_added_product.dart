import 'package:flutter/material.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:smooth_app/helpers/launch_url_helper.dart';
import 'package:smooth_app/pages/preferences/abstract_user_preferences.dart';
import 'package:smooth_app/pages/preferences/user_preferences_item.dart';
import 'package:smooth_app/pages/preferences/user_preferences_list_tile.dart';
import 'package:smooth_app/pages/preferences/user_preferences_page.dart';
import 'package:smooth_app/query/product_query.dart';

/// Display of "Products I Added" for the preferences page.
class UserPreferencesAddedProducts extends AbstractUserPreferences {
  UserPreferencesAddedProducts({
    required super.context,
    required super.userPreferences,
    required super.appLocalizations,
    required super.themeData,
  });

  @override
  PreferencePageType getPreferencePageType() => PreferencePageType.ADDED_PRODUCTS;

  @override
  String getTitleString() => appLocalizations.user_products_added_title;

  @override
  String getSubtitleString() => appLocalizations.user_products_added_subtitle;

  @override
  IconData getLeadingIconData() => Icons.inventory_2;

  @override
  Icon? getForwardIcon() => UserPreferencesListTile.getTintedIcon(
    Icons.open_in_new,
    context,
  );

  @override
  String? getHeaderAsset() => 'assets/preferences/added_products.svg';

  @override
  Color? getHeaderColor() => const Color(0xFFE8F5E9);

  @override
  Future<void> runHeaderAction() async {
    final String? userId = OpenFoodAPIConfiguration.globalUser?.userId;
    if (userId != null) {
      await LaunchUrlHelper.launchURL(
        ProductQuery.replaceSubdomain(
          'https://world.openfoodfacts.org/contributor/$userId',
        ),
      );
    }
  }

  @override
  List<UserPreferencesItem> getChildren() => <UserPreferencesItem>[];
}