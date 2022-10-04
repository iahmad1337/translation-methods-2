srcs = \
	   defs.hh \
	   lexer.hh \
	   lexer.cc \
	   tree.hh \
	   parser.hh \
	   parser.cc \
	   main.cc


CC=clang++
# clang 13 doesn't support <format>
CFLAGS= \
		-Wall \
		-static \
		-O2 \
		-g \
		-std=c++20

all: format parser


parser:
	$(CC) $(CFLAGS) main.cc lexer.cc parser.cc -o parser

format: FORCE
	clang-format -i --style=file *.hh *.cc

picture: parser
	./parser >pic.dot && \
	dot -T svg pic.dot >pic.svg && \
	open pic.svg

clean: FORCE
	rm parser

FORCE:

