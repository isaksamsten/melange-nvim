-- Scripts to compile Lush colors to different targets, including:
    -- Viml
    -- Alacritty

local uv = vim.loop
local lush = require('lush')
local c = require('melange.colors')

local function build_alacritty()
    return table.concat({
        "  primary:",
        "    foreground: '" .. c.Normal.fg .. "'",
        "    background: '" .. c.Normal.bg .. "'",
        "  normal:",
        "    white:   '" .. c.Normal.fg .. "'",
        "    black:   '" .. c.Normal.bg .. "'",
        "    red:     '" .. c.Error.fg .. "'",
        "    yellow:  '" .. c.Function.fg .. "'",
        "    green:   '" .. c.PreProc.fg .. "'",            -- teal
        "    cyan:    '" .. c.Type.fg .. "'",
        "    blue:    '" .. c.String.fg .. "'",
        "    magenta: '" .. c.Constant.fg .. "'",
        "  bright:",
        "    white:   '" .. c.Search.fg .. "'",             -- pop
        "    black:   '" .. c.Conceal.fg .. "'",            -- faded
        "    red:     '" .. c.Operator.fg .. "'",
        "    yellow:  '" .. c.Statement.fg .. "'",          -- orange
        "    green:   '" .. c.Question.fg .. "'",
        "    cyan:    '" .. c.Type.fg .. "'",
        "    blue:    '" .. c.String.fg .. "'",
        "    magenta: '" .. c.Number.fg .. "'",             -- purple
    }, "\n")
end

local function build_viml()
    local parsed = lush(c)
    local compiled = lush.compile(parsed, {force_clean = true })
    return table.concat(compiled, '\n')
end

local targets = {
    alacritty = build_alacritty,
    viml      = build_viml,
}

local function build(t, dir)
    local colors = targets[t]()
    local fd = assert(uv.fs_open(dir, 'w', 420))
    uv.fs_write(fd, colors, -1)
    assert(uv.fs_close(fd))
end

-- TODO: proper path handling. libuv can't tell where the script is located...
build('viml', './term/alacritty.yml')
build('alacritty', './term/alacritty.yml')

--return {
--    build = build,
--}