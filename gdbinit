# ______________ General GDB configuration bits _____________
# set pagination off
set print pretty on
# set print array on
set print symbol on
# set print object on
# set print address on
# set print vtbl on
set height 0
set breakpoint pending on
# set logging off
#set logging overwrite on
#set logging redirect on
# set logging file ~/gdb_run.txt

# _____________ Add Project Specific Configuration Details Here ____________
break pdsBreakHere
break MG_Abort

set debug-file-directory = $APIOSPATH
# Supposedly, the set debug-file-directory entry above renders the following lines unnecessary.
# path $APIOSPATH/obj/api:$APIOSPATH/obj/cli:$APIOSPATH/obj/hba:$APIOSPATH/obj/pds:$APIOSPATH/obj/sil/nc
# directory $SE_BASE_DIR/src:$SE_BASE_DIR/include:$SE_BASE_DIR/pds/src:$SE_BASE_DIR/pds/include:$SE_BASE_DIR/sil/src:$SE_BASE_DIR/sil/include:$SE_BASE_DIR/cli/src:$SE_BASE_DIR/cli/include

# ______________breakpoint aliases_____________
define bpl
 info breakpoints
end
document bpl
List breakpoints
end

define bp
 break * $arg0
end
document bp
Set a breakpoint on address
Usage: bp addr
end

define bpc 
 clear $arg0
end
document bpc
Clear breakpoint at function/address
Usage: bpc addr
end

define bpe
 enable $arg0
end
document bpe
Enable breakpoint #
Usage: bpe num
end

define bpd
 disable $arg0
end
document bpd
Disable breakpoint #
Usage: bpd num
end

define bpt
 tbreak $arg0
end
document bpt
Set a temporary breakpoint on address
Usage: bpt addr
end

define bpm
 awatch $arg0
end
document bpm
Set a read/write breakpoint on address
Usage: bpm addr
end

define bhb
 break * $arg0
end
document bhb
Set Hardware Assisted breakpoint on address
Usage: bhb addr
end

# ______________process information____________
define argv
 show args
end
document argv
Print program arguments
end

define stack
 info stack
end
document stack
Print call stack
end

# define frame
# info frame
# info args
# info locals
# end
# document frame
# Print stack frame
# end

define func
 info functions
end
document func
Print functions in target
end

define var
 info variables
end
document var
Print variables (symbols) in target
end

define lib
 info sharedlibrary
end
document lib
Print shared libraries linked to target
end

# define thread
# info threads
# end
# document thread
# Print threads in target
# end

# ________________hex/ascii dump an address______________
define ascii_char
 # thanks elaine :)
 set $_c=*(unsigned char *)($arg0)
 if ( $_c < 0x20 || $_c > 0x7E )
  printf "."
 else
  printf "%c", $_c
 end
end
document ascii_char
Print the ASCII value of arg0 or '.' if value is unprintable
end

define hex_quad
 printf "%02X %02X %02X %02X  %02X %02X %02X %02X",                          \
                *(unsigned char*)($arg0), *(unsigned char*)($arg0 + 1),      \
                *(unsigned char*)($arg0 + 2), *(unsigned char*)($arg0 + 3),  \
                *(unsigned char*)($arg0 + 4), *(unsigned char*)($arg0 + 5),  \
                *(unsigned char*)($arg0 + 6), *(unsigned char*)($arg0 + 7)
end
document hex_quad
Print eight hexadecimal bytes starting at arg0
end

define hexdump
 printf "%08X : ", $arg0
 hex_quad $arg0
 printf " - "
 hex_quad ($arg0+8)
 printf " "

 ascii_char ($arg0)
 ascii_char ($arg0+1)
 ascii_char ($arg0+2)
 ascii_char ($arg0+3)
 ascii_char ($arg0+4)
 ascii_char ($arg0+5)
 ascii_char ($arg0+6)
 ascii_char ($arg0+7)
 ascii_char ($arg0+8)
 ascii_char ($arg0+9)
 ascii_char ($arg0+0xA)
 ascii_char ($arg0+0xB)
 ascii_char ($arg0+0xC)
 ascii_char ($arg0+0xD)
 ascii_char ($arg0+0xE)
 ascii_char ($arg0+0xF)

 printf "\n"
end
document hexdump
Display a 16-byte hex/ASCII dump of arg0
end

