# Nanos-World-BPLuaReturnValue

Steps to setup:
1. Add the files in your ADK
2. Compile and add in Assets.toml the path of Util Actor 'UtilActor'
3. Add 'eroreturnvalue' package
4. Update the Blueprint Path in eroreturnvalue/Client/Index.lua : Line 6

How to use it:
![image](https://user-images.githubusercontent.com/79408258/172680123-6a9aa436-eb73-47ed-84a5-a67448c9d4f8.png)

You can access a function in any blueprint you are (including Widget Blueprints...)

Serverside: executes the code serverside

Code: the code that will be executed

Event: drag the delegate to a custom event

To get the value, use 'Lua Get Value' function and link the Return Value of 'Lua Return Value' as the ID.
