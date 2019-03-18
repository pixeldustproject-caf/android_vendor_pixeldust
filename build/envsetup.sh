function pixeldust_device_combos()
{
    local T list_file variant device

    T="$(gettop)"
    list_file="${T}/vendor/pixeldust/pixeldust.devices"
    variant="userdebug"

    if [[ $1 ]]
    then
        if [[ $2 ]]
        then
            list_file="$1"
            variant="$2"
        else
            if [[ ${VARIANT_CHOICES[@]} =~ (^| )$1($| ) ]]
            then
                variant="$1"
            else
                list_file="$1"
            fi
        fi
    fi

    if [[ ! -f "${list_file}" ]]
    then
        echo "unable to find device list: ${list_file}"
        list_file="${T}/vendor/pixeldust/pixeldust.devices"
        echo "defaulting device list file to: ${list_file}"
    fi

    while IFS= read -r device
    do
        add_lunch_combo "pixeldust_${device}-${variant}"
    done < "${list_file}"
}

function bootleg_rename_function()
{
    eval "original_pixeldust_$(declare -f ${1})"
}

function _pixeldust_build_hmm() #hidden
{
    printf "%-8s %s" "${1}:" "${2}"
}

function pixeldust_append_hmm()
{
    HMM_DESCRIPTIVE=("${HMM_DESCRIPTIVE[@]}" "$(_pixeldust_build_hmm "$1" "$2")")
}

function pixeldust_add_hmm_entry()
{
    for c in ${!HMM_DESCRIPTIVE[*]}
    do
        if [[ "${1}" == $(echo "${HMM_DESCRIPTIVE[$c]}" | cut -f1 -d":") ]]
        then
            HMM_DESCRIPTIVE[${c}]="$(_pixeldust_build_hmm "$1" "$2")"
            return
        fi
    done
    pixeldust_append_hmm "$1" "$2"
}

function pixeldustremote()
{
    local proj pfx project

    if ! git rev-parse &> /dev/null
    then
        echo "Not in a git directory. Please run this from an Android repository you wish to set up."
        return
    fi
    git remote rm pixeldustdevices 2> /dev/null

    proj="$(pwd -P | sed "s#$ANDROID_BUILD_TOP/##g")"

    if (echo "$proj" | egrep -q 'external|system|build|bionic|art|libcore|prebuilt|dalvik') ; then
        pfx="android_"
    fi

    project="${proj//\//_}"

    git remote add pixeldustdevices "git@github.com:PixeldustProject-Devices/$pfx$project"
    echo "Remote 'pixeldustdevices' created"
}

function losremote()
{
    local proj pfx project

    if ! git rev-parse &> /dev/null
    then
        echo "Not in a git directory. Please run this from an Android repository you wish to set up."
        return
    fi
    git remote rm losgit 2> /dev/null

    proj="$(pwd -P | sed "s#$ANDROID_BUILD_TOP/##g")"
    pfx="android_"
    project="${proj//\//_}"
    git remote add losgit "git@github.com:LineageOS/$pfx$project"
    echo "Remote 'losgit' created"
}

function aospremote()
{
    local pfx project

    if ! git rev-parse &> /dev/null
    then
        echo "Not in a git directory. Please run this from an Android repository you wish to set up."
        return
    fi
    git remote rm aosp 2> /dev/null

    project="$(pwd -P | sed "s#$ANDROID_BUILD_TOP/##g")"
    if [[ "$project" != device* ]]
    then
        pfx="platform/"
    fi
    git remote add aosp "https://android.googlesource.com/$pfx$project"
    echo "Remote 'aosp' created"
}

function cafremote()
{
    local pfx project

    if ! git rev-parse &> /dev/null
    then
        echo "Not in a git directory. Please run this from an Android repository you wish to set up."
    fi
    git remote rm caf 2> /dev/null

    project="$(pwd -P | sed "s#$ANDROID_BUILD_TOP/##g")"
    if [[ "$project" != device* ]]
    then
        pfx="platform/"
    fi
    git remote add caf "git://codeaurora.org/$pfx$project"
    echo "Remote 'caf' created"
}


pixeldust_rename_function hmm
function hmm() #hidden
{
    local i T
    T="$(gettop)"
    original_pixeldust_hmm
    echo

    echo "vendor/pixeldust extended functions. The complete list is:"
    for i in $(grep -P '^function .*$' "$T/vendor/pixeldust/build/envsetup.sh" | grep -v "#hidden" | sed 's/function \([a-z_]*\).*/\1/' | sort | uniq); do
        echo "$i"
    done |column
}

pixeldust_append_hmm "pixeldustremote" "Add a git remote for matching Pixeldusts repository"
pixeldust_append_hmm "aospremote" "Add git remote for matching AOSP repository"
pixeldust_append_hmm "cafremote" "Add git remote for matching CodeAurora repository."
