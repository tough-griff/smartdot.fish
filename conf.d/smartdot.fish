status is-interactive || exit

function _smartdot_fish_key_bindings --on-variable fish_key_bindings
    set --query fish_key_bindings[1] || return

    test $fish_key_bindings = fish_default_key_bindings &&
        set --local mode default insert ||
        set --local mode insert default

    bind --mode $mode[1] "." _smartdot
end

_smartdot_fish_key_bindings

function _smartdot_uninstall --on-event smartdot_uninstall
    bind --erase "."
    functions --erase (functions --all | string match "_smartdot*")
end
