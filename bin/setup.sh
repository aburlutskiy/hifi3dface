#!/bin/bash

function unzip_files {
    set -e

    DDIR="$HOME/Downloads"

    TDMM="Tencent AI-NEXT 3D Face Model (East-Asian Version).zip"

    if [[ -f "$DDIR/$TDMM" ]];then
        TDMM_PATH="$DDIR/$TDMM"
    elif [[ -f $TDMM ]];then
        TDMM_PATH="$PWD/$TDMM"
    else
        echo "You must download '$TDMM' file."
        exit 1
    fi

    (cd 3DMM && unzip "$TDMM_PATH")

    # -------------------------------

    TDATA="test_data.zip"
    if [[ -f "$DDIR/$TDATA" ]];then
        TDATA_PATH="$DDIR/$TDATA"
    elif [[ -f "$PWD/$TDATA" ]];then
        TDATA_PATH="$PWD/$TDATA"
    else
        echo "You must download '$TDATA' file."
        exit 1
    fi

    unzip "$TDATA_PATH"

    # -------------------------------
    TRES="resources.zip"
    if [[ -f "$DDIR/$TRES" ]];then
        TRES_PATH="$DDIR/$TRES"
    elif [[ -f "$PWD/$TRES" ]];then
        TRES_PATH="$PWD/$TRES"
    else
        echo "You must download '$TRES' file."
        exit 1
    fi

    unzip "$TRES_PATH"
}

# -------------------------------
if [[ $SKIP_ZIP != 1 ]];then
    unzip_files
fi

BASENAME=hifi3dface-base-ubuntu

docker build -t $BASENAME -f Dockerfile.base-ubuntu .

docker build -t hifi3dface .
