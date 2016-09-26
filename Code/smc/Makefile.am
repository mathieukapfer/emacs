bin_PROGRAMS = test

# SMC path
SMC_DIR=./smc_6_0_1

# generate bin 
SM_SOURCE       = test.sm

test_SOURCES = \
	main.cpp \
	$(SM_SOURCE:.sm=_sm.cpp)  \
	Test.h Test.cpp

test_CXXFLAGS= -I$(SMC_DIR)/lib/C++

# generate SMC files
SMC=java -jar $(SMC_DIR)/bin/Smc.jar
SMC_FLAGS= -c++ -g -nostreams
SMC_GRAPH_FLAGS= -graph -glevel 

%_sm.h %_sm.cpp: %.sm
	$(SMC) $(SMC_FLAGS) $(SM_SOURCE)


# execute test
run:test
	./test
