// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    this.categories,
  });

  List<Category>? categories;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    this.name,
    this.localizedNames,
    this.description,
    this.categoryTemplateId,
    this.metaKeywords,
    this.metaDescription,
    this.metaTitle,
    this.parentCategoryId,
    this.pageSize,
    this.pageSizeOptions,
    this.priceRanges,
    this.showOnHomePage,
    this.includeInTopMenu,
    this.hasDiscountsApplied,
    this.published,
    this.deleted,
    this.displayOrder,
    this.createdOnUtc,
    this.allowCustomersToSelectPageSize,
    this.updatedOnUtc,
    this.roleIds,
    this.discountIds,
    this.storeIds,
    this.image,
    this.seName,
    required this.id,
  });

  String? name;
  List<LocalizedName>? localizedNames;
  dynamic? description;
  int? categoryTemplateId;
  String? metaKeywords;
  String? metaDescription;
  dynamic? metaTitle;
  int? parentCategoryId;
  int? pageSize;
  PageSizeOptions? pageSizeOptions;
  String? priceRanges;
  bool? showOnHomePage;
  bool? includeInTopMenu;
  dynamic? hasDiscountsApplied;
  bool? published;
  bool? deleted;
  int? displayOrder;
  DateTime? createdOnUtc;
  bool? allowCustomersToSelectPageSize;
  DateTime? updatedOnUtc;
  List<dynamic>? roleIds;
  List<dynamic>? discountIds;
  List<dynamic>? storeIds;
  Image? image;
  String? seName;
  int id;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
        localizedNames: List<LocalizedName>.from(
            json["localized_names"].map((x) => LocalizedName.fromJson(x))),
        description: json["description"],
        categoryTemplateId: json["category_template_id"],
        metaKeywords:
            json["meta_keywords"] == null ? null : json["meta_keywords"],
        metaDescription:
            json["meta_description"] == null ? null : json["meta_description"],
        metaTitle: json["meta_title"],
        parentCategoryId: json["parent_category_id"],
        pageSize: json["page_size"],
        pageSizeOptions: pageSizeOptionsValues.map![json["page_size_options"]],
        priceRanges: json["price_ranges"] == null ? null : json["price_ranges"],
        showOnHomePage: json["show_on_home_page"],
        includeInTopMenu: json["include_in_top_menu"],
        hasDiscountsApplied: json["has_discounts_applied"],
        published: json["published"],
        deleted: json["deleted"],
        displayOrder: json["display_order"],
        createdOnUtc: DateTime.parse(json["created_on_utc"]),
        allowCustomersToSelectPageSize:
            json["allow_customers_to_select_page_size"],
        updatedOnUtc: DateTime.parse(json["updated_on_utc"]),
        roleIds: List<dynamic>.from(json["role_ids"].map((x) => x)),
        discountIds: List<dynamic>.from(json["discount_ids"].map((x) => x)),
        storeIds: List<dynamic>.from(json["store_ids"].map((x) => x)),
        image: Image.fromJson(json["image"]),
        seName: json["se_name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "localized_names":
            List<dynamic>.from(localizedNames!.map((x) => x.toJson())),
        "description": description,
        "category_template_id": categoryTemplateId,
        "meta_keywords": metaKeywords == null ? null : metaKeywords,
        "meta_description": metaDescription == null ? null : metaDescription,
        "meta_title": metaTitle,
        "parent_category_id": parentCategoryId,
        "page_size": pageSize,
        "page_size_options": pageSizeOptionsValues.reverse![pageSizeOptions],
        "price_ranges": priceRanges == null ? null : priceRanges,
        "show_on_home_page": showOnHomePage,
        "include_in_top_menu": includeInTopMenu,
        "has_discounts_applied": hasDiscountsApplied,
        "published": published,
        "deleted": deleted,
        "display_order": displayOrder,
        "created_on_utc": createdOnUtc!.toIso8601String(),
        "allow_customers_to_select_page_size": allowCustomersToSelectPageSize,
        "updated_on_utc": updatedOnUtc!.toIso8601String(),
        "role_ids": List<dynamic>.from(roleIds!.map((x) => x)),
        "discount_ids": List<dynamic>.from(discountIds!.map((x) => x)),
        "store_ids": List<dynamic>.from(storeIds!.map((x) => x)),
        "image": image!.toJson(),
        "se_name": seName,
        "id": id,
      };
}

class Image {
  Image({
    this.src,
    this.attachment,
    this.seoFilename,
    required this.id,
  });

  String? src;
  dynamic attachment;
  dynamic seoFilename;
  int id;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        src: json["src"],
        attachment: json["attachment"],
        seoFilename: json["seoFilename"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "src": src,
        "attachment": attachment,
        "seoFilename": seoFilename,
        "id": id,
      };
}

class LocalizedName {
  LocalizedName({
    required this.languageId,
    required this.localizedName,
  });

  int languageId;
  String localizedName;

  factory LocalizedName.fromJson(Map<String, dynamic> json) => LocalizedName(
        languageId: json["language_id"],
        localizedName: json["localized_name"],
      );

  Map<String, dynamic> toJson() => {
        "language_id": languageId,
        "localized_name": localizedName,
      };
}

enum PageSizeOptions { THE_639 }

final pageSizeOptionsValues = EnumValues({"6, 3, 9": PageSizeOptions.THE_639});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
