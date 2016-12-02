import std.stdio;
import std.string;
import std.file : read;
import std.conv : to;
import std.algorithm.comparison : clamp;
import std.math : abs;

void main(string[] args) {
    //int[][] numPad = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];
    char[][] numPad =
        [ ['0', '0', '1', '0', '0'],
          ['0', '2', '3', '4', '0'],
          ['5', '6', '7', '8', '9'],
          ['0', 'A', 'B', 'C', '0'],
          ['0', '0', 'D', '0', '0'] ];
    int x = 0, y = 2;
    foreach(line; stdin.byLine) {
        foreach(c; line) {
            int nx = x, ny = y;
                 if(c == 'L') nx = x-1;
            else if(c == 'R') nx = x+1;
            else if(c == 'U') ny = y-1;
            else if(c == 'D') ny = y+1;
            nx = clamp(nx, 0, 4);
            ny = clamp(ny, 0, 4);
            if(numPad[ny][nx] != '0') {
                x = nx;
                y = ny;
            }
        }
        write(numPad[y][x]);
    }
    writeln();
}
