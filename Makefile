CC=/home/yuri/repo/webrepl/webrepl_cli.py
#DST=185.49.140.179
DST=10.0.0.138
SOURCES=main.py boot.py trusted_networks.py
OBJECTS=$(SOURCES:.py=.o)

.NOTPARALLEL: %.o #list wipe
.PHONY: test clean #list wipe

all: $(OBJECTS)
%.o: %.py
	cat $< | python3 scrub.py > _tmp
	$(CC) _tmp $(DST):/$<
	rm _tmp
	touch $@

clean:
	rm -f $(OBJECTS)

test:
	dig @$(DST) hello

