# **Delete PV(Persistent Volume) and PVC(Persistent Volume Claim) stuck in terminating state**

If you are experiencing issues with deleting `Persistent Volume` or `Persistent Volume Claim` in Kubernetes (AKS). When we execute the `kubectl delete pv` or `kubectl delete pvc` command, it becomes unresponsive and gets stuck in the terminating state. Even if we try to abort the operation, it remains stuck in this state indefinitely.

 In this article, we will explore the symptoms, root cause, and the proper resolution to overcome this challenge.

## **Symptom**


Symptom is - A Kubernetes Persistent Volume or Persistent Volume Claim is stuck in the Terminating state because of not following the order during the deletion.

The deletion of PV(Persistent Volume) and PVC(Persistent Volume claim) needs to follow in specific order else you will get stuck in terminatiion state. When you are planning to delete the Persistent Volume as well as Persistent Volume Claim then you must follow an order -

- First delete - Persistent Volume Claim
- Second delete- Persistent Volume

!!! Note
    You should never delete PV(Persistent Volume) without deleting its PVC(Persistent Volume Claim))

## **Root Cause**

`Finalizer Issue`

Each Kubernetes resource running in the cluster has Finalizers associated with it. Finalizers prevent accidental deletion of resources(Persistent Volume, Persistent Volume Claim), If you accidentally issue kubectl delete command on Kubernetes resource and if there is a finalizer associated with that resource then it is going to put the resource in `Read-Only` mode and prevent it from deletion.

## **Resolving the Problem**


If you find your Kubernetes resources, such as Persistent Volumes (PVs) or Persistent Volume Claims (PVCs), stuck in the terminating state, resolving the issue involves removing the associated `Finalizer`. Follow these steps to successfully resolve the problem:

## **Step-1: Retrieve information about resources**

Use the following commands to retrieve information about your PVs and PVCs:

```bash
# Get Persistent Volume Claims in a specific namespace
kubectl get pvc -n namespace1

# Get Persistent Volumes in a specific namespace
kubectl get pv -n namespace1
```

## **Step-2: Remove the Finalizer**

Execute the following commands to remove the Finalizer from both the Persistent Volume and Persistent Volume Claim:

```bash
# Patch the Persistent Volume to remove the Finalizer
kubectl patch pv sample-app-pv -p '{"metadata":{"finalizers":null}}' -n namespace1

# Patch the Persistent Volume Claim to remove the Finalizer
kubectl patch pvc sample-app-pvc -p '{"metadata":{"finalizers":null}}' -n namespace1
```

## **Step-3: Delete Resources**

Now that the Finalizer has been removed, proceed to delete the resources in the correct order:

Delete Persistent Volume Claim

```bash
# Delete Persistent Volume Claim
kubectl delete pvc sample-app-pvc -n namespace1
```

Delete Persistent Volume

After the successful deletion of the Persistent Volume Claim, proceed to delete the Persistent Volume:

```bash
# Delete Persistent Volume
kubectl delete pv sample-app-pv -n namespace1
```

**or**

Force Delete (if needed)

If the regular deletion commands do not work, you can use the force delete option:

```bash
# Force delete Persistent Volume Claim
kubectl delete pvc --grace-period=0 --force --namespace namespace1 sample-app-pvc

# Force delete Persistent Volume
kubectl delete pv --grace-period=0 --force --namespace namespace1 sample-app-pv
```

## **Conclusion**

By following these steps, you should be able to successfully resolve the issue of Kubernetes resources stuck in the terminating state and delete both Persistent Volumes and Persistent Volume Claims.

<!-- 
- https://jhooq.com/k8s-delete-pv-pvc/ 
-->