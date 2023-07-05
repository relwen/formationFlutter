import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String _searchText = '';
  List<String> _data = [
    'Lorem ipsum',
    'dolor sit amet',
    'consectetur adipiscing elit'
  ];

  List<TextSpan> _getHighlightedTextSpans(String text, String query) {
    final RegExp regex = RegExp(query, caseSensitive: false);
    final List<TextSpan> spans = [];

    int start = 0;
    while (start < text.length) {
      final match = regex.firstMatch(text);
      if (match != null) {
        final matchStart = match.start;
        final matchEnd = match.end;
        if (matchStart > start) {
          spans.add(TextSpan(text: text.substring(start, matchStart)));
        }
        spans.add(TextSpan(
          text: text.substring(matchStart, matchEnd),
          style: TextStyle(fontWeight: FontWeight.bold),
        ));
        start = matchEnd;
      } else {
        spans.add(TextSpan(text: text.substring(start)));
        break;
      }
    }

    return spans;
  }

  List<Widget> _buildFilteredItems() {
    final List<Widget> filteredItems = [];

    for (final item in _data) {
      final lowerCaseItem = item.toLowerCase();
      final lowerCaseSearchText = _searchText.toLowerCase();

      if (lowerCaseItem.contains(lowerCaseSearchText)) {
        final textSpans = _getHighlightedTextSpans(item, _searchText);
        filteredItems.add(ListTile(
          title: RichText(text: TextSpan(children: textSpans)),
        ));
      }
    }

    return filteredItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _searchText = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Search',
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: _buildFilteredItems(),
            ),
          ),
        ],
      ),
    );
  }
}
