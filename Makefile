all: fpgrowth

fpgrowth: fpgrowth.o tract.o fptree.o
	gcc -g $^ -o $@ -lm

clean:
	-rm fpgrowth *.o *.d

.PHONY: clean

sources = fpgrowth.c tract.c fptree.c

include $(sources:.c=.d)

%.d: %.c
	set -e; rm -f $@; \
	$(CC) -MM $(CPPFLAGS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
	rm -f $@.$$$$
