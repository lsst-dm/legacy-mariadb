#!/usr/bin/env bash

config()
{

    ARGS=()

    ARGS+=("-DCMAKE_INSTALL_PREFIX=${PREFIX}")

    # Remove mysql-test directory (~330 MB) to reduce installation size
    ARGS+=("-DINSTALL_MYSQLTESTDIR=")

    ARGS+=("-DENABLE_DTRACE=NO")

    # TokuDB requires third-party software jemalloci (see http://www.canonware.com/jemalloc/)
    ARGS+=('-DPLUGIN_TOKUDB=NO')
    ARGS+=('-DPLUGIN_CASSANDRA=NO')
    ARGS+=('-DPLUGIN_ROCKSDB=NO')

    cmake . "${ARGS[@]}"
}
