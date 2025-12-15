# Cloud Comparison Cheat Sheet

## Introduction

This is a comprehensive comparison cheat sheet of cloud services across the three major cloud providers: Microsoft Azure, Amazon Web Services (AWS), and Google Cloud Platform (GCP).

This guide helps you understand equivalent services across different cloud platforms, making it easier to navigate multi-cloud environments, migrate between providers, or choose the right platform for your needs. Keep in mind that the availability of certain services may vary depending on the region and specific requirements. Also, these cloud platforms are constantly evolving, so new services may be introduced over time.

## Cloud Services Comparison

| Category                    | Azure Service              | AWS Service                    | GCP Service                   |
|-----------------------------|----------------------------|--------------------------------|-------------------------------|
| Compute                     | Azure Virtual Machines     | Amazon EC2 (Elastic Compute Cloud)  | Google Compute Engine        |
|                             | Azure App Service          | AWS Elastic Beanstalk          | Google App Engine            |
|                             | Azure Functions            | AWS Lambda                     | Google Cloud Functions       |
|                             | Azure Kubernetes Service (AKS)   | Amazon EKS (Elastic Kubernetes Service)                     | Google Kubernetes Engine (GKE)|
| Storage                     | Azure Blob Storage         | Amazon S3 (Simple Storage Service)  | Google Cloud Storage (GCS)   |
|                             | Azure Files                | Amazon EFS (Elastic File System)                    | Google Cloud Filestore       |
|                             | Azure Disk Storage         | Amazon EBS (Elastic Block Store)                    | Google Compute Engine Persistent Disks |
|                             | Azure Data Lake Storage    | Amazon S3 (with appropriate configurations) | Google Cloud Storage (GCS)   |
|                             | Azure Queue Storage        | Amazon SQS (Simple Queue Service)                    | Google Cloud Pub/Sub         |
| Database                    | Azure SQL Database         | Amazon RDS (Relational Database Service)                     | Cloud SQL                     |
|                             | Azure Cosmos DB            | Amazon DynamoDB                | Cloud Firestore / Cloud Bigtable|
|                             | Azure Database for MySQL   | Amazon RDS (MySQL)             | Cloud SQL for MySQL          |
|                             | Azure Database for PostgreSQL | Amazon RDS (PostgreSQL)       | Cloud SQL for PostgreSQL     |
|                             | Azure Cache for Redis      | Amazon ElastiCache             | Cloud Memorystore             |
|                             | Azure Synapse Analytics    | Amazon Redshift                | BigQuery                     |
| Identity and Access Management | Azure Active Directory (Microsoft Entra ID)  | AWS Directory Service          | Cloud Identity / Cloud IAM   |
|                             | Azure Key Vault            | AWS Secrets Manager            | Cloud Key Management Service (KMS) |
|                             | Azure AD B2C               | Amazon Cognito                 | Identity Platform            |
| Networking                  | Azure Virtual Network      | Amazon VPC                     | Virtual Private Cloud (VPC)  |
|                             | Azure Load Balancer        | Elastic Load Balancing (ELB)   | Google Cloud Load Balancing  |
|                             | Azure Application Gateway  | AWS Application Load Balancer  | Google Cloud Load Balancing  |
|                             | Azure VPN Gateway          | AWS VPN                        | Cloud VPN                    |
|                             | Azure CDN                  | Amazon CloudFront              | Cloud CDN                    |
|                             | Azure ExpressRoute         | AWS Direct Connect             | Cloud Interconnect           |
| Analytics and Big Data      | Azure HDInsight            | Amazon EMR (Elastic MapReduce)                    | Cloud Dataproc                |
|                             | Azure Databricks           | Amazon EMR                     | Cloud Dataproc                |
|                             | Azure Stream Analytics     | Amazon Kinesis                 | Cloud Dataflow               |
|                             | Azure Data Factory         | AWS Glue                       | Cloud Data Fusion            |
|                             | Azure Analysis Services    | Amazon Redshift                | BigQuery                     |
|                             | Azure Data Lake Analytics  | Amazon Athena                  | BigQuery                     |
| Machine Learning            | Azure Machine Learning     | Amazon SageMaker               | AI Platform                  |
|                             | Azure Cognitive Services   | Amazon Rekognition / Amazon Polly / Amazon Comprehend | Cloud Vision API / Cloud Text-to-Speech API / Cloud Natural Language API |
| Development Tools           | Azure DevOps               | AWS CodePipeline / AWS CodeBuild / AWS CodeDeploy | Cloud Build / Cloud Deployment Manager |
|                             | Azure DevTest Labs         | AWS Device Farm                | Firebase Test Lab            |
|                             | Azure SDKs & CLI          | AWS SDKs & CLI                 | Cloud SDK & CLI              |
|                             | Azure Logic Apps           | AWS Step Functions             | Cloud Workflows / Cloud Functions |
|                             | Azure API Management       | Amazon API Gateway             | Apigee API Platform           |
|                             | Azure Functions            | AWS Lambda                     | Google Cloud Functions       |
|                             | Azure Repos                | AWS CodeCommit                 | Cloud Source Repositories    |
| Management and Monitoring   | Azure Monitor              | Amazon CloudWatch              | Stackdriver Monitoring / Operations |
|                             | Azure Security Center      | AWS Security Hub               | Cloud Security Command Center|
|                             | Azure Automation           | AWS Systems Manager            | Cloud Scheduler               |
|                             | Azure Resource Manager     | AWS CloudFormation             | Cloud Deployment Manager      |
|                             | Azure Policy               | AWS Organizations              | Organization Policy Service  |
|                             | Azure Advisor              | AWS Trusted Advisor            | Recommender                  |
|                             | Azure Service Health       | AWS Personal Health Dashboard | Cloud Status Dashboard        |
|                             | Azure Cost Management     | AWS Cost Explorer              | Cloud Billing                 |
|                             | Azure Backup               | AWS Backup                     | Cloud Storage Transfer Service |
| Security                    | Azure Security Center      | AWS Security Hub               | Cloud Security Command Center|
|                             | Azure Sentinel             | AWS Security Hub / AWS GuardDuty | Chronicle Security / Security Command Center |
|                             | Azure Key Vault            | AWS Secrets Manager            | Cloud Key Management Service (KMS) |
|                             | Azure Advanced Threat Protection | AWS GuardDuty              | Cloud Security Scanner        |

## Key Differences

**Azure** - Best for enterprises already invested in Microsoft ecosystem (Windows Server, Active Directory, Office 365). Strong hybrid cloud capabilities with Azure Arc.

**AWS** - Most mature and extensive service catalog. Largest market share and global infrastructure. Best for startups and organizations needing cutting-edge services.

**GCP** - Strong in data analytics, machine learning, and Kubernetes. Leverages Google's expertise in big data and AI. Competitive pricing and innovative services.

## References

- [Azure Services](https://azure.microsoft.com/en-us/products/)
- [AWS Services](https://aws.amazon.com/products/)
- [Google Cloud Services](https://cloud.google.com/products)
- [Microsoft Entra ID (formerly Azure AD)](https://www.microsoft.com/en-us/security/business/identity-access/microsoft-entra-id)