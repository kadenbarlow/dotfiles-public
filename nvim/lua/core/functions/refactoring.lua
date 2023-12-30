local refactoring = require("refactoring")

function DebugPrint()
    refactoring.debug.printf({below = false})
end

function DebugPrintVariable()
    refactoring.debug.print_var()
end

function DeleteDebugStatements()
    refactoring.debug.cleanup({})
end
