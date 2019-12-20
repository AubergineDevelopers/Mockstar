<h1 align="center">Mockstar</h1>

<p align="center"><img src="https://raw.githubusercontent.com/AubergineDevelopers/Mockstar/master/screenshots/icon.png" alt="logo"></p>

<h2 align="center">Mocking HTTP API calls like a Rockstar :guitar:</h2>

<p align="center"><img src="https://raw.githubusercontent.com/AubergineDevelopers/Mockstar/master/screenshots/demo.gif"></p>

## Screenshots
<table>
    <tr>
        <th>
            HomeScreen
        </th>
        <th>
            DetailsScreen
        </th>
    </tr>
    <tr>
        <td>
            <img src="https://raw.githubusercontent.com/AubergineDevelopers/Mockstar/master/screenshots/1.png" />
        </td>
        <td>
            <img src="https://raw.githubusercontent.com/AubergineDevelopers/Mockstar/master/screenshots/2.png" />
        </td>
    </tr>
</table>

## Setup
- Get an API key from [TMDB](https://developers.themoviedb.org/3/getting-started/introduction)

- Put the API key in [constants.dart](https://github.com/AubergineDevelopers/Mockstar/blob/master/lib/utils/constants.dart)

```
abstract class Constants {
    
  // ...

  static const String kTmdbApiKey = 'YOUR_API_KEY';
}
```

## Dependencies
- [provider](https://pub.dev/packages/provider)

- [dio](https://pub.dev/packages/dio)

- [palette_generator](https://pub.dev/packages/palette_generator)

## Contributing
Feel free to contribute to the project by creating [issues](https://github.com/AubergineDevelopers/Mockstar/issues) or sending pull-requests.

## Getting Started
A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
