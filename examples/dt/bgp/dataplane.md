# Configuring and deploying the dataplane

## Assumptions

- The [control plane](control-plane.md) has been created and successfully deployed
- An infrastructure of spine/leaf routers exists, is properly connected to the
  pre-provisioned EDPM nodes and the routers are configured to support BGP.

## Initialize

Switch to the "openstack" namespace
```
oc project openstack
```
Change to the bgp/edpm directory
```
cd architecture/examples/dt/bgp/edpm
```
Edit the [values.yaml](edpm/values.yaml) file to suit 
your environment.
```
vi values.yaml
```
Generate the dataplane CRs.
```
kustomize build > dataplane.yaml
```

## Create CRs
```
oc apply -f dataplane.yaml
```

Wait for dataplane deployment to finish
```
oc wait osdpd edpm-deployment --for condition=Ready --timeout=1200s
```
