```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Success, process the JSON response
      final jsonData = jsonDecode(response.body);
      // ... process jsonData ...
    } else {
      // Handle error status codes
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions, such as network errors
    print('Error fetching data: $e');
    // Consider rethrowing the exception or handling it appropriately based on your needs
    rethrow; // Or handle the error in a more specific way
  }
}
```