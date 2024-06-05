require"lfs"

assert(lfs.chdir("C:\\Users\\godis\\Documents\\Advent of Code\\2023"), "Change failed")

print(lfs.currentdir ())

io.input("New Text Document.lua")
io.output("New Text Document.lua")
t = io.read("*all")
    t = string.sub(t, 1, 3)
io.write(t)