import std.stdio;
import std.string;
import std.file : read;
import std.algorithm;
import std.array : array;
import std.range : split, transposed;
import std.string: strip;
import std.conv : to;

void main(string[] args) {
    int valid(int[] l) { return l[0] + l[1] > l[2] && l[1] + l[2] > l[0] && l[0] + l[2] > l[1]; }

    auto total = stdin.byLine
        .map!(line => line.split.map!(to!int).array);
    
    auto t = transposed(total.array)
        .map!(a => valid(array(a)))
        .sum();

    writeln(t);
}
