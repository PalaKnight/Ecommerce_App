import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/providers/subCategories_provider.dart';
import 'package:ecommerce_app/screens/items_screen/widgets/items_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class SectionsAndItems extends StatefulWidget {
  const SectionsAndItems({Key? key}) : super(key: key);

  @override
  _SectionsAndItemsState createState() => _SectionsAndItemsState();
}

class _SectionsAndItemsState extends State<SectionsAndItems> with TickerProviderStateMixin {
  late TabController _tabController ;
  bool isInitialized = false;
  ItemScrollController _itemScrollController = ItemScrollController();
  ItemPositionsListener _itemPositionsListener = ItemPositionsListener.create();
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if(!isInitialized){
      isInitialized = true;
      var subCategories = context.read<SubCategoriesProvider>().subCategoriesResponse.data!;
      _tabController = TabController(length: subCategories.length, vsync: this);
      _itemPositionsListener.itemPositions.addListener(() {monitorChanges();});
    }
  }

  void monitorChanges() {
    if(_itemPositionsListener.itemPositions.value.isNotEmpty){
      var min = _itemPositionsListener.itemPositions.value.where(
              (element) => element.itemTrailingEdge > 0.8
      ).reduce(
              (min, pos) => pos.itemTrailingEdge < min.itemTrailingEdge ?  pos : min
      ).index;
      if( min != _tabController.index){
      _tabController.index = min;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var subCategories = context.read<SubCategoriesProvider>().subCategoriesResponse.data!;
    return Expanded(
      child: Column(
      children: [
        Positioned(
          bottom: -25,
          child: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: kGreyTextColor,
            indicatorColor: kPrimaryColor ,
            controller: _tabController,
              isScrollable: true,
              onTap: (index) {
              _itemScrollController.scrollTo(index: index, duration: Duration(milliseconds: 200));
              },
              tabs:[...subCategories.map((e) => Tab(
                text: e.name,
              ),
              ),
              ],
          ),
        ),
        Expanded(
            child: ScrollablePositionedList.builder(
              itemPositionsListener: _itemPositionsListener,
              itemCount: subCategories.length,
              itemScrollController: _itemScrollController ,
              itemBuilder: (ctx, index) {
                return ItemsList(subCategory: subCategories[index]);
              },
            )
        ),
      ],
    ),
    );
  }
}
