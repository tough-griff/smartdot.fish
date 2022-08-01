status is-interactive || exit

function _smartdot_fish_key_bindings --on-variable fish_key_bindings
    test $fish_key_bindings = fish_default_key_bindings && set --local modes default insert || set --local modes insert default

    bind --mode $modes[-1] --erase "."
    bind --mode $modes[1] "." _smartdot
end

_smartdot_fish_key_bindings

function _smartdot_uninstall --on-event smartdot_uninstall
    bind --erase "."
    functions --erase (functions --all | string match "_smartdot*")
end
