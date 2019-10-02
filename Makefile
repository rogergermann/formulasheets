
REVISION = build/revision.tex

all: revision */*.tex
	cd template && make && cd ..
	cd Leistungselektronik && make && cd ..
	cd Analysis\ III\ \-\ PDE && make && cd ..
	cd Semiconductor\ Devices && make && cd ..
	cd Communication\ Networks && make && cd ..
	cd Communication\ Systems && make && cd ..


docker:
	docker run -v `pwd`:/source noah95/latex /usr/bin/make

revision:
	mkdir -p $(dir $(REVISION))
	echo "% Autogenerated, do not edit" > $(REVISION)
	echo "\\\newcommand{\\\revisiondate}{`git log -1 --format=\"%ad\" --date=iso`}" >> $(REVISION)
	echo "\\\newcommand{\\\revision}{`git log -1 --format=\"%h\"`}" >> $(REVISION)
	echo "\\\newcommand{\\\compiledate}{`date \"+%Y-%m-%d %H:%M:%S\"`}" >> $(REVISION)
	echo "\\\newcommand{\\\hostname}{`hostname`}" >> $(REVISION)

clean:
	rm -rf build/
	cd template && make clean && cd ..
	cd Leistungselektronik && make clean && cd ..
	cd Analysis\ III\ \-\ PDE && make clean && cd ..
	cd Semiconductor\ Devices && make clean && cd ..
	cd Communication\ Networks && make clean && cd ..
	cd Communication\ Systems && make clean && cd ..