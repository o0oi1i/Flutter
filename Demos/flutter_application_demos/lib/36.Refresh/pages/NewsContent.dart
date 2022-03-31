import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

import 'package:flutter_html/style.dart';
import 'package:flutter_html/flutter_html.dart';

import 'dart:convert';

// ignore: must_be_immutable
class NewsContent extends StatefulWidget {
  Map arguments;

  NewsContent({Key key, this.arguments}) : super(key: key);

  _NewsContentState createState() => _NewsContentState(this.arguments);
}

class _NewsContentState extends State<NewsContent> {
  Map arguments;
  List _list = [];

  _NewsContentState(this.arguments);

  @override
  void initState() {
    super.initState();
    print(this.arguments);
    this._getData();
  }

  _getData() async {
    var apiUrl =
        "http://www.phonegap100.com/appapi.php?a=getPortalArticle&aid=${arguments["aid"]}";
    var response = await Dio().get(apiUrl);

    setState(() {
      this._list = json.decode(response.data)["result"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News Content")),
      body: ListView(
        children: <Widget>[
          Text(
            "${this._list.length > 0 ? this._list[0]["title"] : ''}",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 36),
          ),
          Text(
            "${this._list.length > 0 ? this._list[0]["aid"] : ''}",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 36),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Html(
              data: htmlData,
              style: {
                "html": Style(
                  backgroundColor: Colors.deepPurpleAccent,
                ),
                "p": Style(fontSize: FontSize.large),
                "table": Style(
                  backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                ),
                "tr": Style(
                  border: Border(bottom: BorderSide(color: Colors.grey)),
                ),
                "th": Style(
                  padding: EdgeInsets.all(6),
                  backgroundColor: Colors.grey,
                ),
                "td": Style(
                  padding: EdgeInsets.all(6),
                  alignment: Alignment.topLeft,
                ),
              },
              // onImageTap: (String? url, RenderContext context,
              //     Map<String, String> attributes, dom.Element? element) {
              //   //open image in webview, or launch image in browser, or any other logic here
              // },
              // onLinkTap: (String? url, RenderContext context,
              //     Map<String, String> attributes, dom.Element? element) {
              //   //open URL in webview, or launch URL in browser, or any other logic here
              // },
            ),
          )
          // Html(
          //   data: """
          //     <div>
          //       <h1>Demo Page  1111</h1>
          //       <p>This is a fantastic product that you should buy!</p>
          //       <h3>Features</h3>
          //       <ul>
          //         <li>It actually works</li>
          //         <li>It exists</li>
          //         <li>It doesn't cost much!</li>
          //       </ul>
          //       <!--You can pretty much put any html in here!-->
          //     </div>
          //   """,
          //   // onLinkTap: (String? url, RenderContext context,
          //   //     Map<String, String> attributes, dom.Element? element) {
          //   //   //open URL in webview, or launch URL in browser, or any other logic here
          //   // },
          //   style: {
          //     "div": Style(
          //       margin: EdgeInsets.all(16),
          //       border: Border.all(width: 6),
          //       backgroundColor: Colors.grey,
          //     ),
          //   },
          //   // onImageTap: (String? url, RenderContext context,
          //   //     Map<String, String> attributes, dom.Element? element) {
          //   //   //open image in webview, or launch image in browser, or any other logic here
          //   // },
          // ),
        ],
      ),
    );
  }
}

