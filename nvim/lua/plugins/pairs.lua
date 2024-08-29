require("mini.pairs").setup(
    {
        mappings = {
            -- This makes it so when adding a " after a letter, it will only add a single "
            ['"'] = {action = "closeopen", pair = '""', neigh_pattern = "[^%a\\].", register = {cr = false}}
        }
    }
)
