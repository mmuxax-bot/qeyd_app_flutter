# Qeyd App
Tam Android Flutter layihəsi. Kitablar sonradan əlavə ediləcək.

## GitHub Actions
Faylları repozitoriyanın kökünə yüklə. Actions > Build Android APK > Run workflow. Build bitəndə `qeyd-app-release` artifactını endir.

## Lokal
flutter pub get
flutter analyze
flutter test
flutter build apk --release

APK yolu: build/app/outputs/flutter-apk/app-release.apk
Play Store üçün ayrıca release keystore tələb olunur.