const htmlData = r"""
<p id='top'><a href='#bottom'>Scroll to bottom</a></p>
      <h1>Header 1</h1>
      <h2>Header 2</h2>
      <h3>Header 3</h3>
      <h4>Header 4</h4>
      <h5>Header 5</h5>
      <h6>Header 6</h6>
      <h3>Ruby Support:</h3>
      <p>
        <ruby>
          漢<rt>かん</rt>
          字<rt>じ</rt>
        </ruby>
        &nbsp;is Japanese Kanji.
      </p>
      <h3>Support for maxLines:</h3>
      <h5>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vestibulum sapien feugiat lorem tempor, id porta orci elementum. Fusce sed justo id arcu egestas congue. Fusce tincidunt lacus ipsum, in imperdiet felis ultricies eu. In ullamcorper risus felis, ac maximus dui bibendum vel. Integer ligula tortor, facilisis eu mauris ut, ultrices hendrerit ex. Donec scelerisque massa consequat, eleifend mauris eu, mollis dui. Donec placerat augue tortor, et tincidunt quam tempus non. Quisque sagittis enim nisi, eu condimentum lacus egestas ac. Nam facilisis luctus ipsum, at aliquam urna fermentum a. Quisque tortor dui, faucibus in ante eget, pellentesque mattis nibh. In augue dolor, euismod vitae eleifend nec, tempus vel urna. Donec vitae augue accumsan ligula fringilla ultrices et vel ex.</h5>
      <h3>Support for <code>sub</code>/<code>sup</code></h3>
      Solve for <var>x<sub>n</sub></var>: log<sub>2</sub>(<var>x</var><sup>2</sup>+<var>n</var>) = 9<sup>3</sup>
      <p>One of the most <span>common</span> equations in all of physics is <br /><var>E</var>=<var>m</var><var>c</var><sup>2</sup>.</p>
      <h3>Inline Styles:</h3>
      <p>The should be <span style='color: blue;'>BLUE style='color: blue;'</span></p>
      <p>The should be <span style='color: red;'>RED style='color: red;'</span></p>
      <p>The should be <span style='color: rgba(0, 0, 0, 0.10);'>BLACK with 10% alpha style='color: rgba(0, 0, 0, 0.10);</span></p>
      <p>The should be <span style='color: rgb(0, 97, 0);'>GREEN style='color: rgb(0, 97, 0);</span></p>
      <p>The should be <span style='background-color: red; color: rgb(0, 97, 0);'>GREEN style='color: rgb(0, 97, 0);</span></p>
      <p style="text-align: center;"><span style="color: rgba(0, 0, 0, 0.95);">blasdafjklasdlkjfkl</span></p>
      <p style="text-align: right;"><span style="color: rgba(0, 0, 0, 0.95);">blasdafjklasdlkjfkl</span></p>
      <p style="text-align: justify;"><span style="color: rgba(0, 0, 0, 0.95);">blasdafjklasdlkjfkl</span></p>
      <p style="text-align: center;"><span style="color: rgba(0, 0, 0, 0.95);">blasdafjklasdlkjfkl</span></p>
      <h3>Table support (with custom styling!):</h3>
      <p>
      <q>Famous quote...</q>
      </p>
      <table>
      <colgroup>
        <col width="50%" />
        <col span="2" width="25%" />
      </colgroup>
      <thead>
      <tr><th>One</th><th>Two</th><th>Three</th></tr>
      </thead>
      <tbody>
      <tr>
        <td rowspan='2'>Rowspan\nRowspan\nRowspan\nRowspan\nRowspan\nRowspan\nRowspan\nRowspan\nRowspan\nRowspan</td><td>Data</td><td>Data</td>
      </tr>
      <tr>
        <td colspan="2"><img alt='Google' src='https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png' /></td>
      </tr>
      </tbody>
      <tfoot>
      <tr><td>fData</td><td>fData</td><td>fData</td></tr>
      </tfoot>
      </table>
      <h3>Custom Element Support (inline: <bird></bird> and as block):</h3>
      <flutter></flutter>
      <flutter horizontal></flutter>
      <h3 id='middle'>SVG support:</h3>
      <svg id='svg1' viewBox='0 0 100 100' xmlns='http://www.w3.org/2000/svg'>
            <circle r="32" cx="35" cy="65" fill="#F00" opacity="0.5"/>
            <circle r="32" cx="65" cy="65" fill="#0F0" opacity="0.5"/>
            <circle r="32" cx="50" cy="35" fill="#00F" opacity="0.5"/>
      </svg>
      <h3>List support:</h3>
      <ol>
            <li>This</li>
            <li><p>is</p></li>
            <li>an</li>
            <li>
            ordered
            <ul>
            <li>With<br /><br />...</li>
            <li>a</li>
            <li>nested</li>
            <li>unordered
            <ol style="list-style-type: lower-alpha;" start="5">
            <li>With a nested</li>
            <li>ordered list</li>
            <li>with a lower alpha list style</li>
            <li>starting at letter e</li>
            </ol>
            </li>
            <li>list</li>
            </ul>
            </li>
            <li>list! Lorem ipsum dolor sit amet.</li>
            <li><h2>Header 2</h2></li>
            <h2><li>Header 2</li></h2>
      </ol>
      <h3>Link support:</h3>
      <p>
        Linking to <a href='https://github.com'>websites</a> has never been easier.
      </p>
""";
