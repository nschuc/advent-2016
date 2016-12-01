import std.stdio;
import std.string;
import std.file : read;
import std.conv : to;
import std.complex : complex;
import std.math : abs;

void main(string[] args) {
    string[] input = stdin.readln().strip().split(", ");
    auto dir = complex(0, 1);
    auto loc = complex(0, 0);
    foreach(move; input){
        dir *= move[0] == 'R' ? complex(0, -1) : complex(0, 1);
        loc += dir * to!int(move[1..$]);
    }
    writeln(abs(loc.re) + abs(loc.im));
}
