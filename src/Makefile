# Makefile for building Lua
# See ../doc/readme.html for installation and customization instructions.

# == CHANGE THE SETTINGS BELOW TO SUIT YOUR ENVIRONMENT =======================

# Your platform. See PLATS for possible values.
PLAT= none

CC= gcc -std=gnu99
CFLAGS= -O2 -Wall -Wextra -DLUA_COMPAT_5_2 $(SYSCFLAGS) $(MYCFLAGS)
LDFLAGS= $(SYSLDFLAGS) $(MYLDFLAGS)
LIBS= -lm $(SYSLIBS) $(MYLIBS)

AR= ar rcu
RANLIB= ranlib
RM= rm -f

SYSCFLAGS=
SYSLDFLAGS=
SYSLIBS=

MYCFLAGS=
MYLDFLAGS=
MYLIBS=
MYOBJS=

# == END OF USER SETTINGS -- NO NEED TO CHANGE ANYTHING BELOW THIS LINE =======

PLATS= aix bsd c89 freebsd generic linux macosx mingw posix solaris

LUA_A=	liblua.a
CORE_O=	lapi.o lcode.o lctype.o ldebug.o ldo.o ldump.o lfunc.o lgc.o llex.o \
	lmem.o lobject.o lopcodes.o lparser.o lstate.o lstring.o ltable.o \
	ltm.o lundump.o lvm.o lzio.o
LIB_O=	lauxlib.o lbaselib.o lbitlib.o lcorolib.o ldblib.o liolib.o \
	lmathlib.o loslib.o lstrlib.o ltablib.o lutf8lib.o loadlib.o linit.o
BASE_O= $(CORE_O) $(LIB_O) $(MYOBJS)

LUA_T=	lua
LUA_O=	lua.o

LUAC_T=	luac
LUAC_O=	luac.o

ALL_O= $(BASE_O) $(LUA_O) $(LUAC_O)
ALL_T= $(LUA_A) $(LUA_T) $(LUAC_T)
ALL_A= $(LUA_A)

# Targets start here.
default: $(PLAT)

all:	$(ALL_T)

o:	$(ALL_O)

a:	$(ALL_A)

$(LUA_A): $(BASE_O)
	$(AR) $@ $(BASE_O)
	$(RANLIB) $@

$(LUA_T): $(LUA_O) $(LUA_A)
	$(CC) -o x -I../include $@ $(LDFLAGS) $(LUA_O) $(LUA_A) $(LIBS)

$(LUAC_T): $(LUAC_O) $(LUA_A)
	$(CC) -o -I../include $@ $(LDFLAGS) $(LUAC_O) $(LUA_A) $(LIBS)

clean:
	$(RM) $(ALL_T) $(ALL_O)

depend:
	@$(CC) $(CFLAGS) -MM l*.cpp

echo:
	@echo "PLAT= $(PLAT)"
	@echo "CC= $(CC)"
	@echo "CFLAGS= $(CFLAGS)"
	@echo "LDFLAGS= $(SYSLDFLAGS)"
	@echo "LIBS= $(LIBS)"
	@echo "AR= $(AR)"
	@echo "RANLIB= $(RANLIB)"
	@echo "RM= $(RM)"

# Convenience targets for popular platforms
ALL= all

none:
	@echo "Please do 'make PLATFORM' where PLATFORM is one of these:"
	@echo "   $(PLATS)"

aix:
	$(MAKE) $(ALL) CC="xlc" CFLAGS="-O2 -DLUA_USE_POSIX -DLUA_USE_DLOPEN" SYSLIBS="-ldl" SYSLDFLAGS="-brtl -bexpall"

bsd:
	$(MAKE) $(ALL) SYSCFLAGS="-DLUA_USE_POSIX -DLUA_USE_DLOPEN" SYSLIBS="-Wl,-E"

c89:
	$(MAKE) $(ALL) SYSCFLAGS="-DLUA_USE_C89" CC="gcc -std=c89"
	@echo ''
	@echo '*** C89 does not guarantee 64-bit integers for Lua.'
	@echo ''


freebsd:
	$(MAKE) $(ALL) SYSCFLAGS="-DLUA_USE_LINUX" SYSLIBS="-Wl,-E -lreadline"

generic: $(ALL)

linux:
	$(MAKE) $(ALL) SYSCFLAGS="-DLUA_USE_LINUX" SYSLIBS="-Wl,-E -ldl -lreadline"

