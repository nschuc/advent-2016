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
    bool[string] visited;
    bool first = false;
    foreach(move; input){
        dir *= move[0] == 'R' ? complex(0, -1) : complex(0, 1);
        for(int i = 0; i < to!int(move[1..$]); i++) {
            loc += dir;
            if(!first && loc.toString() in visited) {
                writeln("first ", abs(loc.re) + abs(loc.im));
                first = true;
            }
            visited[loc.toString()] = true;
        }
    }
    writeln("final ", abs(loc.re) + abs(loc.im));
}
