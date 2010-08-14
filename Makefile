ROOT=ttf-clumsy

ttf-clumsy_001.000-1_all.deb: $(ROOT)/Clumsy.ttf $(ROOT)/OFL.txt
	cd $(ROOT) && debuild -us -uc

$(ROOT)/OFL.txt: $(ROOT)/Open\ Font\ License.txt
	cd $(ROOT) && cp "Open Font License.txt" OFL.txt

$(ROOT)/Clumsy.ttf $(ROOT)/Open\ Font\ License.txt: $(ROOT)/clumsy.zip
	cd $(ROOT) && unzip -j clumsy.zip "clumsy/$(@F)"

$(ROOT)/clumsy.zip:
	cd $(ROOT) && curl -O http://clumsy.kylesteed.com/clumsy.zip

clean:
	rm -f ttf-clumsy_001.* *~
	cd $(ROOT) && rm -f Clumsy.ttf *.txt clumsy.zip
	cd $(ROOT)/debian && rm -rf ttf-clumsy.debhelper.log ttf-clumsy.substvars ttf-clumsy/
