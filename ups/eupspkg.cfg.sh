# EupsPkg config file. Sourced by 'eupspkg'

config()
{
    # TokuDB requires third-party software jemalloci (see http://www.canonware.com/jemalloc/)
    cmake . -DCMAKE_INSTALL_PREFIX=${PREFIX} -DPLUGIN_TOKUDB=NO \
        -DCMAKE_C_FLAGS_RELWITHDEBINFO="-g -gdwarf-2" \
        -DCMAKE_CXX_FLAGS_RELWITHDEBINFO="-g -gdwarf-2"
}
