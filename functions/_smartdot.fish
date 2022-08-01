function _smartdot -d "Expands ... to ../.."
    switch (commandline --current-token)
        case "*.."
            commandline --insert "/.."
        case "*"
            commandline --insert "."
    end
end
