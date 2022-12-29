(
echo "";
echo "Compiling the configurator [K]";
echo "";
cd cfgk/;
cmake ./ >/dev/null && make -s >/dev/null;
mv vdkernel.skprx ../cfgk.skprx;
cp stubs/libvdkernel_stub.a ../launcher/libvdkernel_stub.a && cp stubs/libvdkernel_stub.a ../main/libvdkernel_stub.a;
rm -rf CMakeFiles && rm cmake_install.cmake && rm CMakeCache.txt && rm Makefile;
rm vdkernel.velf && rm vdkernel.skprx.out && rm vdkernel && rm stubs.yml;
echo "";
echo "Compiling the configurator [U]";
echo "";
cd ../cfgu/;
cmake ./ >/dev/null && make -s >/dev/null;
mv configure.suprx ../cfgu.suprx;
rm -rf CMakeFiles && rm cmake_install.cmake && rm CMakeCache.txt && rm Makefile;
rm system_settings.xml.o && rm user && rm user.velf && rm configure.suprx.out;
echo "";
echo "Compiling the VitaDeploy launcher";
echo "";
cd ../launcher/;
make -s;
mv launcher.bin ../eboot.bin;
rm main.o && rm launcher.elf && rm launcher.velf;
echo "";
echo "Compiling VitaDeploy";
echo "";
cd ../main/;
make -s;
mv main.bin ../main.self;
rm main.o && rm graphics.o && rm font.o && rm promote.o && rm main.elf && rm main.velf && rm ioapi.o && rm sha1.o && rm unzip.o;
echo "";
echo "Creating app packages";
echo "";
cd ../;
make -s;
make mshell=1 -s;
rm eboot.bin && rm main.self && rm cfgu.suprx && rm cfgk.skprx && rm param.sfo;
rm main/libvdkernel_stub.a && rm launcher/libvdkernel_stub.a && rm -rf cfgk/stubs && rm cfgk/libvdkernel_stub.a && rm cfgk/libvdkernel_stub_weak.a;
echo "";
echo "DONE!";
echo "";
)