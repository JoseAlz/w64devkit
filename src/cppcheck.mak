ext      := $(shell find externals -mindepth 1 -type d)
src      := $(shell find cli lib externals -name '*.cpp')
obj      := $(src:.cpp=.o)
CXXFLAGS := -Os -Ilib $(addprefix -I,$(ext))
LDFLAGS  := -s
LDLIBS   := -lshlwapi
cppcheck.exe: $(obj)
	$(CXX) $(LDFLAGS) -o $@ $(obj) $(LDLIBS)
