import 'package:ecommerce_app/providers/sections_provider.dart';
import 'package:ecommerce_app/screens/explore_screen/widgets/section_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



import '../../../size_config.dart';class CategoriesCard extends StatelessWidget {
  const CategoriesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var watcher = context.watch<SectionsProvider>();
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: getProportionateScreenWidth(320),
        height: getProportionateScreenHeight(210),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SectionTile(section: watcher.sectionsResponse.data![0],),
                SectionTile(section: watcher.sectionsResponse.data![1],),
                SectionTile(section: watcher.sectionsResponse.data![2],),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SectionTile(section: watcher.sectionsResponse.data![3],),
                SectionTile(section: watcher.sectionsResponse.data![4],),
                SectionTile(section: watcher.sectionsResponse.data![5],),
                SectionTile(section: watcher.sectionsResponse.data![6],),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
