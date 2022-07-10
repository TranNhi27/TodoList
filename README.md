# todo_list_app

## Instruction

Run apk file in Android Emulator 
- Download apk file: https://github.com/TranNhi27/TodoList/blob/master/app-release.apk
### Linux:
  + Step 1: Run the emulator
  + Step 2: Copy the apk file to platform-tools in the android-sdk linux folder.
  + Step 3: Execute this command  ```./adb install app-release.apk>```
     + Example: ```adb install C:\Users\Nhi\TodoList\build\app-release.apk```
### Windows:
  + Step 1: Execute the emulator (SDK Manager.exe->Tools->Manage AVDs...->New then Start)
  + Step 2: Start the console, Run -> type cmd, and move to the platform-tools folder of SDK directory.
  + Step 3: Paste the APK file in the 'android-sdk\tools' or 'platform-tools' folder.
  + Step 4: Then type the following command ```adb install [.apk path]```
### Mac: 
  + Step 1: ```PATH=$PATH:~/Library/Android/sdk/platform-tools```
     + Example: ```PATH=$PATH:/users/nhi/eclipse/android-sdk-mac_64/tools```
  + Step 2: Run the emulator
  + Step 3: Copy app-release.apk file and paste into /Users/your_system_username/Library/Android/sdk/platform-tools
  + Step 4: Open the terminal and type the following ```cd Library/Android/sdk/platform-tools```
  + Step 5: Execute the following in your terminal: ```./adb install app-release.apk```. If you get the error error: ```no devices found - waiting for device```, follow step 6
  + Step 6: Run your emulator from Android Studio, once emulator active then repeat step 5, you will see the success message on your terminal.
