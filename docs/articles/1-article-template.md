# **Send Alerts When Website is Down**

## **Introduction**

Website downtime can be a critical issue for companies in industries such as Insurance, Healthcare, Finance, and Banking, especially for applications that are mission critical. It can lead to inconvenience for users and potentially result in significant financial losses. To proactively address this challenge, Azure Application Insights offers a powerful feature called availability tests. These tests enable you to monitor your website's availability and receive timely alerts if the site goes down.

In this article, I will guide you through the steps to set up email, SMS, or voice notifications for your team members using Azure Application Insights.

<!-- 
Introduction
Prerequisites
Technical Scenario
Objective
Implementation Details
Step 1: Deployment in Docker
Step 2: Deployment in Kubernetes using Helm
Step 3: Create a new agent pool in Azure DevOps
Step 4: Create a new Personal Access Token (PAT)
Step 5: Register the Self-Hosted Agent
Step 6: Verify the helm deployment
Step 7: Update Build pipeline with Private Agent
Step 8: Test the new Private Agent
Conclusion
Reference -->


## **Technical Scenario**

When you're operating Azure services within a private network that is not accessible via the public internet, and you need connectivity from an Azure DevOps pipeline located in a public network, the solution is to deploy a private build machine within the same virtual network as your private services. This private build machine acts as a bridge, facilitating seamless connections to resources within the private network from Azure DevOps pipelines.

For instance, if you've established a private AKS cluster to run your applications, you'll need a dedicated private self-hosted agent within the same virtual network to facilitate the deployment process. Similarly, consider a scenario where you've configured a PostgreSQL server with a private DNS zone, and your Azure DevOps pipeline resides in a public network. To establish a connection to this database, it is necessary to deploy your own private agent within the virtual network housing the PostgreSQL server. This solution enables secure and efficient communication with your private resources.

## **Objective**

In this exercise, our objective is to accomplish and learn the following tasks:

- **Step-1:** Installing Private Agent Helmchart in Kubernetes
- **Step-2:** Verify private agent resources in AKS
- **Step-3:** Create new agent pool in Azure DevOps
- **Step-4:** Create new Personal Access Token (PAT)
- **Step-5:** Register the Self-Hosted Agent
- **Step-6:** Update Build pipeline with Private Agent.
- **Step-7:** Test the new Private Agent

## **Prerequisites**

Before proceeding with this lab, make sure you have the following prerequisites in place:

1. An Azure account with an active subscription.
2. A web application hosted on Azure that is already configured to send telemetry data to Azure Application Insights.

## **Step 1: Access Azure Application Insights**

1. Log in to the Azure Portal (https://portal.azure.com/).

2. In the left navigation pane, click on "Resource groups" and select the resource group containing your web application and Application Insights instance.

3. Click on your Application Insights resource to open its overview.

## **Step 2: Create a New Alert Rule**

1. In the Application Insights overview page, select the "Alerts" section from the left menu.

2. Click the "+ New alert rule" button to create a new alert rule.

## **Step 3: Configure Alert Rule Details**

1. In the "Basics" tab of the alert rule creation wizard, provide a **Name** and **Description** for your alert rule.

2. Under **Resource**, select the web application associated with the Application Insights instance you're monitoring.

3. For the **Condition**, click on the "Add condition" button.

4. In the condition configuration:

   - Choose "Custom log search" as the signal type.
   - Configure the query to filter exceptions. For example, you can use the following query to detect exceptions:
     ```
     exceptions
     | where type == "Microsoft.ApplicationInsights.Web.Exceptions.HandledException"
     ```

5. Set the **Aggregation type** to "Count."

6. Define the **Threshold value** that will trigger the alert. For example, if you want to be alerted when there are more than 5 exceptions in a 5-minute window, set the threshold to 5.

7. Set the **Operator** to "Greater than."

8. Configure the **Severity** and **Alert logic** according to your requirements.

9. Click "Done" to save the condition.

## **Step 4: Configure Action Groups**

1. In the "Action groups" section, click the "Select action groups" dropdown, and then click on "+ New action group" to create a new action group.

2. Provide a **Name** and **Short name** for your action group.

3. Under **Actions**, click on "+ Add action," and select the type of action to be taken when the alert fires. You can choose from various options like sending an email, triggering a webhook, or running a Logic App.

4. Configure the action details according to your preferences.

5. Click "OK" to save the action group.

## **Step 5: Define Alert Details**

1. In the "Alert details" section, specify a **Name** for your alert instance.

2. Set the **Severity** based on the criticality of the alert.

3. Configure the **Action group** by selecting the action group you created earlier.

## **Step 6: Review and Create**

1. Review all the configurations to ensure they are accurate.

2. Click "Create alert rule" to create the alert rule.

## **Step 7: Testing and Validation**

It's essential to test your alert rule to ensure it triggers as expected. To do this, you can deliberately introduce exceptions into your web application and monitor the Azure Application Insights interface for alerts.

## **Conclusion**

Configuring monitoring alerts in Azure Application Insights for exceptions in web applications is a crucial step in ensuring the reliability and performance of your applications. By following the steps outlined in this article, Azure Cloud Engineers can proactively detect and respond to exceptions, minimizing downtime and enhancing the user experience.

Remember to regularly review and adjust your alert rules as your application evolves and usage patterns change, ensuring that your monitoring and alerting strategy remains effective in the long run.


## **References**

- [OAuth 2.0 Specification](https://tools.ietf.org/html/rfc6749){:target="_blank"}
- [OpenID Connect Specifications](https://openid.net/specs/openid-connect-core-1_0.html){:target="_blank"}
