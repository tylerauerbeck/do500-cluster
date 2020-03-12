# DO500 Cluster

# This assumes we've received a 4.X cluster from GLS with valid certificates. This also assumes that the cluster has been deployed alongside IdM, users have been created and the cluster has been rigged up to utilize that IdM

- ! Should we just deploy IdM in the cluster? Or even just take MH approach and use a keycloak in the cluster? !


helm install:

# wave 1 - foundation
projects,secrets

# wave 2 - mgmt apps
operators(argocd,crw), gitlab (and all its requirements)

# wave 2.5 - more mgmt, but after
argocd CR, crw CR

# wave 3 - do500 reqs
imagestreams

wave 4 - jobs, jobs, jobs
any extra jobs that are needed to finish cleanup / prepping the cluster
