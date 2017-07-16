CC=clang
CFLAGS=-fobjc-arc -fobjc-link-runtime -framework Foundation src/libcapstone.a

build/ioskextdump_ios10:
	mkdir -p build;
	$(CC) $(CFLAGS) src/*.m -o $@

.PHONY:install
install:build/ioskextdump_ios10
	mkdir -p /usr/local/bin
	cp build/ioskextdump_ios10 /usr/local/bin/ioskextdump_ios10

.PHONY:uninstall
uninstall:
	rm /usr/local/bin/ioskextdump_ios10

.PHONY:clean
clean:
	rm -rf build
