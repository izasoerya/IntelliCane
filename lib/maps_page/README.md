# How to Enable Google Maps API

Since API_KEY is sensitive information, i hide it from version control. In case you need it to debug, please contact me for the API_KEY. Happy Coding!

## Step-by-Step Guide to Use API_KEY

1. Go to android/local.properties
2. Create a var name "googleMapsApiKey" and enter the API_KEY i give you.
3. Go to build.gradle inside android folder, then put this:

```bash
buildscript {
    ....
    }
    dependencies {
        ....
        classpath "com.google.android.libraries.mapsplatform.secrets-gradle-plugin:secrets-gradle-plugin:2.0.1"
    }
}
```

4. Go to build.grade inside app folder, then put this:

```bash
plugins {
    ...
    id "com.google.android.libraries.mapsplatform.secrets-gradle-plugin"
}
```

5. You should be good to go. Dont forget `flutter clean` after to make sure build run correctly.
