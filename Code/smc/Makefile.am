bin_PROGRAMS = test

# SMC path
SMC_DIR=./smc_6_0_1

# generate bin 
SM_SOURCES       = testA.sm testB.sm 

testA.sm: test_prodA.sm test_common.sm 
	cat $^ > $@

testB.sm: test_prodB.sm test_common.sm 
	cat $^ > $@

test_SOURCES = \
	main.cpp \
	Test.h Test.cpp \
	$(SM_SOURCES:.sm=_sm.cpp)  \
	TestA.h TestA.cpp \
	TestB.h TestB.cpp

test_CXXFLAGS= -I$(SMC_DIR)/lib/C++

# generate SMC files
SMC=java -jar $(SMC_DIR)/bin/Smc.jar
SMC_FLAGS= -c++ -g -nostreams
SMC_GRAPH_FLAGS= -graph -glevel 

%_sm.h %_sm.cpp: %.sm
	$(SMC) $(SMC_FLAGS) $<

# execute test
run:test
	./test

# tags helper
sm-tags:
	etags -o TAGS_sm -r '/^[A-Z][A-Za-z0-9_]+/' *.sm 

# clean helper
cleansm:
	rm $(SM_SOURCES:.sm=_sm.cpp) $(SM_SOURCES:.sm=_sm.h)

