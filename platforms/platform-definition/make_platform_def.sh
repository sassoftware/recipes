#!/bin/bash
set -x -v

cd $(dirname $0)
rbuilder_forest="$1"
shift || exit 1

main_dir=$(pwd)

dev_project=Newton
dev_label_prefix="newton.eng.rpath.com@rpath"

platforms="centos-6 rhel-6 windows"

major_version=4
#major_version=$(grep major_version ../../bob-plans/config/version.conf | cut -d' ' -f3)

write_pd() {
    local pd_label="$1"
    local release_label="$2"
    local release_version="$3"
    local project="$4"
    echo "$pd_label"
    rm -rf platform-definition
    if ! cvc co "platform-definition=$pd_label" 2>/dev/null
    then
        cvc newpkg "platform-definition=$pd_label" || return 1
    fi
    cp platform-definition.recipe platform-definition/
    for plat_def in platform-definition-*.xml.template
    do
        sed -e "s#%(project_name)s#${project}#g" \
            -e "s#%(release_version)s#${release_version}#g" \
            -e "s#%(release_label)s#${release_label}#g" \
            ${plat_def} \
            > platform-definition/${plat_def//.template} \
        || return 1
    done
#    (
#        cd platform-definition;
#        for ${plat_def} in platform-definition-*.xml;do cvc add ${plat_def 2>/dev/null || return 127;done;
#        cvc add --text platform-definition.recipe 2>/dev/null;
#        cvc commit -m 'automatic update'
#    )
    return $?
}

for platform in ${platforms}
do
    cd $platform/
    echo $(pwd)
    dev_label="${dev_label_prefix}:${platform}-${rbuilder_forest}"
    write_pd "$dev_label" "$dev_label" "$rbuilder_forest" "$dev_project"
    cd $main_dir
done
