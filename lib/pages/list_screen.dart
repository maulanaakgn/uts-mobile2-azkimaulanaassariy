import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<String> _filteredList = [];
  String _keywords = '';
  final List<String> _originList = [
      "Apel",
      "Pisang",
      "Ceri",
      "Durian",
      "Elderberi",
      "Kelengkeng",
      "Anggur",
      "Buah Naga",
      "Nangka",
      "Kiwi",
      "Lemon",
      "Mangga",
      "Nektarin",
      "Jeruk",
      "Pepaya",
      "Raspberry",
      "Stroberi",
      "Jeruk Bali",
      "Nanas",
      "Semangka",
      "Melon",
      "Buah passion kuning",
      "Zukini"
  ];

  TextEditingController _searchController = TextEditingController();

  _buildOriginList() {
    List<String> displayList = _keywords.isEmpty
        ? _originList
        : _filteredList.isNotEmpty
            ? _filteredList
            : ['Tidak ditemukan'];

    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => SizedBox(
          height: 50,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              displayList[index],
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
        ),
        separatorBuilder: (context, index) => const Divider(
            height: 2, color: Colors.blue),
        itemCount: displayList.length,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _filteredList = _originList;
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    setState(() {
      _keywords = _searchController.text.toLowerCase();
      _filteredList = _originList
          .where((item) => item.toLowerCase().contains(_keywords))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 18,
                )),
          ),
          _buildOriginList(),
        ],
      ),
    );
  }
}
