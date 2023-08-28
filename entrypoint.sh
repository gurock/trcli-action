#!/bin/bash

# Functions
function append_param {
    local param=$1
    local value=$2
    if [ ! -z "$value" ]; then 
        TRCLI_PARAMS="$TRCLI_PARAMS $param \"$value\""; 
    fi
}

function append_param_no_val {
    local param=$1
    local value=$2
    if [[ "${value^^}" == "TRUE" ]]; then
        TRCLI_PARAMS="$TRCLI_PARAMS $param"; 
    fi
}

# Navigate to work dir
WORKING_DIR=${27}
cd $WORKING_DIR
ls

# Parameters
TRCLI_PARAMS=""

# General parameters
append_param -c "${2}"
append_param -h "${3}"
append_param -u "${4}"
append_param -p "${5}"
append_param --project "${6}"
append_param --project-id "${7}"
append_param_no_val -v "${8}"
append_param_no_val --verify "${9}"
append_param_no_val --insecure "${10}"
append_param -b "${11}"
append_param -t "${12}"
append_param_no_val -y "${13}"
append_param_no_val -n "${14}"
append_param_no_val -s "${15}"

# JUnit parser parameters
TRCLI_PARAMS="$TRCLI_PARAMS parse_junit"
append_param -f "${16}"
append_param --title "${17}"
append_param_no_val --close-run "${18}"
append_param --case-matcher "${19}"
append_param --suite-id "${20}"
append_param --run-id "${21}"
append_param --milestone-id "${22}"
append_param --run-description "${23}"
append_param --special-parser "${24}"
append_param_no_val --allow-ms "${25}"
TRCLI_PARSE_JUNIT_EXTRA_PARAMS="${26}"

# Install trcli
TRCLI_PACKAGE="trcli"
TRCLI_VERSION=$1
if [[ ! -z "${TRCLI_VERSION}" ]]; then
    TRCLI_PACKAGE="${TRCLI_PACKAGE}==$TRCLI_VERSION"; 
fi
echo "Installing $TRCLI_PACKAGE"
pip --disable-pip-version-check install $TRCLI_PACKAGE

# Execute trcli
TRCLI_CMD="trcli $TRCLI_PARAMS $TRCLI_PARSE_JUNIT_EXTRA_PARAMS"
eval "$TRCLI_CMD"

echo "### TestRail CLI! :rocket:" >> $GITHUB_STEP_SUMMARY