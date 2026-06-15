local source = {}

function source.new() return setmetatable({}, { __index = source }) end

function source:is_available() return true end

function source:get_debug_name() return "git-conventional-commits" end

function source:get_trigger_characters() return { "" } end

function source:complete(params, callback)
  callback({
    items = {
      { label = "feat:" },
      { label = "fix:" },
      { label = "perf:" },
      { label = "refactor:" },
      { label = "style:" },
      { label = "test:" },
      { label = "build:" },
      { label = "ops:" },
      { label = "docs:" },
      { label = "chore:" },
      { label = "merge:" },
      { label = "revert:" },
    },
    isIncomplete = false,
  })
end

require("cmp").register_source("git-conventional-commits", source.new())
