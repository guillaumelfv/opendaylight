# OpenDayLight controller

[OpenDayLight (ODL)](https://www.OpenDayLight.org/) is an SDN OpenFlow controller, useful to control and orchestrate network of switches that speak the Openflow protocol on your infrastructure. It support others southbound protocol and can be integrated in Openstack or even Kubernetes.

This container offer an OpenDayLight base installation without any module pre-installed. You can install module via CLI.
Exposed ports:
- `6633`: Openflow protocol port use to connect Openflow devices
- `8181`: DLUX WebUI listening port
- `8101`: SSH port use to remote login into the remote Karaf CLI

## Supported tags
- `latest`  [Oxygen Documentation](https://docs.opendaylight.org/en/stable-oxygen/)
- `0.8.4-Oxygen` [Oxygen Documentation](https://docs.opendaylight.org/en/stable-oxygen/)
- `0.5.0-Boron` [Boron Documentation](https://docs.OpenDayLight.org/en/stable-boron/#)

## How to use this container
#### Run container
`docker run -d -p 6633:6633 -p 8181:8181 -p 8101:8101 --name=OpenDayLight glefevre/opendaylight`

You can access the remote Karaf CLI via SSH: `ssh -p 8101 karaf@localhost`
*Default password is "karaf"*

#### Install and access the DLUX Web UI

Access the remote Karaf CLI via SSH and install the dlux modules:
`feature:install odl-dlux-core odl-dluxapps-applications`

You can access the WebUI at the following url: `http://localhost:8181/index.html`
*Default credential is "admin/admin"*