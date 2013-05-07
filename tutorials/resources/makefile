PROJ := $(notdir $(PWD))
# PROFILE := -pg

oops:
	@echo usage:
	@echo "	make $(PROJ)    #tutorial $(PROJ)"
	@echo "	make $(PROJ)sa  #solution a"
	@echo "	make $(PROJ)sb  #solution b"
	@echo "	..."
	@echo "	make clean #tidy up"

.PRECIOUS: %.o

# cancel implicit rules, to speed make #
%.c:
%.cpp:
%: %.o
%: %.s
%: %.c
%: %.cpp

# make t0 from t0.o and t0m.o,
# only works in the folder t0
$(PROJ): $(PROJ).o $(PROJ)m.o
	c++ $(PROFILE) -o $@ $^

# for problem submission a,
# function t0sa.s is paired with 
# a unique main program t0sam.cpp
# make t0sa from t0sa.o and t0sam.o
$(PROJ)s%: $(PROJ)s%.o $(PROJ)s%m.o
	c++ $(PROFILE) -o $@ $^

# for mutiple versions
# each function t0v0.s is paired with 
# the same main program t0sam.cpp
# make t0v0 from t0v0.o and t0m.o
$(PROJ)v%: $(PROJ)v%.o $(PROJ)m.o
	c++ $(PROFILE) -o $@ $^

# for problem submission a,
# functions t0sav0.s, t0sav1.s, etc
# are paired with 
# a main program t0sam.cpp
# to make t0sav0, t0sav1, etc.
$(PROJ)s%v0: $(PROJ)s%v0.o $(PROJ)s%m.o
	c++ $(PROFILE) -o $@ $^
$(PROJ)s%v1: $(PROJ)s%v1.o $(PROJ)s%m.o
	c++ $(PROFILE) -o $@ $^
$(PROJ)s%v2: $(PROJ)s%v2.o $(PROJ)s%m.o
	c++ $(PROFILE) -o $@ $^
$(PROJ)s%v3: $(PROJ)s%v3.o $(PROJ)s%m.o
	c++ $(PROFILE) -o $@ $^
$(PROJ)s%v4: $(PROJ)s%v4.o $(PROJ)s%m.o
	c++ $(PROFILE) -o $@ $^
$(PROJ)s%v5: $(PROJ)s%v5.o $(PROJ)s%m.o
	c++ $(PROFILE) -o $@ $^

%.o: %.s
	gcc $(PROFILE) -c $^

%.o: %.c
	gcc -g $(PROFILE) -c $^

%.o: %.cpp
	gcc -g $(PROFILE) -c $^

%.s: %.c
	gcc -S $(PROFILE) $^

clean::
	-rm -f *.o $(PROJ) $(PROJ)s[0-9] $(PROJ)s? $(PROJ)[0-9]s? *.o *~
