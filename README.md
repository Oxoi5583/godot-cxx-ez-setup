### Godot C++ Binding Easy Setup w/CMake

This may be the easiest setup for Godot GDExtension.
The reason why I wrote this is for praticing cmake writing and provide a easier way 
for new Godot And Cmake users.
After all, there are no much GDExtension tutorial using Cmake.

## What is the purpose of this project ?

This CMakeLists will generate a ./bin folder which can be implemented in the Godot project.

## How to use it ?

Just click the exe.bat at the root of the project.

## What is the dependencies ?

Before you click exe.bat, you'll need :
  1. cmake
  2. git
  3. C++ compiler e.g. g++, MSVC...

And Also, since this project was developed in x64 Windows 10 and godot 4.3,
It may only supported in x64 Windows10 computers.
I not sure what will happened in other platforms.
You may modify the content for fitting in your environments.

### What will this project do ?

What you need to do is just Click exe.bat then cmake will do the below steps
1. clone godot-cpp from Godot Github
2. build the godot-cpp static library for future development
3. create a folder named ./bin
4. copy necessary header files from ./godot-cpp to ./bin/dev/include and ./bin/dev/gdextension for future development
5. copy example files for basic project setup
6. copy and modify example CMakeList.txt and .gdextension
7. done!

### What else need to be done ?

Just manually copy the whole bin folder into your Godot project.
Then you can start writing C++ code and build your custom module by cliking compile.bat in ./bin/dev .
Then, Have a nice day!


If you want to test the GDExtension for your first time "gdextenisoning",
you can just click compile.bat in ./bin/dev after exe.bat was finished.

![image](https://github.com/user-attachments/assets/a08956c9-2d08-43db-803d-140ef0fb1031)

After compile.bat done working, there should be two dynamic library files(.dll) generated at ./bin . (not ./bin/dev)
which should be named as the libraries name in ./bin/GDExtensionModule.gdextension .
If you using other platform, please add new libraries path in ./bin/GDExtensionModule.gdextension .<br>
                                 ↓↓↓↓↓↓↓↓↓↓↓↓<br>
[libraries]<br>
windows.release.x86_64 = "res://bin/GdExtensionModule.windows.release.amd64.dll"<br>
windows.debug.x86_64 = "res://bin/GdExtensionModule.windows.debug.amd64.dll"<br>
**linux.release.x86_64 = "res://bin/libGdExtensionModule.linux.release.amd64.so"** <- add new libraries path like this<br>

The Final result should look this this image

![image](https://github.com/user-attachments/assets/6543f55e-eeee-4e2c-93a0-e2378a617862)

Last but not leaset, you can open your Godot Engine and build the scene once.

![image](https://github.com/user-attachments/assets/158156f7-bc2d-49e1-94dc-e22c710f4b28)

Then click "Add New Node" as usual. Search for "Example", 
you will see a few new node types named Example blah blah blah.
It mean you succesfully added Custom GDExtension Module into your Godot project.

![image](https://github.com/user-attachments/assets/e28f01b8-23e9-409e-8151-dc4ea38add3f)


## Remark

This repo may not be updated frequently.
If you have any intresting idea, Please feel free to fork it.
I will be really grateful if this project can help you. 
