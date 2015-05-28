#!/bin/bash
#
# Copyright (c) SAS Institute Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


url="http://delphi.unx.sas.com/conaryrc"
# Must be outside of config.d because otherwise conary might try to read the
# temp file
tmpfile=/etc/conaryrc.tmp
dest=/etc/conary/config.d/repomaps
echo "# Periodically fetched from $url, do not edit" >$tmpfile
if curl -kfs "$url" >>$tmpfile
then
    mv $tmpfile $dest
    exit 0
else
    rm -f $tmpfile
    echo Failed to update conaryrc from delphi
    exit 1
fi
