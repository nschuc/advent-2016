import std.stdio;
import std.string;
import std.algorithm : filter, maxElement, minElement;
import std.range : enumerate, iota, zip;
import std.array : array;
import std.conv : to;


void main(string[] args) {
    const int nchar = 8;
    int[26][nchar] counts;
    char[nchar][26] mostCommon;
    foreach(line; stdin.byLine) {
        foreach(int i, char c; line) {
            counts[i][c-'a']++;
        }
    }
    for(int i = 0; i < nchar; i++) {
        write(to!char(counts[i].array.enumerate.maxElement!"a.value"[0] + 'a'));
    }
    writeln();

    for(int i = 0; i < nchar; i++) {
        write(to!char(counts[i].array
                    .zip(iota('a', 'z' + 1))
                    .filter!"a[0] > 0"
                    .minElement!"a[0]"[1]));
    }
    writeln();
}
