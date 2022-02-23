import 'dart:io';
import 'package:ecommerce_app/providers/general_provider.dart';
import 'package:ecommerce_app/providers/location_provider.dart';
import 'package:ecommerce_app/providers/sections_provider.dart';
import 'package:ecommerce_app/widgets/address_bar.dart';
import 'package:ecommerce_app/screens/explore_screen/widgets/categories_card.dart';
import 'package:ecommerce_app/screens/explore_screen/widgets/explore_list.dart';
import 'package:ecommerce_app/screens/explore_screen/widgets/titled_widget.dart';
import 'package:ecommerce_app/screens/explore_screen/widgets/offers_list.dart';
import 'package:ecommerce_app/screens/shops_screen/shops_screen.dart';
import 'package:ecommerce_app/services/cc_response.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:ecommerce_app/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/constants.dart';


class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {

  @override
  void initState() {

    //TODO: implement initState
    super.initState();
    context.read<SectionsProvider>().getSections();
    context.read<LocationProvider>().determineCurrentLocation();
  }
 /* @override
  void didChangeDependencies() {

   // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if(context.read<SectionsProvider>().sectionsResponse.status == Status.FRESH){
      context.read<SectionsProvider>().getSections();
    }
  }*/
  //in case the context.read inside initState doesn't work, which is most probably in other projects
  @override
  Widget build(BuildContext context) {
    SizeConfig(context);
    var watcher = context.watch<SectionsProvider>();
    // TODO: implement build
    return Scaffold(
      body: watcher.sectionsResponse.status == Status.LOADING
        ?Center(child: CircularProgressIndicator())
        :SingleChildScrollView(
          child: Column(
          children: [
            Container(
              height:  getProportionateScreenHeight(500),
              width:  double.infinity,
              child: Stack(
                children: [
                  Container(
                    height: getProportionateScreenHeight(300),
                    color: kPrimaryColor,
                  ),
                  SafeArea(
                    child: Container(
                      margin: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            AddressBar(),
                            SizedBox(height: 20,),
                            SearchTextField(
                              onWhiteBackground: false,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TitledWidget(
                                title: 'Categories',
                                widget: CategoriesCard(),
                                isOnWhiteBackground: false,
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  TitledWidget(
                  title:'Offers',
                  widget: OffersList(),
                  isOnWhiteBackground: true,
                ),
                  TitledWidget(
                    title:'Explore',
                    widget: ExploreList(),
                    isOnWhiteBackground: true,
                  ),

                ]
              ),
            )
          ],
      ),
        )
    );
  }
  /*@override
  Widget build(BuildContext context) {
    var watcher = context.watch<SectionsProvider>();
    return Scaffold(
      appBar: AppBar(title: Text('Categories')),
      body: watcher.sectionsResponse.status == Status.LOADING
      ?Center(child: CircularProgressIndicator())
      : watcher.sectionsResponse.status == Status.ERROR
          ?Center(
        child: Text(watcher.sectionsResponse.message!)
      )
        :ListView.builder(
        itemCount: watcher.sectionsResponse.data!.length,
        itemBuilder: (ctx, index){
          return ListTile
          (
            onTap: () {
              context.read<GeneralProvider>().selectedSectionId =
                  watcher.sectionsResponse.data![index].id;
              Navigator.of(context).pushNamed(ShopsScreen.namedRoute);
              print(context.read<GeneralProvider>().selectedSectionId);
            } ,
            title:Text(watcher.sectionsResponse.data![index].name),
          );
        },),
    );
  }*/
}
