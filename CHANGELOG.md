## 0.1.0

### BREAKING CHANGES
* **Flutter SDK Constraint**: Raised minimum Flutter SDK to `>=3.44.0` (Dart `>=3.4.0`). Do not update to this version if your project uses Flutter < 3.44.0.
* **Built-in Kotlin Support (AGP 9+ / KGP 2.0+)**:
  * Migrated from legacy Groovy `build.gradle` to modern Kotlin DSL `build.gradle.kts`.
  * Removed manual application of Kotlin Gradle Plugin (`org.jetbrains.kotlin.android`) to support Flutter's Built-in Kotlin mechanism and ensure compatibility with future Android Gradle Plugin (AGP 9.0+) versions.
  * Replaced deprecated `kotlinOptions` block with modern `kotlin.compilerOptions` DSL (`jvmTarget = JVM_17`).

## 0.0.4
* removed fixed kotlin dependency. it should use the same that you are using in your project now

## 0.0.3
* updated build.gradle

## 0.0.2
* bugfixes

## 0.0.1
* initial release