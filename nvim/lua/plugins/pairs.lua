require("mini.pairs").setup(
    {
        mappings = {
            -- This makes it so when adding a " before or after a letter, it will only add a single "
            ['"'] = {action = "closeopen", pair = '""', neigh_pattern = "[^%a\\][^%a]", register = {cr = false}},
            ["'"] = {action = "closeopen", pair = "''", neigh_pattern = "[^%a\\][^%a]", register = {cr = false}},
            ["`"] = {action = "closeopen", pair = "``", neigh_pattern = "[^%a\\][^%a]", register = {cr = false}}
        }
    }
)
