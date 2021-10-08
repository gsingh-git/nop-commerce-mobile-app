import 'package:flutter/material.dart';
import 'package:nopapp/models/category_model.dart' as category;
import 'package:cached_network_image/cached_network_image.dart';

class CategoryList extends StatefulWidget {
  category.CategoryModel? _categoryModel;
  CategoryList(category.CategoryModel categoryModel) {
    this._categoryModel = categoryModel;
  }

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  buildItem(category.Category cat, BuildContext context, int index) {
    return Container(
      width: MediaQuery.of(context).size.width / 5,
      height: MediaQuery.of(context).size.height / 11,
      padding: const EdgeInsets.all(1.0),
      child: CachedNetworkImage(
        imageUrl: cat.image!.src!,
        height: MediaQuery.of(context).size.height / 11,
        width: MediaQuery.of(context).size.width / 6,
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 11,
      child: ListView.builder(
        itemCount: widget._categoryModel!.categories!.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return buildItem(
              widget._categoryModel!.categories![index], context, index);
        },
      ),
    );
  }
}
