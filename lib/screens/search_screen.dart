import 'package:flutter/material.dart';
import 'package:joy/models/candi.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State <SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // TODO: 1. Declare the required variables
  List<Candi> _filteredCandis = [];
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build (BuildContext context) {
    return Scaffold(
    // TODO: 2. Create an appbar with the title Candi Search

    // TODO: 3. Create a body in the form of a Column

    // TODO: 4. Create a search TextField as a child of Column

    // TODO: 5. Create a search results ListView as a child of Column
    );
  }
}