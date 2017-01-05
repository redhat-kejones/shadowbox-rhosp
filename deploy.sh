#!/usr/bin/env bash

cd ~
source ~/stackrc

#	-e /home/stack/templates/cloudname.yaml \

openstack overcloud deploy --templates \
	-e /home/stack/templates/storage-environment.yaml \
	-e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
	-e /home/stack/templates/network-environment.yaml \
	-e /home/stack/templates/firstboot-environment.yaml \
	--control-flavor control \
	--compute-flavor compute \
	--control-scale 1 \
	--compute-scale 4 \
	--ceph-storage-scale 0 \
	--ntp-server 192.168.0.3 \
        --timeout 60 \
	--neutron-tunnel-types vxlan \
	--neutron-network-type vxlan
