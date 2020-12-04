**This repository is archived and this chart is now being maintained here: https://github.com/rht-labs/enablement-framework**


# DO500 Cluster

- This assumes we've received a 4.X cluster from GLS with valid certificates. This also assumes that the cluster has been deployed alongside IdM, users have been created and the cluster has been rigged up to utilize that IdM

# Install:

`helm template . | oc apply -f -`
