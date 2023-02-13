return function()
    -- ask LuaJIT first
    if jit then return jit.os end

    -- Unix, Linux variants
    local fh, _ = assert(io.popen('uname -o 2>/dev/null', 'r'))
    if fh then return fh:read() end

    return 'Windows'
end
