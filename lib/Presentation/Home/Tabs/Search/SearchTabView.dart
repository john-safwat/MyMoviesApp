import 'package:flutter/material.dart';
import 'package:mymoviesapp/Core/Theme/Theme.dart';
import 'package:mymoviesapp/Presentation/Home/Tabs/Search/SearchTabViewModel.dart';
import 'package:provider/provider.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

class SearchTabView extends StatefulWidget {
  @override
  State<SearchTabView> createState() => _SearchTabViewState();
}

class _SearchTabViewState extends State<SearchTabView> {
  ScrollController controller = ScrollController();

  SearchTabViewModel viewModel = SearchTabViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Column(
        children: [
          ScrollAppBar(
            controller: controller,
            title: TextFormField(
              cursorColor: MyTheme.gray,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: MyTheme.blackFour,
                hintText: "Search",
                hintStyle:const TextStyle(
                  color: MyTheme.gray,
                  fontSize: 18
                ),
                prefixIcon: const Icon(Icons.search ,color: MyTheme.gray,),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:const BorderSide(color: Colors.transparent , width: 0)
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:const BorderSide(color: Colors.transparent , width: 0)
                ),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:const BorderSide(color: Colors.transparent , width: 0)
                ),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:const BorderSide(color: Colors.transparent , width: 0)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:const BorderSide(color: Colors.transparent , width: 0)
                ),
              ),
            ),
            toolbarHeight:90,
          ),
          Expanded(
            child: Consumer<SearchTabViewModel>(
              builder: (context, value, child) {
                return ListView.builder(
                      controller: controller,
                      itemBuilder: (context, index) => Container(
                        color: Colors.red,
                        padding:const EdgeInsets.all(20),
                        margin:const EdgeInsets.all(10),
                        child: Center(
                          child: Text(index.toString()),
                        ),
                      ),
                      itemCount: 100,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
