// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Welcome to Flutter',
      home: RandomWords()
      /*Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: const Center(
          child: RandomWords(),
        ),
      ),*/
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    /*
    final wordPair = WordPair.random();
    return new Text(wordPair.asPascalCase);
    */
    return Scaffold(
      appBar: AppBar(
        title: Text("Startup Name Generator"),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(16.0) ,
          itemBuilder:(context,i){
            if(i.isOdd) return new Divider();
            final index = i~/2;
            if(index >= _suggestions.length){
              _suggestions.addAll(generateWordPairs().take(10));
            }
            return ListTile(
              title: Text(
                  _suggestions[index].asPascalCase,
                  style: _biggerFont
              ),
            );
          }
      ),
    );
  }
}