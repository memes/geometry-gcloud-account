# -*- mode: sh; eval: (sh-set-shell "zsh") -*-

GEOMETRY_PLUGIN_GCLOUD_ACCOUNT_COLOR=${GEOMETRY_PLUGIN_GCLOUD_ACCOUNT_COLOR:-"blue"}
GEOMETRY_PLUGIN_GCLOUD_ACCOUNT_PREFIX=${GEOMETRY_PLUGIN_GCLOUD_ACCOUNT_PREFIX:-"["}
GEOMETRY_PLUGIN_GCLOUD_ACCOUNT_SUFFIX=${GEOMETRY_PLUGIN_GCLOUD_ACCOUNT_SUFFIX:-"]"}

geometry_prompt_gcloud_account_setup() {
    (( $+commands[gcloud] )) || return 1
}

geometry_prompt_gcloud_account_check() {
    (( $+commands[gcloud] )) || return 1
}

geometry_prompt_gcloud_account_render() {
    local _gcloud_account=$(gcloud config get-value core/account)
    [ -z "${_gcloud_account}" ] && return
    echo -n "$(prompt_geometry_colorize ${GEOMETRY_PLUGIN_GCLOUD_ACCOUNT_COLOR} "${GEOMETRY_PLUGIN_GCLOUD_ACCOUNT_PREFIX}${_gcloud_account}${GEOMETRY_PLUGIN_GCLOUD_ACCOUNT_SUFFIX}")"
}

geometry_plugin_register gcloud_account
