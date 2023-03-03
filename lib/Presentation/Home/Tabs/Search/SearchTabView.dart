import 'package:flutter/material.dart';
import 'package:mymoviesapp/Core/Theme/Theme.dart';
import 'package:mymoviesapp/Domain/UseCase/getSearchResultsUseCase.dart';
import 'package:mymoviesapp/Presentation/Home/Tabs/Search/SearchTabViewModel.dart';
import 'package:mymoviesapp/Presentation/Home/di.dart';
import 'package:provider/provider.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

class SearchTabView extends StatefulWidget {
  @override
  State<SearchTabView> createState() => _SearchTabViewState();
}

class _SearchTabViewState extends State<SearchTabView> {
  ScrollController controller = ScrollController();

  SearchTabViewModel viewModel = SearchTabViewModel(GetSearchResultsUseCase(injectSearchRepo()));

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Column(
        children: [
          ScrollAppBar(
            backgroundColor: MyTheme.backGroundColor,
            elevation: 0,
            controller: controller,
            title: TextField(
              onChanged: (value){
                viewModel.getSearchResults(value);
              },
              cursorColor: MyTheme.gray,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: MyTheme.blackFour,
                hintText: "Search",
                hintStyle: const TextStyle(color: MyTheme.gray, fontSize: 18),
                prefixIcon: const Icon(
                  Icons.search,
                  color: MyTheme.gray,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Colors.transparent, width: 0)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Colors.transparent, width: 0)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Colors.transparent, width: 0)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Colors.transparent, width: 0)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Colors.transparent, width: 0)),
              ),
            ),
            toolbarHeight: 90,
          ),
          Expanded(
            child: Consumer<SearchTabViewModel>(
              builder: (context, value, child) {
                if (value.errorMessage != null) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        value.errorMessage!,
                        style: const TextStyle(color: Colors.white),
                      ),
                      ElevatedButton(
                          onPressed: () {}, child: const Text("Try Again"))
                    ],
                  );
                }
                if (value.movies == null) {
                  return Center(
                    child: Image.asset('assets/images/Empty.png'),
                  );
                } else {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          controller: controller,
                          itemBuilder: (context, index) => Container(
                            color: Colors.red,
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.all(10),
                            child: Center(
                              child: Text(value.movies![index].title!),
                            ),
                          ),
                          itemCount: value.movies!.length,
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
