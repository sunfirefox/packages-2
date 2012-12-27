export DRIVE=C
export CYGROOT=/cygdrive/c
export SDKVER="8.0"
export VSVER="11.0"
export PFBARE="Program Files"

KIND="$1"
if [ "${KIND}" = "" ] ; then
    if [ ${PROCESSOR_ARCHITEW6432} = AMD64 ] ; then
        KIND=x64
    else
        KIND=x86
    fi
fi

if [ -x "${DRIVE}:/Program Files (x86)" ] ; then
    export PF="Program Files (x86)"
else
    export PF="${PFBARE}"
fi

if [ "$KIND" = '' ] ; then
    ARCH=`./getarch`
elif [ "$KIND" = 'x64' ] ; then
    ARCH=x86_64
else
    ARCH="$KIND"
fi

export CommonProgramFiles="${DRIVE}:\${PF}\Common Files"
export ComSpec="${DRIVE}:\WINDOWS\system32\cmd.exe"
export DevEnvDir="${DRIVE}:\${PF}\Microsoft Visual Studio ${VSVER}\Common7\IDE"
export HOMEDRIVE="${DRIVE}:"
export INCLUDE="${DRIVE}:\\${PF}\\Microsoft Visual Studio ${VSVER}\\VC\\INCLUDE;${DRIVE}:\\${PFBARE}\\Microsoft SDKs\\Windows\\${SDKVER}\\include;${DRIVE}\\${PF}\\Windows Kits\\${SDKVER}\\include\um;${DRIVE}\\${PF}\\Windows Kits\\${SDKVER}\\include\\shared"
export INCLUDE="${DRIVE}:\\${PF}\\Windows Kits\\${SDKVER}\\include\\um;${DRIVE}:\\${PF}\\Windows Kits\\${SDKVER}\\include\\shared;${DRIVE}:\\${PF}\\Microsoft Visual Studio ${VSVER}\\VC\\INCLUDE;${DRIVE}:\\${PFBARE}\\Microsoft SDKs\\Windows\\${SDKVER}\\include;"

echo
if [ "$ARCH" = x86_64 ] ; then
    export LIB="${DRIVE}:\\${PF}\\Microsoft Visual Studio ${VSVER}\\VC\\LIB\\amd64;${DRIVE}:\\${PFBARE}\\Microsoft SDKs\\Windows\\${SDKVER}\\lib\x64;${DRIVE}:\\${PF}\\Windows Kits\\${SDKVER}\\Lib\\win8\\um\\x64"
    export PATH="`pwd`/bin:/cygdrive/${DRIVE}/${PF}/Microsoft Visual Studio ${VSVER}/Common7/IDE:/cygdrive/${DRIVE}/${PF}/Microsoft Visual Studio ${VSVER}/VC/BIN/amd64:/cygdrive/${DRIVE}/${PF}/Microsoft Visual Studio ${VSVER}/Common7/Tools:/cygdrive/${DRIVE}/WINDOWS/Microsoft.NET/Framework/v3.5:/cygdrive/${DRIVE}/WINDOWS/Microsoft.NET/Framework/v2.0.50727:/cygdrive/${DRIVE}/${PF}/Microsoft Visual Studio ${VSVER}/VC/VCPackages:/cygdrive/${DRIVE}/${PFBARE}/Microsoft SDKs/Windows/${SDKVER}/bin:/cygdrive/${DRIVE}/${PF}/Windows Kits/${SDKVER}/bin/x64:/cygdrive/${DRIVE}/WINDOWS/system32:/cygdrive/${DRIVE}/WINDOWS:/cygdrive/${DRIVE}/bin:/cygdrive/${DRIVE}/usr/bin:/cygdrive/${DRIVE}/usr/local/bin:/bin:/usr/bin:/usr/local/bin"
    BITS=64

else 
    export LIB="${DRIVE}:\\${PF}\\Microsoft Visual Studio ${VSVER}\\VC\\LIB;${DRIVE}:\\${PFBARE}\\Microsoft SDKs\\Windows\\${SDKVER}\\lib;${DRIVE}:\\${PFBARE}\\Windows Kits\\${SDKVER}\\Lib\\win8\\um\\x86"
    export PATH="`pwd`/bin:/cygdrive/${DRIVE}/${PF}/Microsoft Visual Studio ${VSVER}/Common7/IDE:/cygdrive/${DRIVE}/${PF}/Microsoft Visual Studio ${VSVER}/VC/BIN:/cygdrive/${DRIVE}/${PF}/Microsoft Visual Studio ${VSVER}/Common7/Tools:/cygdrive/${DRIVE}/WINDOWS/Microsoft.NET/Framework/v3.5:/cygdrive/${DRIVE}/WINDOWS/Microsoft.NET/Framework/v2.0.50727:/cygdrive/${DRIVE}/${PF}/Microsoft Visual Studio ${VSVER}/VC/VCPackages:/cygdrive/${DRIVE}/${PFBARE}/Microsoft SDKs/Windows/${SDKVER}/bin:/cygdrive/${DRIVE}/${PFBARE}/Windows Kits/${SDKVER}/bin/x86:/cygdrive/${DRIVE}/WINDOWS/system32:/cygdrive/${DRIVE}/WINDOWS:/cygdrive/${DRIVE}/bin:/cygdrive/${DRIVE}/usr/bin:/cygdrive/${DRIVE}/usr/local/bin:/bin:/usr/bin:/usr/local/bin"
    BITS=32
fi

unalias mc 2>/dev/null

echo
type cl
type link
echo
echo LIB $LIB 
echo
echo INCLUDE $INCLUDE 
echo
echo PATH $PATH 
echo
echo NOTE: Configured for ${BITS} bit builds
echo
