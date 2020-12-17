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
import 'dart:math';

import 'package:flutter/material.dart';
import '../widgets/custom_dropdown.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecipeList extends StatefulWidget {
  @override
  _RecipeListState createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  static const String prefSearchKey = "previousSearches";

  TextEditingController searchTextController;
  ScrollController _scrollController = ScrollController();
  List currentSearchList = List();
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

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  void savePreviousSearches() async {
    // 1
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // 2
    prefs.setStringList(prefSearchKey, previousSearches);
  }

  void getPreviousSearches() async {
    // 1
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // 2
    if (prefs.containsKey(prefSearchKey)) {
      // 3
      previousSearches = prefs.getStringList(prefSearchKey);
      // 4
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
            Icon(Icons.search),
            SizedBox(
              width: 6.0,
            ),
            Expanded(
              // 3
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                ),
                autofocus: false,
                // 4
                textInputAction: TextInputAction.done,
                // 5
                onSubmitted: (value) {
                  if (!previousSearches.contains(value)) {
                    previousSearches.add(value);
                    savePreviousSearches();
                  }
                },
                controller: searchTextController,
              ),
            ),
            // 6
            PopupMenuButton<String>(
              icon: const Icon(Icons.arrow_drop_down),
              // 7
              onSelected: (String value) {
                searchTextController.text = value;
                startSearch(searchTextController.text);
              },
              itemBuilder: (BuildContext context) {
                // 8
                return previousSearches.map<CustomDropdownMenuItem<String>>(
                  (String value) {
                    return CustomDropdownMenuItem<String>(
                      text: value,
                      value: value,
                      callback: () {
                        setState(
                          () {
                            // 9
                            previousSearches.remove(value);
                            Navigator.pop(context);
                          },
                        );
                      },
                    );
                  },
                ).toList();
              },
            ),
          ],
        ),
      ),
    );
  }

  void startSearch(String value) {
    // 1
    setState(
      () {
        // 2
        currentSearchList.clear();
        currentCount = 0;
        currentEndPosition = pageCount;
        currentStartPosition = 0;
        hasMore = true;
        // 3
        if (!previousSearches.contains(value)) {
          // 4
          previousSearches.add(value);
          // 5
          savePreviousSearches();
        }
      },
    );
  }

  Widget _buildRecipeLoader(BuildContext context) {
    if (searchTextController.text.length < 3) {
      return Container();
    }
    // Show a loading indicator while waiting for the movies
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
