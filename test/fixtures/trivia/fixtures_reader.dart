import 'dart:io';

String fixture(String name) => File('test/fixtures/trivia/$name').readAsStringSync();
