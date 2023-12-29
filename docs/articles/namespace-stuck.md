# **A Kubernetes Namespace Stuck in the Terminating State**

## **Symptom**

If you are experiencing issues with deleting namespaces in Kubernetes (AKS). When we execute the `kubectl delete ns` command, it becomes unresponsive and gets stuck in the terminating state. Even if we try to abort the operation, it remains stuck in this state indefinitely.

Symptom is - A Kubernetes namespace is stuck in the Terminating state.

## **Root Cause**

`Finalizer Issue`

 Finalizers are mechanisms that allow resources to perform cleanup actions before they're deleted. If a resource has a finalizer that fails to complete its task, it can block the deletion of the entire namespace.

## **Resolving the Problem**

To resolve this issue, you'll need to identify and manually delete  a Terminating Namespace from finalizers.

1. View the namespaces that are stuck in the Terminating state:

    ```shell
    kubectl get namespaces
    ```

2. Select a terminating namespace and view the contents of the namespace to find out the finalizer:

    ```shell
    kubectl get namespace <terminating-namespace> -o yaml
    ```

    Your YAML contents might resemble the following output:

    ```yaml
    apiVersion: v1
    kind: Namespace
    metadata:
      creationTimestamp: 2018-11-19T18:48:30Z
      deletionTimestamp: 2018-11-19T18:59:36Z
      name: <terminating-namespace>
      resourceVersion: "1385077"
      selfLink: /api/v1/namespaces/<terminating-namespace>
      uid: b50c9ea4-ec2b-11e8-a0be-fa163eeb47a5
    spec:
      finalizers:
      - kubernetes
    status:
      phase: Terminating
    ```

3. Create a temporary JSON file:

    ```shell
    kubectl get namespace <terminating-namespace> -o json >tmp.json
    ```

4. Edit your `tmp.json` file. Remove the `kubernetes` value from the `finalizers` field and save the file.

    Your `tmp.json` file might resemble the following output:

    ```json
    {
        "apiVersion": "v1",
        "kind": "Namespace",
        "metadata": {
            "creationTimestamp": "2018-11-19T18:48:30Z",
            "deletionTimestamp": "2018-11-19T18:59:36Z",
            "name": "<terminating-namespace>",
            "resourceVersion": "1385077",
            "selfLink": "/api/v1/namespaces/<terminating-namespace>",
            "uid": "b50c9ea4-ec2b-11e8-a0be-fa163eeb47a5"
        },
        "spec": {
            "finalizers": 
        },
        "status": {
            "phase": "Terminating"
        }
    }
    ```

5. To set a temporary proxy IP and port, run the following command. Be sure to keep your terminal window open until you delete the stuck namespace:

    ```shell
    kubectl proxy
    ```

    Your proxy IP and port might resemble the following output:

    ```shell
    Starting to serve on 127.0.0.1:8001
    ```

6. From a new terminal window, make an API call with your temporary proxy IP and port:

    ```shell
    curl -k -H "Content-Type: application/json" -X PUT --data-binary @tmp.json http://127.0.0.1:8001/api/v1/namespaces/<terminating-namespace>/finalize
    ```

    Your output might resemble the following content:

    ```json
    {
      "kind": "Namespace",
      "apiVersion": "v1",
      "metadata": {
        "name": "<terminating-namespace>",
        "selfLink": "/api/v1/namespaces/<terminating-namespace>/finalize",
        "uid": "b50c9ea4-ec2b-11e8-a0be-fa163eeb47a5",
        "resourceVersion": "1602981",
        "creationTimestamp": "2018-11-19T18:48:30Z",
        "deletionTimestamp": "2018-11-19T18:59:36Z"
      },
      "spec": {

      },
      "status": {
        "phase": "Terminating"
      }
    }
    ```

    Note: The finalizer parameter is removed.

7. Verify that the terminating namespace is removed:

    ```shell
    kubectl get namespaces
    ```

## **Conclusion**

By following these steps, you should be able to successfully resolve the issue of Kubernetes namespace stuck in the terminating state and delete namespace.

<!-- 
## Reference:
- <https://www.ibm.com/docs/en/cloud-private/3.2.0?topic=console-namespace-is-stuck-in-terminating-state>
- <https://linuxhelp4u.blogspot.com/2019/01/kubernetes-remove-namespace-stuck-in.html>  
-->
     
    