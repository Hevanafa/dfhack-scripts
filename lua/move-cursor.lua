

local args = {...}

assert(#args >= 3, "x y z are required!")

local cur = copyall(df.global.cursor)

assert(cur, "(l)ook mode is required!")

df.global.cursor.x = tonumber(args[1])
df.global.cursor.y = tonumber(args[2])
df.global.cursor.z = tonumber(args[3])
