sudo add-apt-repository ppa:/ubuntu-wine/ppa
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install -y wine winetricks
sudo apt-get install -y mesa-utils mesa-utils-extra libgl1-mesa-glx:i386 libgl1-mesa-dev
sudo ln -s /usr/lib/i386-linux-gnu/mesa/libGL.so.1 /usr/lib/i386-linux-gnu/mesa/libGL.so
sudo ln -s /usr/lib/i386-linux-gnu/mesa/libGL.so /usr/lib/i386-linux-gnu/libGL.so
export WINEPREFIX="$HOME/.wineprefixes/office2010/"
export WINEARCH="win32"
sudo apt-get install -y winbind
winetricks dotnet20 msxml6 corefonts
wine "$HOME/Documents/office2010/MS-Office2010/setup.exe"
winetricks
