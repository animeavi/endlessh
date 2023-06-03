.POSIX:
CC       = cc

all: endlessh

endlessh: endlessh.c
	$(CC) -std=c99 $(CFLAGS) $(LDFLAGS) -o $@ endlessh.c $(LDLIBS)

install: endlessh
	install -Dm755 endlessh $(DESTDIR)/bin/
	install -Dm644 endlessh.1 $(DESTDIR)/share/man/man1/

clean:
	rm -rf endlessh

docker:
	docker build . -t endlessh

docker-run:
	docker run --rm -it --init endlessh
