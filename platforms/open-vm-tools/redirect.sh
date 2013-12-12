#!/bin/bash

sed -i 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' libtool

sed -i 's|^runpath_var=LD_RUN_PATH|runpath_var=NO_RPATH_NO|g' libtool

