import std.stdio;
import std.string;
import std.algorithm : sort, group, map, fold;
import std.algorithm.mutation : SwapStrategy;
import std.array : array;
import std.range : split, take;
import std.regex;
import std.conv : to;

void main(string[] args) {
    int sector_sum = 0;
    foreach(line; stdin.byLine) {
        auto split = line.split("-");
        auto code = split[0..$-1].join.array.sort()
            .group.array.sort!("a[1] > b[1]", SwapStrategy.stable).take(5).array
            .map!(a => to!string(a[0])).fold!((string a, string b) => a ~ b);

        auto c = matchFirst(split[$-1], regex(`(\w+)\[(\w+)\]`));
        int sector = to!int(c[1]);

        foreach(word; split[0..$-1]){
            foreach(ref i; word) i = 'a' + (i-'a' + sector) % 26;
            if(word == "north" || word == "pole" || word == "object") 
                writeln(sector);
        }
        if(code == c[2]) {
            sector_sum += sector;
        }
    }
    writeln(sector_sum);
}
