# Message Center App

Shows messages for a given user's emailId sorted by date in descending order

## Features
- Email validation and error handling.
- Persists last entered email ID.
- Clear button in email Text Field.
- Handles network errors with retry.
- Pull to refresh in Messages screen.
- Integration of SwiftLint.
- Localization for US-English and Spanish-Mexico.
- Unit Tests for network call and email validation.
- Logger class that allows filtering of messages by module in  the console.

## Demo Video

https://github.com/jmuthialu/MessageCenter/assets/10758530/73b8d3d3-74e0-4d10-92e4-ab13f1f28dc6


## Folder Structure

![Message Center Folder Structure](Media/FolderStructure.png)

## Architecture
- SOLID, CLEAN and MVVM with an eye to make the code readable, maintainable and scalabe.
- Prefers small but larger number of class files separated by single responsibility versus large but small number of class files.
- Swift UI for the win!

### Concurrency
- Employs Structued Concurrency to make the network calls in the background thread and @MainActor to show the results in main thread.

### Network stack
- Protocol driven `NetworkFactory` to create a real HTTP network service (`HTTPService`) or mock service (`MockHTTPService`) class.
- `URLBuilder` provides the ability to build URL requests based on path, queryParameters and request headers. 
- API layer has `BaseAPI` which can be subclassed to custom fit any APIs, say `MessagesAPI`. 
- API clases are responsbile to generate URL Request, abstract network calls and add any functionality such as search as needed by a specific module/API.
