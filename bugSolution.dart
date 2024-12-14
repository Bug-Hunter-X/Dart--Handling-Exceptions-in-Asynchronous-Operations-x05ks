```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
       // ... process jsonData ...
    } else {
      //Instead of a generic exception, provide more context
      throw HttpException('Failed to load data: ${response.statusCode}', uri: Uri.parse('https://api.example.com/data'));
    }
  } on SocketException catch (e) {
    // Handle network errors specifically
    print('Network error: $e');
    // Display user-friendly message about network connectivity
  } on FormatException catch (e) {
    // Handle JSON decoding errors specifically
    print('JSON decoding error: $e');
    // Log the error for debugging and show a user-friendly message 
  } on HttpException catch (e) {
    // Handle HTTP errors specifically
    print('HTTP error: ${e.message} at ${e.uri}');
  } catch (e) {
    // Handle other unexpected errors
    print('Unexpected error: $e');
    // Consider logging error details for debugging.
    //  Show a generic error message to the user
  }
}
```