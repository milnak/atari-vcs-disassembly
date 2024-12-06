#! /usr/bin/python3

import sys

# True to generate potentially assemblable code only
CODE_ONLY = len(sys.argv) > 1



# Tab constants
ADDRESS = 6
LABEL = 25 - CODE_ONLY*24
OP = LABEL + 8
OPERAND = OP + 8
RIGHT_COMMENT = OPERAND + 16  # This differs in the file, meta command tells how many tabs to use
HEX = "0123456789ABCDEF"

INSTRUCTIONS = ["ADC", "AND", "ASL", "BCC", "BCS", "BEQ", "BIT", "BMI", "BNE", "BPL", "BRK", "BVC", "BVS", "CLC",
                "CLD", "CLI", "CLV", "CMP", "CPX", "CPY", "DEC", "DEX", "DEY", "EOR", "INC", "INX", "INY", "JMP",
                "JSR", "LDA", "LDX", "LDY", "LSR", "NOP", "ORA", "PHA", "PHP", "PLA", "PLP", "ROL", "ROR", "RTI",
                "RTS", "SBC", "SEC", "SED", "SEI", "STA", "STX", "STY", "TAX", "TAY", "TSX", "TXA", "TXS", "TYA"]
PSEUDO_PREFIXES = ["*=", ".", "="]

def isInstruction(string):
    return (string in INSTRUCTIONS) or any(string.startswith(prefix) for prefix in PSEUDO_PREFIXES)

# Predicate returning true if all chars in string are in spec, and string is of the given length
def uniform(string, spec, length):
    return (len(string) == length) and all(c in spec for c in string)
    
started = False  # ignores notes at beginning of the file
plain = False  # dumps lines verbatim
for line in open("retyped.txt"):
    line = line.strip('\n')
    if not started:
        if line == "START":
            started = True
        continue

    # Meta commands
    if line.startswith('%rcomment'):
        RIGHT_COMMENT = OPERAND + 8*int(line.split()[1])
        continue
    if line.startswith('%plain'):
        plain = True
        continue
    if line == "^L":
        if CODE_ONLY:
            print('\n\n;----------------------------------\n\n')
        else:
            print('\f', end='')
        continue

    # Blank lines
    if line == "":
        print(line)
        continue

    # Passthrough mode
    if plain:
        if not CODE_ONLY:
            print(line)
        continue

    
    # This is concatenated to build the output line
    outstr = ""
    def tab(loc, string):
        global outstr
        # To be at e.g. loc 9, we need a length of 8
        delta = loc-1 - len(outstr)
        if delta < 0:
            raise ValueError(("Tab already passed",loc,delta,outstr))
        outstr += " " * delta + string

    # Split off comments on their own
    comment = None
    numsemis = 0
    if ';' in line:
        [line, comment] = line.split(";",1)
        numsemis = min(4, 1 + len(comment) - len(comment.lstrip(';')))
        if numsemis > 1:
            comment = comment[numsemis-1:]

    # Util to tack on the right comment after everything else, if one exists
    def rightComment():
        global outstr
        if comment:
            tab(RIGHT_COMMENT, ';' + comment)

   
    # The remainder is space-separated. split() without params eats space spans, too
    fields = line.split()
    # Hack to support the singular instance of a quoted string, namely the .TITLE line
    if '"' in line:
        fields = [fields[0], ' '.join(fields[1:])]
              
    if fields:
        # Handle these optional fields in specific order
        # Doesn't quite work as neatly as a loop, because they must appear in order and only once
        i = 0
        def more():
            global i
            return i < len(fields)
        def pop():
            global i
            if more():
                i += 1
                return fields[i-1]
        def nonCode():
            if CODE_ONLY:
                pop()
            else:
                return True
        
        # Weird "V" field
        if more() and (fields[i] == "V" or fields[i] == "VV"):
            if nonCode():
                outstr += pop()

        # Address (including hack for B112 which is a label, not an address)
        if more() and uniform(fields[i], HEX, 4) and fields[i] != "B112":
            if nonCode():
                tab(ADDRESS, pop())
            # Up to 3 hex bytes
            # TODO - hit a binary file for these if not present, verify if present
            for x in range(3):
                if more() and uniform(fields[i], HEX, 2):
                    if nonCode():
                        outstr += ' ' + pop()

        # Label
        if more() and not isInstruction(fields[i]):
            tab(LABEL, pop())
            
        # Instruction
        if more() and isInstruction(fields[i]):
            tab(OP, pop())
            operand = pop()
            if operand:
                tab(OPERAND, operand)

        # All fields must have been recognized
        if more():
            raise ValueError(["Unhandled fields",fields[i:], fields, outstr])
        rightComment()
    else:
        # Only a comment, see how far we need to indent it
        # The semicolon is always at the label indent
        tab(LABEL, ';')
        if numsemis > 1:
            tab([OP, OPERAND, RIGHT_COMMENT][numsemis-2],"")
        outstr += comment

    print(outstr)
