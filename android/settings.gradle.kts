import java.util.Properties
import org.gradle.api.GradleException

pluginManagement {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        google()
        mavenCentral()
    }
}

rootProject.name = "android"
include(":app")

val localProperties = Properties()
val localPropertiesFile = File(settings.rootDir.parentFile, "local.properties")
if (localPropertiesFile.exists()) {
    localPropertiesFile.inputStream().use { stream ->
        localProperties.load(stream)
    }
}

val flutterSdkPath = localProperties.getProperty("flutter.sdk")
if (flutterSdkPath == null) {
    throw GradleException("Flutter SDK not found. Define location in local.properties.")
}

apply(from = File(flutterSdkPath, "packages/flutter_tools/gradle/flutter.groovy"))