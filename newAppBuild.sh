#!/bin/bash

mkdir ~/workspace/android-projects/ -p
mkdir ~/workspace/android-projects/NewApp
cd ~/workspace/android-projects/NewApp
touch ~/workspace/android-projects/NewApp/gradle.properties
gradle init

echo "//list of plugins that may be required for sub-projects
    plugins {
        id 'com.android.application' version '7.2.0' apply false
        id 'com.android.library' version '7.2.0' apply false
        id 'org.jetbrains.kotlin.android' version '1.6.10' apply false
    }

    //gradle task to clean the build directory
    task clean(type: Delete) {
        delete rootProject.buildDir
    }" > ~/workspace/android-projects/NewApp/build.gradle

echo "// list of repositories to find plugins
    pluginManagement {
    repositories {
        gradlePluginPortal()
        google()
        mavenCentral()
    }
    }

    //list repositories to find packages & libraries
    dependencyResolutionManagement {
        repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
        repositories {
            google()
            mavenCentral()
        }
    }
    //name of gradle project
    rootProject.name = 'myApps'
    //include sub-project in app folder
    include 'app'" > ~/workspace/android-projects/NewApp/settings.gradle

echo "org.gradle.java.home = $JAVA_HOME" > ~/workspace/android-projects/NewApp/gradle.properties

mkdir ~/workspace/android-projects/NewApp/app
mkdir ~/workspace/android-projects/NewApp/app/src/
touch ~/workspace/android-projects/NewApp/app/src/build.gradle
touch ~/workspace/android-projects/NewApp/app/src/proguard-rules.pro

echo "// list of plugin required for building this project
    plugins {
    id 'com.android.application'
    }

    // settings required for android plugin
    android {
        namespace 'com.name.myapp' //directory of java class files

        compileSdkVersion 30 //compile app for this version of API
        defaultConfig {
            applicationId 'com.name.myapp' //set id for app
            minSdkVersion 16 //minimum API this app supports
            targetSdkVersion 30 //compile for this API
            versionCode 1
            versionName "1.0"
        }
        buildTypes {
            release {
                minifyEnabled false
                proguardFiles getDefaultProguardFile('proguard-android.txt'),
                        'proguard-rules.pro'
            }
        }
    }" > ~/workspace/android-projects/NewApp/app/src/build.gradle



echo "# Add project specific ProGuard rules here.
    # You can control the set of applied configuration files using the
    # proguardFiles setting in build.gradle.
    #
    # For more details, see
    #   http://developer.android.com/guide/developing/tools/proguard.html

    # If your project uses WebView with JS, uncomment the following
    # and specify the fully qualified class name to the JavaScript interface
    # class:
    #-keepclassmembers class fqcn.of.javascript.interface.for.webview {
    #   public *;
    #}

    # Uncomment this to preserve the line number information for
    # debugging stack traces.
    #-keepattributes SourceFile,LineNumberTable

    # If you keep the line number information, uncomment this to
    # hide the original source file name.
    #-renamesourcefileattribute SourceFile" > ~/workspace/android-projects/NewApp/app/src/proguard-rules.pro


mkdir ~/workspace/android-projects/NewApp/app/src/main/
mkdir ~/workspace/android-projects/NewApp/app/src/main/java/
mkdir ~/workspace/android-projects/NewApp/app/src/main/res/
touch ~/workspace/android-projects/NewApp/app/src/main/AndroidManifest.xml

echo "
    <?xml version="1.0" encoding="utf-8"?>
        <manifest xmlns:android="http://schemas.android.com/apk/res/android">
        <!-- set label name for app -->
            <application android:label="myapp">
            <!-- it contains one activity -->
                <activity android:name=".MainActivity">
                <!-- it contains a launcher activity -->
                    <intent-filter>
                        <action android:name="android.intent.action.MAIN"/>
                        <category android:name="android.intent.category.LAUNCHER"/>
                    </intent-filter>
                </activity>
            </application>
        </manifest>
" >  ~/workspace/android-projects/NewApp/app/src/main/AndroidManifest.xml

mkdir ~/workspace/android-projects/NewApp/app/src/main/res/layout/
touch ~/workspace/android-projects/NewApp/app/src/main/res/layout/activity_main.xml

echo "
    <?xml version="1.0" encoding="utf-8"?>
    <!-- set width & height of app to fill entire screen of phone,
    & backgroud color to blue -->
    <View xmlns:android="http://schemas.android.com/apk/res/android"
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:background = "#00f">
    </View>" > ~/workspace/android-projects/NewApp/app/src/main/res/layout/activity_main.xml

mkdir ~/workspace/android-projects/NewApp/app/src/main/java/com
mkdir ~/workspace/android-projects/NewApp/app/src/main/java/com/name
mkdir ~/workspace/android-projects/NewApp/app/src/main/java/com/name/myapp/
touch ~/workspace/android-projects/NewApp/app/src/main/java/com/name/myapp/MainActivity.java

echo " 
package com.name.myapp;

import android.app.Activity;
import android.os.Bundle;

public class MainActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
}" > ~/workspace/android-projects/NewApp/app/src/main/java/com/name/myapp/MainActivity.java
