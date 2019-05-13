import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// 有状态的widget
class HomeStateWidget extends StatefulWidget {
  @override
  // 创建state
  createState() => new HomeStateWidgetState(); // 但行函数写法
}

class HomeStateWidgetState extends State<HomeStateWidget> {

  final _suggestions = List<WordPair>();
  final _saved = Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  // 初始化方法
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('列表'),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.collections_bookmark), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  // listView创建
  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.only(left: 16, top: 10, right: 16, bottom: 10),
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }

  // listViewRow创建
  Widget _buildRow(WordPair pair) {
    final _hasSaved = _saved.contains(pair);
    return new ListTile(
      contentPadding: const EdgeInsets.only(left: 8, right: 8),
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        _hasSaved ? Icons.favorite : Icons.favorite_border,
        color: _hasSaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (_hasSaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  // 页面跳转
  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
          builder: (context) {
            final tiles = _saved.map(
                  (pair) {
                return new ListTile(
                  title: new Text(
                    pair.asPascalCase,
                    style: _biggerFont,
                  ),
                );
              },
            );

            final divied = ListTile.divideTiles(
                context: context,
                tiles: tiles,
            ).toList();

            return new Scaffold(
              appBar: new AppBar(
                title: new Text('收藏夹'),
              ),
              body: new ListView(children: divied),
            );
          },
      )
    );
  }
}