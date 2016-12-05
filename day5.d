import std.stdio;
import std.string;
import std.digest.md;
import std.conv : to;


void main(string[] args) {
    auto md5 = new MD5Digest();
    char[] pwd = [' ', ' ', ' ', ' ' , ' ', ' ' , ' ', ' '];
    int count = 0;
    long idx = 0;
    while(count < 8){
        ubyte[] hash = md5.digest("cxdnnyjw" ~ to!string(idx++));
        string hash_str = toHexString(hash);
        if(hash_str[0 .. 5] == "00000" && hash_str[5] < '8') {
            if(pwd[hash_str[5] - '0'] != ' ') continue;
            count ++;
            pwd[hash_str[5] - '0'] = hash_str[6];
            writeln(idx, " ", hash_str);
        }
    }
    writeln(pwd);
}