macosx:
	$(MAKE) $(ALL) SYSCFLAGS="-DLUA_USE_MACOSX" SYSLIBS="-lreadline" CC=cc

mingw:
	$(MAKE) "LUA_A=lua53.dll" "LUA_T=lua.exe" \
	"AR=$(CC) -shared -o" "RANLIB=strip --strip-unneeded" \
	"SYSCFLAGS=-DLUA_BUILD_AS_DLL" "SYSLIBS=" "SYSLDFLAGS=-s" lua.exe
	$(MAKE) "LUAC_T=luac.exe" luac.exe

posix:
	$(MAKE) $(ALL) SYSCFLAGS="-DLUA_USE_POSIX"

solaris:
	$(MAKE) $(ALL) SYSCFLAGS="-DLUA_USE_POSIX -DLUA_USE_DLOPEN -D_REENTRANT" SYSLIBS="-ldl"

# list targets that do not create files (but not all makes understand .PHONY)
.PHONY: all $(PLATS) default o a clean depend echo none

# DO NOT DELETE

lapi.o: lapi.cpp ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lapi.h ../include/llimits.h ../include/lstate.h \
 ../include/lobject.h ../include/ltm.h ../include/lzio.h ../include/lmem.h ../include/ldebug.h ../include/ldo.h ../include/lfunc.h ../include/lgc.h ../include/lstring.h \
 ../include/ltable.h ../include/lundump.h ../include/lvm.h
lauxlib.o: lauxlib.cpp ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lauxlib.h
lbaselib.o: lbaselib.cpp ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lauxlib.h ../include/lualib.h
lbitlib.o: lbitlib.cpp ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lauxlib.h ../include/lualib.h
lcode.o: lcode.cpp ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lcode.h ../include/llex.h ../include/lobject.h \
 ../include/llimits.h ../include/lzio.h ../include/lmem.h ../include/lopcodes.h ../include/lparser.h ../include/ldebug.h ../include/lstate.h ../include/ltm.h \
 ../include/ldo.h ../include/lgc.h ../include/lstring.h ../include/ltable.h ../include/lvm.h
lcorolib.o: lcorolib.cpp ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lauxlib.h ../include/lualib.h
lctype.o: lctype.cpp ../include/lprefix.h ../include/lctype.h ../include/lua.h ../include/luaconf.h ../include/llimits.h
ldblib.o: ldblib.cpp ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lauxlib.h ../include/lualib.h
ldebug.o: ldebug.cpp ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lapi.h ../include/llimits.h ../include/lstate.h \
 ../include/lobject.h ../include/ltm.h ../include/lzio.h ../include/lmem.h ../include/lcode.h ../include/llex.h ../include/lopcodes.h ../include/lparser.h \
 ../include/ldebug.h ../include/ldo.h ../include/lfunc.h ../include/lstring.h ../include/lgc.h ../include/ltable.h ../include/lvm.h
ldo.o: ldo.cpp ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lapi.h ../include/llimits.h ../include/lstate.h \
 ../include/lobject.h ../include/ltm.h ../include/lzio.h ../include/lmem.h ../include/ldebug.h ../include/ldo.h ../include/lfunc.h ../include/lgc.h ../include/lopcodes.h \
 ../include/lparser.h ../include/lstring.h ../include/ltable.h ../include/lundump.h ../include/lvm.h
ldump.o: ldump.cpp ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lobject.h ../include/llimits.h ../include/lstate.h \
 ../include/ltm.h ../include/lzio.h ../include/lmem.h ../include/lundump.h
lfunc.o: lfunc.cpp ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lfunc.h ../include/lobject.h ../include/llimits.h \
 ../include/lgc.h ../include/lstate.h ../include/ltm.h ../include/lzio.h ../include/lmem.h
lgc.o: lgc.cpp ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/ldebug.h ../include/lstate.h ../include/lobject.h \
 ../include/llimits.h ../include/ltm.h ../include/lzio.h ../include/lmem.h ../include/ldo.h ../include/lfunc.h ../include/lgc.h ../include/lstring.h ../include/ltable.h
linit.o: linit.cpp ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lualib.h ../include/lauxlib.h
liolib.o: liolib.cpp ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lauxlib.h ../include/lualib.h
llex.o: llex.cpp ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lctype.h ../include/llimits.h ../include/ldebug.h \
 ../include/lstate.h ../include/lobject.h ../include/ltm.h ../include/lzio.h ../include/lmem.h ../include/ldo.h ../include/lgc.h ../include/llex.h ../include/lparser.h \
 ../include/lstring.h ../include/ltable.h
