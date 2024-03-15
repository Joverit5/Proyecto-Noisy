
Noisy is a package designed to provide real-time information about your current geographical coordinates and ambient sound intensity levels. It's ideal for users who want to stay informed about their surroundings and monitor noise levels for various purposes.

## Features

 
- Displays current geographical coordinates.
- Measures and displays real-time ambient sound intensity levels.
- Automatically samples data every 5 minutes.
- Sends data samples via email for record-keeping and analysis.

## Getting started


To start using Noisy, ensure you have the necessary permissions on your device for location and microphone access.

## Usage


To use Noisy, simply import the package and initialize it in your code. Here's a short example:

## Dependencies 

noise_meter	https://pub.dev/packages/noise_meter
syncfusion_flutter_charts	https://pub.dev/packages/syncfusion_flutter_charts
url_launcher	https://pub.dev/packages/url_launcher
google_fonts	https://pub.dev/packages/google_fonts

```dart
import 'package:geo_sound_monitor/Noisy.dart';

void main() {
  final monitor = Noisy();
  monitor.startMonitoring();
}

