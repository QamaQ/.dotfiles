local M = {}

M.AI = ""
M.lupa = ""
M.lock = ""
M.menu = "☰"
M.window = ""
M.home = ""
M.camera = ""
M.line_number = ""
M.connected = "󱘖"
M.windows = ""
M.unix = ""
M.mac = ""
M.terminal = ""
M.remote = "󰒋"
M.pin_tilted = ""
M.pin_filled = "󰐃"
M.pin_rounded = ""
M.pin_location = ""
M.pin_unicode_tilted = "📌"
M.pin_unicode_rounded = "📍"
M.lightbulb = "󰌵"
M.lightbulb_eco = "󱈈"
M.lightbulb_unicode = "💡"
M.hook = "󰛢"
M.mathematical_L = "𝑳"
M.fire = ""
M.fast = "󰅒"
M.message = "󰍩"
M.circled_check = ""
M.brackets = "󰅪"
M.braces = "󰅩"
M.pointy_brackets = ""
M.models = "⊨"
M.empty_set = "∅"
M.shapes = "󰠱"
M.empty_square = ""
M.rhombus = ""
M.circle = ""
M.double_circle = ""
M.empty_circle = ""
M.small_circle = ""
M.circled_info = ""
M.circled_error = ""
M.plus = "󰐕"
M.cross = ""
M.circled_cross = ""
M.fat_cross = ""
M.check = "✓"
M.fat_check = ""
M.three_dots = ""
M.cube = ""
M.prism = ""
M.bracketed_prism = ""
M.box = ""
M.package = "󰏗"
M.settings = ""
M.tool = ""
M.func = "󰊕"
M.add_tag = "󰜢"
M.tic_tac_toe = ""
M.both_ways = ""
M.small_parent_tree = ""
M.big_parent_tree = ""
M.three_children_tree = ""
M.dropdown = ""
M.lightning = ""
M.filled_lightning = ""
M.math_ops = ""
M.plus_minus = "󰦒"
M.letter = "󰬴"
M.quoted_letter = ""
M.text = "󰊄"
M.a_to_z = ""
M.abc = ""
M.boxed_abc = ""
M.one_two_three = "󰎠"
M.communicator = ""
M.symmetrical_comms = ""
M.asymmetrical_comms = ""
M.circle_conn = ""
M.exit = "󰗼"
M.color_palette = ""
M.key = "󰌋"
M.ruler = ""
M.wifi = ""
M.globe = ""
M.earth = ""
M.circled_question = ""
M.question = "?"
M.fat_question = ""
M.filter = ""

M.geometry = {
    shadow_cube = "",
    cube = "󰆧",
}

M.language = {
    python = "",
    lua = "",
}

M.tool = {
    docker = "󰡨",
    venv = M.geometry.cube,
    kernel = "",
}

M.bar = {
    vertical_block = "█",
    vertical_center = "┃",
    vertical_center_thin = "│",
    vertical_left_thick = "▌",
    vertical_left = "▎",
    vertical_left_thin = "▏",
    vertical_right = "▎",
    vertical_right_thin = "▕",
    vertical_right_thick = "▐",
    upper_right_corner = "┓",
    upper_right_corner_thin = "┐",
    upper_left_corner = "┏",
    upper_left_corner_thin = "┌",
    lower_left_corner = "┗",
    lower_left_corner_thin = "└",
    lower_right_corner = "┛",
    horizontal = "━",
    horizontal_thin = "─",
    lower_horizontal = "▁",
    lower_horizontal_thin = "_",
    lower_horizontal_thick = "▄", -- lower half block (unicode)
    lower_right_corner_thick = "▟",
    lower_left_corner_thick = "▙",
    upper_horizontal_thick = "▀",
    upper_right_corner_thick = "▜",
    upper_left_corner_thick = "▛",
}

M.arrow = {
    right = "→",
    down_left = "󰁃",
    right_short = "",
    right_short_thick = "",
    down_short_thick = "",
    right_tall = "",
    down_short = "",
    double_right_short = "»",
    double_up_short = "",
    double_down_short = "",
    left_circled = "",
    right_circled = "",
    right_down_curved = "󱞩",
    circular = "",
    right_upper_curved = "󱞫",
}

M.greek = {
    alpha = "󰀫",
    pi = "",
}

M.file = {
    empty = "󰈤",
    blank = "󰈔",
    filled = "󰈙",
    page = "",
    symlink = "󰈪",
    files = "󱔗",
}

M.folder = {
    default = "󰉋",
    open = "󰝰",
    empty = "󰉖",
    empty_open = "󰷏",
    symlink = "󰉒",
}

M.diagnostics = {
    error = "",
    warning = "",
    info = "",
    hint = "",
    bug = "",
}

M.git = {
    github = "",
    gitlab = "",
    logo = "",
    committer = "",
    commit = "󰜘",
    added = "",
    added_and_modified = "⊕",
    removed = "",
    changed = "",
    modified = M.small_circle,
    -- branch = "",
    branch = "",
    unstaged = M.empty_square,
    staged = M.plus,
    unmerged = "󱓋",
    renamed = M.arrow.right,
    untracked = M.question,
    conflict = "󱓌",
    ignored = "",
    deleted = M.cross,
    copied = "",
    type_changed = M.shapes,
}

M.numbers = {
    boxed = { "󰎦", "󰎩", "󰎬", "󰎮", "󰎰", "󰎵", "󰎸", "󰎻", "󰎾" },
    boxed_filled = { "󰎤", "󰎧", "󰎪", "󰎭", "󰎱", "󰎳", "󰎶", "󰎹", "󰎼", "󰽽" },
    circled = { "①", "②", "③", "④", "⑤", "⑥", "⑦", "⑧", "⑨", "⑩", "⑪", "⑫" },
    circled_filled = { "󰲠", "󰲢", "󰲤", "󰲦", "󰲨", "󰲪", "󰲬", "󰲮", "󰲰" },
    dice = { "⚀", "⚁", "⚂", "⚃", "⚄", "⚅" },
    roman = { "|", "Ⅱ", "Ⅲ", "Ⅳ", "Ⅴ", "Ⅵ", "Ⅶ", "Ⅷ", "Ⅸ", "Ⅹ", "Ⅺ", "Ⅻ" },
    arabic = { "󰬺", "󰬻", "󰬼", "󰬽", "󰬾", "󰬿", "󰭀", "󰭁", "󰭂" },
    header = { "󰉫", "󰉬", "󰉭", "󰉮", "󰉯", "󰉰" },
}

M.copilot = {
    enabled = "",
    sleep = "󰒲",
    disabled = "",
    warning = "",
    unknown = "",
}

M.dap = {
    breakpoint = M.circle,
    breakpoint_disabled = M.empty_circle,
    breakpoint_conditional = M.double_circle,
    breakpoint_log = M.circled_info,
    breakpoint_rejected = M.circled_error,
    stopped = M.arrow.right,
    disconnect = "",
    pause = "",
    play = "",
    run_last = "",
    step_back = "",
    step_into = "",
    step_out = "",
    step_over = "",
    terminate = "",
}

M.border = {
    straight = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    straight_bqf = { "│", "│", "─", "─", "┌", "┐", "└", "┘", "│" },
    empty = { " ", " ", " ", " ", " ", " ", " ", " " },
    none = { "", "", "", "", "", "", "", "" },
}

return M
