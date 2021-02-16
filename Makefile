.POSIX:
CC       = cc

all: endlessh

endlessh: endlessh.c
	$(CC) -std=c99 $(CFLAGS) $(LDFLAGS) -o $@ endlessh.c $(LDLIBS)

install: endlessh
	install -m 755 endlessh $(DESTDIR)$(PREFIX)/bin/
	install -m 644 endlessh.1 $(DESTDIR)$(PREFIX)/share/man/man1/

clean:
	rm -rf endlessh
