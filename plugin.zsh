# -*- mode: sh; eval: (sh-set-shell "zsh") -*-

geometry_gcloud_account() {
    (( $+commands[gcloud] )) || return
    local _gcloud_account=$(gcloud config get-value core/account)
    [ -z "${_gcloud_account}" ] && return
    ansi ${GEOMETRY_PLUGIN_GCLOUD_ACCOUNT_COLOR:-red} "${GEOMETRY_PLUGIN_GCLOUD_ACCOUNT_PREFIX:-"["}${_gcloud_account}${GEOMETRY_PLUGIN_GCLOUD_ACCOUNT_SUFFIX:-"]"}"
}
