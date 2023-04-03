# osu-compress

osu-compress is an application that compresses beatmap files to the smallest possible file size by removing redundant default values. This was an idea I had brewing for a long time, but it seems as if it need to be applied now, thanks to ExGon's submitting issues with their [Various BGM 2](https://osu.ppy.sh/beatmapsets/592397).

## Usage

Open up your command prompt/terminal, and go to the directory where the `osu-compress` executable is in. Once there, for Unix, write `./osu-compress INPUT OUTPUT`, and in Windows, write `.\osu-compress INPUT OUTPUT`, where INPUT is the file you want to compress, and output is the new file that will be created and named.

## Installation

You can download the executable from the [Releases]() tab in GitHub.

You can also compile the project as shown below.

## Compiling

Before you can make the project, you will need `make`, `gcc`/`x86_64-w64-mingw32-gcc`/`i686-w64-mingw32-gcc`, and pkg-config. Once they have been installed, write `make OPTION`, and a new executable should be created.

To make an executable for the Unix eviroment, for the 64-bit version, use `make unix64`, for the 32-bit version, use `make unix32`, which will create the `osu-compress` executable.

To make an executable for the Windows enviroment, for the 64-bit version, use `make win64`, for the 32-bit version, use `make win32`, which will create the `osu-compress.exe` executable.