lmathlib.o: lmathlib.cpp ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lauxlib.h ../include/lualib.h
lmem.o: lmem.cpp ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/ldebug.h ../include/lstate.h ../include/lobject.h \
 ../include/llimits.h ../include/ltm.h ../include/lzio.h ../include/lmem.h ../include/ldo.h ../include/lgc.h
loadlib.o: loadlib.cpp ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lauxlib.h ../include/lualib.h
lobject.o: lobject.cpp ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lctype.h ../include/llimits.h \
 ../include/ldebug.h ../include/lstate.h ../include/lobject.h ../include/ltm.h ../include/lzio.h ../include/lmem.h ../include/ldo.h ../include/lstring.h ../include/lgc.h \
 ../include/lvm.h
lopcodes.o: lopcodes.cpp ../include/lprefix.h ../include/lopcodes.h ../include/llimits.h ../include/lua.h ../include/luaconf.h
loslib.o: loslib.cpp ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lauxlib.h ../include/lualib.h
lparser.o: lparser.cpp ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lcode.h ../include/llex.h ../include/lobject.h \
 ../include/llimits.h ../include/lzio.h ../include/lmem.h ../include/lopcodes.h ../include/lparser.h ../include/ldebug.h ../include/lstate.h ../include/ltm.h \
 ../include/ldo.h ../include/lfunc.h ../include/lstring.h ../include/lgc.h ../include/ltable.h
lstate.o: lstate.cpp ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lapi.h ../include/llimits.h ../include/lstate.h \
 ../include/lobject.h ../include/ltm.h ../include/lzio.h ../include/lmem.h ../include/ldebug.h ../include/ldo.h ../include/lfunc.h ../include/lgc.h ../include/llex.h \
 ../include/lstring.h ../include/ltable.h
lstring.o: lstring.cpp ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/ldebug.h ../include/lstate.h \
 ../include/lobject.h ../include/llimits.h ../include/ltm.h ../include/lzio.h ../include/lmem.h ../include/ldo.h ../include/lstring.h ../include/lgc.h
lstrlib.o: lstrlib.cpp ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lauxlib.h ../include/lualib.h
ltable.o: ltable.cpp ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/ldebug.h ../include/lstate.h ../include/lobject.h \
 ../include/llimits.h ../include/ltm.h ../include/lzio.h ../include/lmem.h ../include/ldo.h ../include/lgc.h ../include/lstring.h ../include/ltable.h ../include/lvm.h
ltablib.o: ltablib.cpp ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lauxlib.h ../include/lualib.h
ltm.o: ltm.cpp ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/ldebug.h ../include/lstate.h ../include/lobject.h \
 ../include/llimits.h ../include/ltm.h ../include/lzio.h ../include/lmem.h ../include/ldo.h ../include/lstring.h ../include/lgc.h ../include/ltable.h ../include/lvm.h
lua.o: lua.cpp ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lauxlib.h ../include/lualib.h
luac.o: luac.cpp ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lauxlib.h ../include/lobject.h ../include/llimits.h \
 ../include/lstate.h ../include/ltm.h ../include/lzio.h ../include/lmem.h ../include/lundump.h ../include/ldebug.h ../include/lopcodes.h
lundump.o: lundump.cpp ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/ldebug.h ../include/lstate.h \
 ../include/lobject.h ../include/llimits.h ../include/ltm.h ../include/lzio.h ../include/lmem.h ../include/ldo.h ../include/lfunc.h ../include/lstring.h ../include/lgc.h \
 ../include/lundump.h
lutf8lib.o: lutf8lib.cpp ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lauxlib.h ../include/lualib.h
lvm.o: lvm.cpp ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/ldebug.h ../include/lstate.h ../include/lobject.h \
 ../include/llimits.h ../include/ltm.h ../include/lzio.h ../include/lmem.h ../include/ldo.h ../include/lfunc.h ../include/lgc.h ../include/lopcodes.h ../include/lstring.h \
 ../include/ltable.h ../include/lvm.h
lzio.o: lzio.cpp ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/llimits.h ../include/lmem.h ../include/lstate.h \
 ../include/lobject.h ../include/ltm.h ../include/lzio.h

# (end of Makefile)
