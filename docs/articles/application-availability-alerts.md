# How to Configure Alerts in Azure Application Insights?


Proactive monitoring and alerting are critical for maintaining the reliability and performance of web applications hosted on Azure. Azure Application Insights provides monitoring and alerting capabilities, allowing you to gain insights into your application's behavior and health. 

In this article, I will provide step by step instructions for configuring monitoring alerts in Azure Application Insights specifically for exceptions that occur in any web application.

## Prerequisites

Before you begin, make sure you have the following prerequisites:

- An Azure account with an active subscription.
- A web application hosted on Azure 
- A Application Insights associated to the web application.
- A web application configured to send logs data to Azure Application Insights.


## Step 1: Create action groups

Action Group allows you to define a set of notification and automated actions that can be triggered by alerts from various Azure services.

Here are the steps to create an Action Group:

1. **Login** into azure portal, select Monitoring or "Application Insights" -> Alerts - > Action Group - This will take you to the Action Groups page.
2. Select Action groups > Create.
3. Select values for Subscription, Resource group, and Region.
4. Enter a name for Action group name and Display name.
4. In the "**Notifications**" tab, you can set up one or more notification methods for the action group. These can include email, SMS, voice, or other options. To configure a notification, do the following:
5. In the "**Actions**" tab, you can define automated actions that should be taken when the action group is triggered. These actions can include running a Logic App, invoking a webhook, or sending an email.
6.  Add **Tags** (Optional)
7. Review and Create
8. Confirmation

Azure will begin creating the action group. Once the creation process is complete, you will receive a confirmation message.

This action group can be associated with alert rules from various Azure services to trigger notifications and automated responses based on specific conditions.

## Step 2: Create a new alert rule

1. Application Insights > Alerts

2. Open the + Create menu, and select Alert rule.

## Step 3: Configure Alert Rule Details

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


## Step 5: Define Alert Details

1. In the "Alert details" section, specify a **Name** for your alert instance.

2. Set the **Severity** based on the criticality of the alert.

3. Configure the **Action group** by selecting the action group you created earlier.

## Step 6: Review and Create

1. Review all the configurations to ensure they are accurate.

2. Click "Create alert rule" to create the alert rule.

## Step 7: Testing and Validation

Test your alert rule ensure it triggers as expected. To do this, you can deliberately introduce exceptions into your web application and monitor the Azure Application Insights interface for alerts.

## Conclusion

Configuring monitoring alerts in Azure Application Insights for exceptions in web applications is a critical to ensure the reliability and performance of your applications. 

## References

- [Create or edit a metric alert rule](https://learn.microsoft.com/en-us/azure/azure-monitor/alerts/alerts-create-metric-alert-rule){:target="_blank"}
