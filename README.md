SAS App Engine Recipes -- Archived Repository
**Notice: This repository is part of a Conary/rpath project at SAS that is no longer supported or maintained. Hence, the repository is being archived and will live in a read-only state moving forward. Issues, pull requests, and changes will no longer be accepted.**
======================
 
This repository holds miscellaneous Conary recipes used to assemble the App
Engine appliance and other components.

centos-6n
---------

devimage-custom - Miscellaneous configuration for the devimage

group-devimage-appliance - Dev image

group-rbuilder-dist - This recipe builds several subgroups. group-rbuilder-dist
is not itself meant to be installed or built into an image.

* group-rbuilder-appliance - The main SAS App Engine group
* group-rbuilder-vapp - Used internally by SAS
* group-ha - Add-on group with high availability components
* group-rbuilder-devel - App Engine plus development tools

group-rpath-packages - A platform group used to test packages built with App
Engine that ship as part of OS platforms.

group-rpath-platform - A collection of third-party components that are consumed
as part of the App Engine build.

group-updateservice-appliance - Update Service image

platforms
---------

This directory contains recipes for OS platform components and groups.

product-definitions
-------------------

This directory contains product-definition templates that define which image
types are built for various App Engine components.
