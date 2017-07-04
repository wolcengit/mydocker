#!/bash/bin

#install wkhtmlto
yum install -y libXrender libXext fontconfig mkfontscale xz* tar
#yum install -y libXrender libXext fontconfig mkfontscale wget xz* tar
wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
xz -d wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
rm -rf wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
tar -xf wkhtmltox-0.12.4_linux-generic-amd64.tar -C /usr/local/
mv msyh.ttc /usr/share/fonts/msyh.ttc
mv simsun.ttc /usr/share/fonts/simsun.ttc
cd /usr/share/fonts
mkfontscale
mkfontdir
fc-cache
