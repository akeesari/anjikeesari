# Kubectl Commands

## Introduction

This is a comprehensive cheat sheet of commonly used **Kubectl** commands with examples.

Kubectl is the command line configuration tool for Kubernetes that communicates with a Kubernetes API server. Using Kubectl allows you to create, inspect, update, and delete Kubernetes objects.

## Installing Kubectl

Use the following commands to install kubectl on Linux, macOS, and Windows.

```bash
# Linux
sudo apt-get update
sudo apt-get install -y kubectl

# MacOS (using Homebrew):
brew install kubectl

# Windows OS (using Choco)
choco install kubernetes-cli

# Verify the installation by running
kubectl version
```

<!-- For more information [window](./software/windows/#install-kubernetes-cli-or-kubectl-cli) -->

## Connection to Kubernetes Cluster

We need to establish a connection to a Kubernetes cluster before we can utilize the power of kubectl commands. In this article, I will demonstrate the process using Azure Kubernetes Service (AKS), but keep in mind that you can connect to any Kubernetes cluster like Amazon Elastic Kubernetes Service (EKS), Google Kubernetes Engine (GKE), or any other Kubernetes platform to execute kubectl commands.

```bash
# Log in to Azure first
az login

az account list
# or
az account list --output table

# Select the subscription
az account set -s "<subscription-name>"

# Display information about the currently logged-in Azure subscription
az account show
# or
az account show --output table

# Connect to Cluster

# Connect to Azure Kubernetes Service Cluster with User Role
az aks get-credentials -g "<resource-group>" -n "<cluster-name>"

# Connect to Azure Kubernetes Service Cluster with Admin Role
az aks get-credentials -g "<resource-group>" -n "<cluster-name>" --admin

# Display detailed information about an AKS cluster
az aks show -g "<resource-group>" -n "<cluster-name>"
```
<!-- more info <https://learn.microsoft.com/en-us/azure/aks/control-kubeconfig-access#available-cluster-roles-permissions> -->

## Cluster Information

This command provides an overview of the cluster information, including the cluster endpoint, certificate authority, and other relevant details.

```bash
kubectl cluster-info
```

## Version

Retrieves the Kubernetes version information for the client, server, and other components.

```bash
kubectl version
kubectl version --short
kubectl version --short --client
```

## kubectl --help

This command provides a comprehensive overview of the kubectl command-line tool's usage, available commands, and options. It displays a detailed help message that guides you through the various functionalities and usage patterns of kubectl.

```bash
kubectl --help
kubectl logs --help
kubectl exec --help
kubectl describe --help
kubectl port-forward --help
```

## Set an Alias for kubectl

Set an alias for kubectl in PowerShell:

```powershell
# Set Alias
New-Alias -Name 'k' -Value 'kubectl'

# Verify
k get pods -n sample
```

Set an alias for kubectl in Bash:

```bash
# Set Alias
alias k=kubectl

# Verify
k get pods -n sample
```

## Context and Configuration

Kubernetes context and configuration are crucial concepts for managing multiple clusters and switching between them using kubectl.

**Configuration file:**

Kubectl uses a configuration file, usually located at `~/.kube/config` by default, to store cluster information, authentication details, and other settings.
The configuration file is written in YAML format and can contain multiple contexts, each representing a different cluster.

```bash
# Show Merged kubeconfig settings.
kubectl config view

# display the first user
kubectl config view -o jsonpath='{.users[].name}'

 # get a list of users
kubectl config view -o jsonpath='{.users[*].name}'

# display list of contexts
kubectl config get-contexts

# display the current-context
kubectl config current-context

# set the default context to my-cluster-name
kubectl config use-context my-cluster-name

# set a cluster entry in the kubeconfig
kubectl config set-cluster my-cluster-name

# delete a cluster entry in the kubeconfig
kubectl config delete-context my-cluster-name
```


## Listing Resources

Use the `kubectl get` command followed by the resource type you want to list.

```bash
# List all pods in the default namespace:
kubectl get pods

# List all pods in a specific namespace:
kubectl get pods -n sample

# List all pods in all namespaces:
kubectl get pods --all-namespaces
# or
kubectl get pods -A

# List all services in the default namespace:
kubectl get services

# List all nodes in the cluster:
kubectl get nodes

# List all deployments in a namespace:
kubectl get deployments -n sample

# List all replica sets:
kubectl get replicasets

# List all persistent volumes:
kubectl get pv

# List all persistent volume claims in a namespace:
kubectl get pvc -n sample

# List all config maps in a namespace:
kubectl get configmaps -n sample

# List all secrets in a namespace:
kubectl get secrets -n sample

# List all namespaces:
kubectl get namespaces

# List all events in a namespaces:
kubectl get events -n sample

# List all ingress in a namespaces:
kubectl get ingress -n sample
```

## Creating a Resource

Create a resource such as a service, deployment, job, or namespace using the `kubectl create` command.

```bash
# Create a new namespace
kubectl create namespace sample

# Create a Deployment
kubectl create deployment nginx-deployment  --image=nginx -n sample

# Create a Service
kubectl create service clusterip my-service --tcp=80:8080

# Create a Secret from literal values:
kubectl create secret generic my-secret --from-literal=username=admin --from-literal=password=pass123

# Create a PersistentVolume
kubectl create persistentvolume my-pv --capacity=1Gi --host-path=/data

# Create a PersistentVolumeClaim
kubectl create persistentvolumeclaim my-pvc --namespace=my-namespace --storageClassName=standard --request=1Gi

# Create a resource from a YAML file
kubectl create -f my-filename.yaml
# or
kubectl apply -f my-filename.yaml
```

## Applying and Updating a Resource

```bash
# Create a resource from a YAML file
kubectl apply -f my-filename.yaml

# Create from multiple files
kubectl apply -f ./file1.yaml -f ./file1.yaml 

# create resource(s) in all manifest files in folder
kubectl apply -f ./folder1
```

## Creating vs Apply

`kubectl create` is used for creating new resources, while `kubectl apply` is used for creating and updating resources. `kubectl apply` provides a more flexible and incremental approach to managing resource configurations.

## Viewing and Finding Resources

```bash
# List all pods in the current namespace, with more details
kubectl get pods -o wide
# Get a pod's YAML
kubectl get pod my-pod -o yaml

# List Services Sorted by Name
kubectl get services -n my-namespace --sort-by=.metadata.name

# List pods Sorted by Restart Count
kubectl get pods -n my-namespace --sort-by='.status.containerStatuses[0].restartCount'

# List PersistentVolumes sorted by capacity
kubectl get pv -n my-namespace --sort-by=.spec.capacity.storage

# Get all worker nodes (use a selector to exclude results that have a label
# named 'node-role.kubernetes.io/control-plane')
kubectl get node --selector='!node-role.kubernetes.io/control-plane'

# List Events sorted by timestamp
kubectl get events -n my-namespace --sort-by=.metadata.creationTimestamp

# List all warning events
kubectl events -n my-namespace --types=Warning
```

## Updating Resources

```bash
# Rolling update "www" containers of "frontend" deployment, updating the image
kubectl set image deployment/frontend www=image:v2               
# Check the history of deployments including the revision
kubectl rollout history deployment/frontend                      
# Rollback to the previous deployment
kubectl rollout undo deployment/frontend                         
# Rollback to a specific revision
kubectl rollout undo deployment/frontend --to-revision=2         
# Watch rolling update status of "frontend" deployment until completion
kubectl rollout status -w deployment/frontend                    
# Rolling restart of the "frontend" deployment
kubectl rollout restart deployment/frontend                      
```

## Patching Resources

```bash
# Update a container's image; spec.containers[*].name is required because it's a merge key
kubectl patch pod my-pod -n my-namespace -p '{"spec":{"containers":[{"name":"kubernetes-serve-hostname","image":"new image"}]}}'

# Update a container's image using a json patch with positional arrays
kubectl patch pod my-pod -n my-namespace --type='json' -p='[{"op": "replace", "path": "/spec/containers/0/image", "value":"new image"}]'

# Disable a deployment livenessProbe using a json patch with positional arrays
kubectl patch deployment my-deployment -n my-namespace --type json   -p='[{"op": "remove", "path": "/spec/template/spec/containers/0/livenessProbe"}]'

```

## Editing Resources

```bash
# Edit the service named my-service
kubectl edit svc/my-service -n my-namespace
```

## Scaling Resources

```bash
# Scale a replicaset named 'my-rs' to 3
kubectl scale --replicas=2 rs/my-rs -n my-namespace

# Scale a resource specified in "my-file.yaml" to 3
kubectl scale --replicas=3 -f my-file.yaml    

# If the deployment named my-deployment's size is 2, scale my-deployment to 3
kubectl scale --current-replicas=1 --replicas=3 deployment/nginx-deployment -n sample
kubectl scale --current-replicas=3 --replicas=1 deployment/nginx-deployment -n sample
kubectl get deployments -n sample # use this for verify

# Scale multiple replication controllers
kubectl scale --replicas=5 rc/my-rc1 rc/my-rc1 rc/my-rc1                   
```

## Deleting Resources

```bash
# Delete pods and services with same names "aspnet-api" and "aspnet-api"
kubectl delete pod,service aspnet-api aspnet-api -n sample

# Delete a pod with no grace period
kubectl delete pod unwanted --now

# Delete pods and services with same names "baz" and "foo"
kubectl delete pod,service my-pod1, my-pod2

# Delete pods and services with label name=my-Label
kubectl delete pods,services -l name=my-Label 

# Delete all pods and services in namespace my-namespace,
kubectl -n my-namespace delete pod,svc --all                             
```


## kubectl logs

```bash
kubectl logs pod/my-pod -n my-namespace
kubectl logs svc/my-svc -n my-namespace

kubectl logs pods/sample-server-f486b9bd7-wtw9f -n sample

# Fetches the logs generated by the pod in the last 2 minutes
kubectl logs --since=2m pods/sample-server-f486b9bd7-wtw9f -n sample
```

PowerShell examples:

```powershell
# Logs from all the pods
kubectl get pods -n sample --no-headers=true | ForEach-Object { kubectl logs $_.Split()[0] -n sample }

## logs from all the pods since 5 hours
kubectl get pods -n sample --no-headers=true | ForEach-Object { kubectl logs --since=5h $_.Split()[0] -n sample }

# show log output if any word "exception" in it
kubectl get pods -n sample --no-headers=true | ForEach-Object { kubectl logs --since=5m $_.Split()[0] -n sample } | Select-String "exception"
```

## Port-Forward

```bash
kubectl port-forward my-pod 5000:6000 
kubectl port-forward service/aspnet-api 80:80 -n sample
kubectl port-forward svc/pgadmin4 -n pgadmin4 80:80

# listen on local port 5000 and forward to port 5000 on Service backend
kubectl port-forward svc/my-service 5000                  

# listen on local port 5000 and forward to Service target port with name <my-service-port>
kubectl port-forward svc/my-service 5000:my-service-port  
```

## Interacting with Running Pods

```bash

kubectl exec -n my-namespace -it my-pod -- bash
kubectl exec -n my-namespace -it my-pod -- ls /

# list files
# root@my-pod:/app# ls
# root@my-pod:/app# exit

# print environment variables
kubectl exec -n my-namespace my-pod -- printenv

# describe pod
kubectl describe pod/nginx-deployment-9456bbbf9-ngv7f -n sample
```

## Show Metrics

```bash
# Show node metrics:
kubectl top nodes

# Show pod metrics:
kubectl top pods

# --sort-by flag with memory 
kubectl top nodes --sort-by=memory 
kubectl top pods --sort-by=memory -n sample
```



## Formatting Output

You can format the output of commands to customize the information displayed.

```bash
kubectl get pods -n sample -o=custom-columns=NAME:.metadata.name,STATUS:.status.phase,NODE:.spec.nodeName

# all pods
kubectl get pods -n sample -o=yaml
kubectl get pods -n sample -o=json
kubectl get pods -n sample -o=name

# single pod
kubectl get pod/aspnet-api-6699db6d4b-66d7m -n sample -o=yaml

kubectl describe pod/aspnet-api-6699db6d4b-66d7m -o go-template='{{range .status.containerStatuses}}{{.name}}:{{.restartCount}}{{"\n"}}{{end}}'

# Show labels of all pods
kubectl get pods --show-labels

kubectl get pods -n sample -o wide

# All images running in a cluster
kubectl get pods -A -o=custom-columns='IMAGE:spec.containers[*].image'

# All images running in a namespace
kubectl get pods -n sample -o=custom-columns='IMAGE:spec.containers[*].image'

# All container name running in a namespace
kubectl get pods -n sample -o=custom-columns='NAME:spec.containers[*].name'

# All images running in namespace: sample, grouped by Pod
kubectl get pods -n sample --output=custom-columns="NAME:.metadata.name,IMAGE:.spec.containers[*].image"

# This will get all container with the namespace in a pretty format:
kubectl get pods --all-namespaces -o=custom-columns=NameSpace:.metadata.namespace,NAME:.metadata.name,CONTAINERS:.spec.containers[*].name

# Using grep (Linux/macOS)
# kubectl describe pod aspnet-api-6699db6d4b-66d7m -n sample | grep "Container ID"

# Using PowerShell (Windows)
kubectl describe pod aspnet-api-6699db6d4b-66d7m -n sample | Select-String "Container ID"

# All pods in a namespace
kubectl describe pods -n sample  | Select-String "name|Container ID"

# display NAME and CONTAINERID
kubectl get pods -n sample -o=custom-columns='NAME:.metadata.name,CONTAINERID:.status.containerStatuses[*].containerID'

kubectl logs aspnet-api-6699db6d4b-66d7m -n sample
kubectl logs azure-vote-back-6dbbb4bccc-dnwmg -n sample

```


## Command Invoke

Use command invoke to access a private Azure Kubernetes Service (AKS) cluster. Reference: [AKS Command Invoke](https://learn.microsoft.com/en-us/azure/aks/command-invoke)

```bash
  az aks command invoke --resource-group 'rg-rgname-dev' --name 'aks-aksname-dev' --command "kubectl get namespaces"
  az aks command invoke --resource-group 'rg-rgname-dev' --name 'aks-aksname-dev' --command "kubectl create namespace test"
``` 

## kubectl api-resources

The `kubectl api-resources` command allows you to view the available resource types in your Kubernetes cluster. It provides a list of the supported resource types along with their **short names**, API group, and whether they are namespaced or not.

```bash
# All namespaced resources
kubectl api-resources --namespaced=true
kubectl api-resources -o name
kubectl api-resources -o wide
kubectl api-resources --verbs=list,get
kubectl api-resources | more
# Use Ctrl + C to exit
```

Output:

```bash
NAME                               SHORTNAMES               APIVERSION                             NAMESPACED   KIND
bindings                                                    v1                                     true         Binding
componentstatuses                  cs                       v1                                     false        ComponentStatus
configmaps                         cm                       v1                                     true         ConfigMap
endpoints                          ep                       v1                                     true         Endpoints
events                             ev                       v1                                     true         Event
limitranges                        limits                   v1                                     true         LimitRange
namespaces                         ns                       v1                                     false        Namespace
nodes                              no                       v1                                     false        Node
persistentvolumeclaims             pvc                      v1                                     true         PersistentVolumeClaim
persistentvolumes                  pv                       v1                                     false        PersistentVolume
pods                               po                       v1                                     true         Pod
podtemplates                                                v1                                     true         PodTemplate
replicationcontrollers             rc                       v1                                     true         ReplicationController
resourcequotas                     quota                    v1                                     true         ResourceQuota
secrets                                                     v1                                     true         Secret
serviceaccounts                    sa                       v1                                     true         ServiceAccount
services                           svc                      v1                                     true         Service
azureassignedidentities                                     aadpodidentity.k8s.io/v1               true         AzureAssignedIdentity
azureidentities                                             aadpodidentity.k8s.io/v1               true         AzureIdentity
azureidentitybindings                                       aadpodidentity.k8s.io/v1               true         AzureIdentityBinding
azurepodidentityexceptions                                  aadpodidentity.k8s.io/v1               true         AzurePodIdentityException
challenges                                                  acme.cert-manager.io/v1                true         Challenge
orders                                                      acme.cert-manager.io/v1                true         Order
mutatingwebhookconfigurations                               admissionregistration.k8s.io/v1        false        MutatingWebhookConfiguration
validatingwebhookconfigurations                             admissionregistration.k8s.io/v1        false        ValidatingWebhookConfiguration
customresourcedefinitions          crd,crds                 apiextensions.k8s.io/v1                false        CustomResourceDefinition
apiservices                                                 apiregistration.k8s.io/v1              false        APIService
controllerrevisions                                         apps/v1                                true         ControllerRevision
daemonsets                         ds                       apps/v1                                true         DaemonSet
deployments                        deploy                   apps/v1                                true         Deployment
replicasets                        rs                       apps/v1                                true         ReplicaSet
statefulsets                       sts                      apps/v1                                true         StatefulSet
tokenreviews                                                authentication.k8s.io/v1               false        TokenReview
localsubjectaccessreviews                                   authorization.k8s.io/v1                true         LocalSubjectAccessReview
selfsubjectaccessreviews                                    authorization.k8s.io/v1                false        SelfSubjectAccessReview
selfsubjectrulesreviews                                     authorization.k8s.io/v1                false        SelfSubjectRulesReview
subjectaccessreviews                                        authorization.k8s.io/v1                false        SubjectAccessReview
horizontalpodautoscalers           hpa                      autoscaling/v2                         true         HorizontalPodAutoscaler
cronjobs                           cj                       batch/v1                               true         CronJob
jobs                                                        batch/v1                               true         Job
certificaterequests                cr,crs                   cert-manager.io/v1                     true         CertificateRequest
certificates                       cert,certs               cert-manager.io/v1                     true         Certificate
clusterissuers                                              cert-manager.io/v1                     false        ClusterIssuer
issuers                                                     cert-manager.io/v1                     true         Issuer
certificatesigningrequests         csr                      certificates.k8s.io/v1                 false        CertificateSigningRequest
configs                            config                   config.gatekeeper.sh/v1alpha1          true         Config
k8sazurev1blockdefault                                      constraints.gatekeeper.sh/v1beta1      false        K8sAzureV1BlockDefault
k8sazurev1ingresshttpsonly                                  constraints.gatekeeper.sh/v1beta1      false        K8sAzureV1IngressHttpsOnly
k8sazurev1serviceallowedports                               constraints.gatekeeper.sh/v1beta1      false        K8sAzureV1ServiceAllowedPorts
k8sazurev2blockautomounttoken                               constraints.gatekeeper.sh/v1beta1      false        K8sAzureV2BlockAutomountToken
k8sazurev2blockhostnamespace                                constraints.gatekeeper.sh/v1beta1      false        K8sAzureV2BlockHostNamespace
k8sazurev2containerallowedimages                            constraints.gatekeeper.sh/v1beta1      false        K8sAzureV2ContainerAllowedImages
k8sazurev2noprivilege                                       constraints.gatekeeper.sh/v1beta1      false        K8sAzureV2NoPrivilege
k8sazurev3allowedcapabilities                               constraints.gatekeeper.sh/v1beta1      false        K8sAzureV3AllowedCapabilities
k8sazurev3allowedusersgroups                                constraints.gatekeeper.sh/v1beta1      false        K8sAzureV3AllowedUsersGroups
k8sazurev3containerlimits                                   constraints.gatekeeper.sh/v1beta1      false        K8sAzureV3ContainerLimits
k8sazurev3disallowedcapabilities                            constraints.gatekeeper.sh/v1beta1      false        K8sAzureV3DisallowedCapabilities
k8sazurev3enforceapparmor                                   constraints.gatekeeper.sh/v1beta1      false        K8sAzureV3EnforceAppArmor
k8sazurev3hostfilesystem                                    constraints.gatekeeper.sh/v1beta1      false        K8sAzureV3HostFilesystem
k8sazurev3hostnetworkingports                               constraints.gatekeeper.sh/v1beta1      false        K8sAzureV3HostNetworkingPorts
k8sazurev3noprivilegeescalation                             constraints.gatekeeper.sh/v1beta1      false        K8sAzureV3NoPrivilegeEscalation
k8sazurev3readonlyrootfilesystem                            constraints.gatekeeper.sh/v1beta1      false        K8sAzureV3ReadOnlyRootFilesystem
leases                                                      coordination.k8s.io/v1                 true         Lease
endpointslices                                              discovery.k8s.io/v1                    true         EndpointSlice
events                             ev                       events.k8s.io/v1                       true         Event
flowschemas                                                 flowcontrol.apiserver.k8s.io/v1beta2   false        FlowSchema
prioritylevelconfigurations                                 flowcontrol.apiserver.k8s.io/v1beta2   false        PriorityLevelConfiguration
clustertriggerauthentications      cta,clustertriggerauth   keda.sh/v1alpha1                       false        ClusterTriggerAuthentication
scaledjobs                         sj                       keda.sh/v1alpha1                       true         ScaledJob
scaledobjects                      so                       keda.sh/v1alpha1                       true         ScaledObject
triggerauthentications             ta,triggerauth           keda.sh/v1alpha1                       true         TriggerAuthentication
nodes                                                       metrics.k8s.io/v1beta1                 false        NodeMetrics
pods                                                        metrics.k8s.io/v1beta1                 true         PodMetrics
ingressclasses                                              networking.k8s.io/v1                   false        IngressClass
ingresses                          ing                      networking.k8s.io/v1                   true         Ingress
networkpolicies                    netpol                   networking.k8s.io/v1                   true         NetworkPolicy
runtimeclasses                                              node.k8s.io/v1                         false        RuntimeClass
poddisruptionbudgets               pdb                      policy/v1                              true         PodDisruptionBudget
clusterrolebindings                                         rbac.authorization.k8s.io/v1           false        ClusterRoleBinding
clusterroles                                                rbac.authorization.k8s.io/v1           false        ClusterRole
rolebindings                                                rbac.authorization.k8s.io/v1           true         RoleBinding
roles                                                       rbac.authorization.k8s.io/v1           true         Role
priorityclasses                    pc                       scheduling.k8s.io/v1                   false        PriorityClass
secretproviderclasses                                       secrets-store.csi.x-k8s.io/v1          true         SecretProviderClass
secretproviderclasspodstatuses                              secrets-store.csi.x-k8s.io/v1          true         SecretProviderClassPodStatus
volumesnapshotclasses              vsclass,vsclasses        snapshot.storage.k8s.io/v1             false        VolumeSnapshotClass
volumesnapshotcontents             vsc,vscs                 snapshot.storage.k8s.io/v1             false        VolumeSnapshotContent
volumesnapshots                    vs                       snapshot.storage.k8s.io/v1             true         VolumeSnapshot
constraintpodstatuses                                       status.gatekeeper.sh/v1beta1           true         ConstraintPodStatus
constrainttemplatepodstatuses                               status.gatekeeper.sh/v1beta1           true         ConstraintTemplatePodStatus
csidrivers                                                  storage.k8s.io/v1                      false        CSIDriver
csinodes                                                    storage.k8s.io/v1                      false        CSINode
csistoragecapacities                                        storage.k8s.io/v1                      true         CSIStorageCapacity
storageclasses                     sc                       storage.k8s.io/v1                      false        StorageClass
volumeattachments                                           storage.k8s.io/v1                      false        VolumeAttachment
constrainttemplates                constraints              templates.gatekeeper.sh/v1             false        ConstraintTemplate
```


## Help Summary

```bash
Basic Commands (Beginner):
  create          Create a resource from a file or from stdin
  expose          Take a replication controller, service, deployment or pod and expose it as a new Kubernetes service
  run             Run a particular image on the cluster
  set             Set specific features on objects

Basic Commands (Intermediate):
  explain         Get documentation for a resource
  get             Display one or many resources
  edit            Edit a resource on the server
  delete          Delete resources by file names, stdin, resources and names, or by resources and label selector

Deploy Commands:
  rollout         Manage the rollout of a resource
  scale           Set a new size for a deployment, replica set, or replication controller
  autoscale       Auto-scale a deployment, replica set, stateful set, or replication controller

Cluster Management Commands:
  certificate     Modify certificate resources.
  cluster-info    Display cluster information
  top             Display resource (CPU/memory) usage
  cordon          Mark node as unschedulable
  uncordon        Mark node as schedulable
  drain           Drain node in preparation for maintenance
  taint           Update the taints on one or more nodes

Troubleshooting and Debugging Commands:
  describe        Show details of a specific resource or group of resources
  logs            Print the logs for a container in a pod
  attach          Attach to a running container
  exec            Execute a command in a container
  port-forward    Forward one or more local ports to a pod
  proxy           Run a proxy to the Kubernetes API server
  cp              Copy files and directories to and from containers
  auth            Inspect authorization
  debug           Create debugging sessions for troubleshooting workloads and nodes
  events          List events

Advanced Commands:
  diff            Diff the live version against a would-be applied version
  apply           Apply a configuration to a resource by file name or stdin
  patch           Update fields of a resource
  replace         Replace a resource by file name or stdin
  wait            Experimental: Wait for a specific condition on one or many resources
  kustomize       Build a kustomization target from a directory or URL.

Settings Commands:
  label           Update the labels on a resource
  annotate        Update the annotations on a resource
  completion      Output shell completion code for the specified shell (bash, zsh, fish, or powershell)

Other Commands:
  alpha           Commands for features in alpha
  api-resources   Print the supported API resources on the server
  api-versions    Print the supported API versions on the server, in the form of "group/version"
  config          Modify kubeconfig files
  plugin          Provides utilities for interacting with plugins
  version         Print the client and server version information

```

## References

- [Official Kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
- [Kubectl Commands Reference](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands)