CC = gcc
CFLAGS = -Wall -Wextra -Werror -std=c99 -pedantic

sshell: sshell.o cmd.o utils.o
	$(CC) $(CFLAGS) -o sshell sshell.o cmd.o utils.o

sshell.o: sshell.c sshell.h cmd.h utils.h
	$(CC) $(CFLAGS) -c sshell.c

cmd.o: cmd.c cmd.h sshell.h
	$(CC) $(CFLAGS) -c cmd.c

utils.o: utils.c utils.h
	$(CC) $(CFLAGS) -c utils.c

clean:
	rm -f *.o sshell

.PHONY: clean