# AidLink

AidlinkRev2 is an emergency rescue app prototype developed using Flutter. It integrates Google Maps API to provide location-based services, designed specifically for the Smart India Hackathon 2023.

## Features

- **Google Maps Integration**: Utilizes `google_maps_flutter` for map functionalities.
- **Location Services**: Employs `geolocator` to access and manage location data.
- **User Preferences**: Stores user settings using `shared_preferences`.
- **Cross-Platform Support**: Compatible with Android, iOS, web, and desktop platforms.

## Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/Kartheesan69/aidlink.git
   cd aidlink
   ```

2. **Install dependencies**:
   Ensure you have Flutter installed. Then run:
   ```bash
   flutter pub get
   ```

3. **Run the app**:
   ```bash
   flutter run
   ```

## Project Structure

- **lib/main.dart**: Entry point of the application.
- **lib/home.dart**: Home screen of the app.
- **lib/map.dart**: Handles map-related functionalities.
- **lib/emergency.dart**: Manages emergency features.
- **lib/rescuers.dart**: Contains logic for rescuer interactions.

## Dependencies

- **Flutter SDK**: `>=3.1.2 <4.0.0`
- **google_maps_flutter**: ^2.5.0
- **geolocator**: ^10.1.0
- **shared_preferences**: ^2.2.1
- **cupertino_icons**: ^1.0.2

## Development

To contribute to the project, follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes.
4. Commit your changes (`git commit -m 'Add some feature'`).
5. Push to the branch (`git push origin feature-branch`).
6. Open a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For any inquiries, please contact the project maintainer at [karthik.manikandanmk@gmail.com](karthik.manikandanmk@gmail.com).

<div style="display: flex; justify-content: center;">
    <div style="display: flex; flex-direction: column; align-items: center;">
        <img src="https://github.com/Kartheesan69/aidlink/assets/120254467/d2d3d5cb-f3b9-4f73-9256-7811c394e963" style="width: 200px; height: auto; margin-bottom: 20px;">
        <img src="https://github.com/Kartheesan69/aidlink/assets/120254467/68b0b94a-ea96-4e3b-846a-f36623e9c441" style="width: 200px; height: auto;">
        <img src="https://github.com/Kartheesan69/aidlink/assets/120254467/dfdc5216-0704-4bb3-95ee-2eaac813775d" style="width: 200px; height: auto; margin-left: 20px;">

</div>
