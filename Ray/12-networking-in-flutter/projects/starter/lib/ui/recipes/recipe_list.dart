/*
 * Copyright (c) 2020 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology.  Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../network/recipe_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../colors.dart';
import '../recipe_card.dart';
import '../widgets/custom_dropdown.dart';
import '../../network/recipe_service.dart';

class RecipeList extends StatefulWidget {
  @override
  _RecipeListState createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  static const String prefSearchKey = "previousSearches";

  TextEditingController searchTextController;
  ScrollController _scrollController = ScrollController();
  List<APIHits> currentSearchList = List<APIHits>();
  int currentCount = 0;
  int currentStartPosition = 0;
  int currentEndPosition = 20;
  int pageCount = 20;
  bool hasMore = false;
  bool loading = false;
  bool inErrorState = false;
  List<String> previousSearches = List<String>();

  @override
  void initState() {
    super.initState();
    getPreviousSearches();
    searchTextController = TextEditingController(text: "");
    _scrollController
      ..addListener(() {
        var triggerFetchMoreSize =
            0.7 * _scrollController.position.maxScrollExtent;

        if (_scrollController.position.pixels > triggerFetchMoreSize) {
          if (hasMore &&
              currentEndPosition < currentCount &&
              !loading &&
              !inErrorState) {
            setState(() {
              loading = true;
              currentStartPosition = currentEndPosition;
              currentEndPosition =
                  min(currentStartPosition + pageCount, currentCount);
            });
          }
        }
      });
  }

  // 1
  Future<APIRecipeQuery> getRecipeData(String query, int from, int to) async {
    // 2
    var recipeJson = await RecipeService().getRecipes(query, from, to);
    // 3
    var recipeMap = json.decode(recipeJson);
    // 4
    return APIRecipeQuery.fromJson(recipeMap);
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  void savePreviousSearches() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(prefSearchKey, previousSearches);
  }

  void getPreviousSearches() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(prefSearchKey)) {
      previousSearches = prefs.getStringList(prefSearchKey);
      if (previousSearches == null) {
        previousSearches = List<String>();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _buildSearchCard(),
            _buildRecipeLoader(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                startSearch(searchTextController.text);
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
            ),
            SizedBox(
              width: 6.0,
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Search'),
                    autofocus: false,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (value) {
                      if (!previousSearches.contains(value)) {
                        previousSearches.add(value);
                        savePreviousSearches();
                      }
                    },
                    controller: searchTextController,
                  )),
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.arrow_drop_down, color: lightGrey),
                    onSelected: (String value) {
                      searchTextController.text = value;
                      startSearch(searchTextController.text);
                    },
                    itemBuilder: (BuildContext context) {
                      return previousSearches
                          .map<CustomDropdownMenuItem<String>>((String value) {
                        return CustomDropdownMenuItem<String>(
                          text: value,
                          value: value,
                          callback: () {
                            setState(() {
                              previousSearches.remove(value);
                              Navigator.pop(context);
                            });
                          },
                        );
                      }).toList();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void startSearch(String value) {
    setState(() {
      currentSearchList.clear();
      currentCount = 0;
      currentEndPosition = pageCount;
      currentStartPosition = 0;
      hasMore = true;
      value = value.trim();
      if (!previousSearches.contains(value)) {
        previousSearches.add(value);
        savePreviousSearches();
      }
    });
  }

  Widget _buildRecipeLoader(BuildContext context) {
    // 1
    if (searchTextController.text.length < 3) {
      return Container();
    }
    // 2
    return FutureBuilder<APIRecipeQuery>(
      // 3
      future: getRecipeData(searchTextController.text.trim(),
          currentStartPosition, currentEndPosition),
      // 4
      builder: (context, snapshot) {
        // 5
        if (snapshot.connectionState == ConnectionState.done) {
          // 6
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString(),
                  textAlign: TextAlign.center, textScaleFactor: 1.3),
            );
          }

          // 7
          loading = false;
          final query = snapshot.data;
          inErrorState = false;
          currentCount = query.count;
          hasMore = query.more;
          currentSearchList.addAll(query.hits);
          // 8
          if (query.to < currentEndPosition) {
            currentEndPosition = query.to;
          }
          // 9
          return _buildRecipeList(context, currentSearchList);
        }
        // 10
        else {
          // 11
          if (currentCount == 0) {
            // Show a loading indicator while waiting for the movies
            return Center(child: CircularProgressIndicator());
          } else {
            // 12
            return _buildRecipeList(context, currentSearchList);
          }
        }
      },
    );
  }

  // 1
  Widget _buildRecipeList(BuildContext recipeListContext, List<APIHits> hits) {
    // 2
    var size = MediaQuery.of(context).size;
    final double itemHeight = 310;
    final double itemWidth = size.width / 2;
    // 3
    return Flexible(
      // 4
      child: GridView.builder(
        // 5
        controller: _scrollController,
        // 6
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (itemWidth / itemHeight),
        ),
        // 7
        itemCount: hits.length,
        // 8
        itemBuilder: (BuildContext context, int index) {
          return _buildRecipeCard(recipeListContext, hits, index);
        },
      ),
    );
  }

  Widget _buildRecipeCard(BuildContext context, List<APIHits> hits, int index) {
    APIRecipe recipe = hits[index].recipe;
    return GestureDetector(
      onTap: () {},
      child: recipeCard(recipe),
    );
  }
}
