#!/usr/bin/env bash

config()
{

    ARGS=()

    ARGS+=("-DCMAKE_INSTALL_PREFIX=${PREFIX}")

    # Remove mysql-test directory (~330 MB) to reduce installation size
    ARGS+=("-DINSTALL_MYSQLTESTDIR=")

    # TokuDB requires third-party software jemalloci (see http://www.canonware.com/jemalloc/)
    ARGS+=('-DPLUGIN_TOKUDB=NO')

    # Always use bundled PCRE
    ARGS+=('-DWITH_PCRE=bundled')

    # Prevent CMake from finding and linking against libraries distributed in $(dirname
    # python)/../lib. This is CMake's default behaviour, but can cause us to erroneously link
    # against libraries distributed by e.g. Anaconda.
    PYTHONLIBDIR=$(which python | sed -e's|bin/python|lib|')
    ARGS+=("-DCMAKE_SYSTEM_IGNORE_PATH=${PYTHONLIBDIR}")

    case $(uname) in
        Linux*)
            ;;
        Darwin*)
            # Disable external SSL on OS X as it is not a standard library
            # and LSST does not need full SSL support.
            ARGS+=('-DWITH_SSL=bundled')
            ;;
        *)
            # non-fatal
            echo "unsupported platform: $(uname)"
            ;;
    esac

    cmake . "${ARGS[@]}"
}
