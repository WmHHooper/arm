include ../resources/makefile

$(PROJ).s: ../t0/t0.c
	gcc -o $@ -S $^

$(PROJ)m.s: ../t0/t0m.cpp
	sed 's/fib/Fib/g' $^ | gcc -xc++ -o $@ -S -

clean::
	rm $(PROJ).s $(PROJ)m.s
