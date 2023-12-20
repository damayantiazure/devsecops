## Lab Guides

### Conditions and Terms of Use

#### Microsoft Confidential

This training package is proprietary and confidential and is intended only for uses described in the training materials. Content and software are provided to you under a Non-Disclosure Agreement and cannot be distributed. Copying or disclosing all or any portion of the content and/or software included in such packages is strictly prohibited.

The contents of this package are for informational and training purposes only and are provided as is without warranty of any kind, whether express or implied, including but not limited to the implied warranties of merchantability, fitness for a particular purpose, and non-infringement.

Training package content, including URLs and other Internet Web site references, is subject to change without notice. Because Microsoft must respond to changing market conditions, the content should not be interpreted to be a commitment on the part of Microsoft, and Microsoft cannot guarantee the accuracy of any information presented after the date of publication. Unless otherwise noted, the companies, organizations, products, domain names, e-mail addresses, logos, people, places, and events depicted herein are fictitious, and no association with any real company, organization, product, domain name, e-mail address, logo, person, place, or event is intended or should be inferred.

Copyright and Trademarks
© 2022 Microsoft Corporation. All rights reserved.

Microsoft may have patents, patent applications, trademarks, copyrights, or other intellectual property rights covering the subject matter in this document. Except as expressly provided in the written license agreement from Microsoft, the furnishing of this document does not give you any license to these patents, trademarks, copyrights, or other intellectual property.

Complying with all applicable copyright laws is the responsibility of the user. Without limiting the rights under copyright, no part of this document may be reproduced, stored in or introduced into a retrieval system, or transmitted in any form or by any means (electronic, mechanical, photocopying, recording, or otherwise), or for any purpose, without the express written permission of Microsoft Corporation.

For more information, see Use of Microsoft Copyrighted Content at

<http://www.microsoft.com/en-us/legal/intellectualproperty/Permissions/default.aspx>


# Modules

[Module 1: Creating a DevOps Pipeline](#module-1-creating-a-devops-pipeline)  

[Module 2: Credentials Management in Pipeline Lab](#module-2-credentials-management-in-pipeline-lab)

[Module 3: Application Security Principles](#module-3-application-security-principles)

[Module 4: Automating a Secure and Compliant Pipeline](#module-4-automating-a-secure-and-compliant-pipeline)

[Module 5: Threat Modeling](#module-5-threat-modeling)

[Module 6: Implementing manual verification using Azure DevOps](#module-6-implementing-manual-verification-using-azure-devops)

===

# Module 1: Creating a DevOps Pipeline

## Lab 1: Configure your Azure DevOps Pipelines

### Introduction

In this lab, we will work with a Docker-based ASP.NET Core web application - OWASP Juice Shop. 
The application will be deployed to an Azure Web App for Containers service using Azure DevOps.

### Objectives

Upon completing this lab, you will gain the ability to:

- Set up an Azure DevOps Pipeline
- Configure Infrastructure as Code (IaC)
- Initiate a build and deployment for an application
- Enhance the security of your application and infrastructure using tools and automation

### Configure your Build Pipeline

#### Objectives

After completing this exercise, you will be able to:

- Configure an Azure DevOps pipeline

#### Scenario

We aim to automate all deployments, including the infrastructure.

### Exercise 1: Configure service connections and deploy the production infrastructure. 

1. [] Log in to the VM by using the password provided: +++@lab.VirtualMachine(SecureDevOps-VM).Password+++

2. [] Open the Edge browser and navigate to +++https://aka.ms/azurepass/+++ click *Start* and use the following credentials 

    Email: +++@lab.CloudCredential(SSGM3653sharpStakeholderJudDoran).AdministrativeUsername+++

    Password: +++@lab.CloudCredential(SSGM3653sharpStakeholderJudDoran).AdministrativePassword+++

    Once you've logged in, click on "Confirm Microsoft Account."

3. [] Enter the promo code: +++@lab.CloudCredential(SSGAzurePromoCode-100Dollar-30Days).PromoCode+++

    Type the *characters you see* * to solve the challenge then click on Submit

4. [] Enter the following informations on he next page:

    Last Name: +++LabUser+++

    Address line 1: +++1 Microsoft Way+++

    City: +++Redmond+++

    State: **Washington**

    Zip Code: +++98052+++

    Mark the checkbox **I agree to the subscription...** then click on *Sign up*

    >**Note:** Hold on until the sign up process finishes, which should take about 3 minutes.

5. [] Open a new tab in the Edge browser and go to +++https://dev.azure.com/+++ Then click on the **"Start Free"** button.

    ![Modify Organization Settings](CreateDevOpsAcc00.png )

6. [] Select **United States** then click **Continue**.
    
    ![Modify Organization Settings](CreateDevOpsAcc01.png)

    >**Note:** remove *&acquisition=...* from navigation url if needed

7. [] Type +++Student1-@lab.LabInstance.Id+++ for **Name your Azure DevOps organization** field

    Choose the **Central US** region for the **We'll host your projects** option 
    
    Input the required characters as prompted.

    Click on **Continue**

8. [] Create a project with the name: +++DevSecOps+++.

    !IMAGE[CreateDevOpsAcc12.png](CreateDevOpsAcc12.png)

    Click **Create project**

9. [] Navigate to **Repos** choose the **Import repository** option
    
    !IMAGE[CreateDevOpsAcc12b.png](CreateDevOpsAcc12b.png)

10. [] Type +++https://github.com/juice-shop/juice-shop.git+++ for **Clone URL * **

    !IMAGE[CreateDevOpsAcc12c.png](CreateDevOpsAcc12c.png)

    Click **Import**

11. [] Click on **User Settings** then **Personal access Token**

    !IMAGE[Module1-PAT-01.png](instructions173831/Module1-PAT-01.png)

    !IMAGE[Module1-PAT-02.png](instructions173831/Module1-PAT-02.png)

    Type +++DevSecOps-Automation+++ on the Name field, select **Full access** option

    !IMAGE[Module1-PAT-03.png](instructions173831/Module1-PAT-03.png)

    Click **Create**

12. [] Copy the Personal Access Token generated

    > **Here**: @lab.TextBox(PAT)  

    !IMAGE[Module1-PAT-04.png](instructions173831/Module1-PAT-04.png)

13. [] Back to Poral Azure, click on **Cloud Shell** then select **Powershell**

    !IMAGE[Module1-AzureCloudShell.png](instructions173831/Module1-AzureCloudShell.png)

    Then, click on **Create storage**

14. [] Click on the "Upload" button, then navigate to and open the following file:  +++C:\Labfiles\Module1\register-Azureproviders.ps1+++

    !IMAGE[Module1-AzureCloudShell-02.png](instructions173831/Module1-AzureCloudShell-02.png)
    
    Next, execute the following command:

    +++./register-Azureproviders.ps1 -LabInstance "@lab.LabInstance.Id" -accountName "Student1-@lab.LabInstance.Id" -adminUsername "@lab.VirtualMachine(SecureDevOps-VM).Username" -adminPassword '@lab.CloudCredential(SSGM3653sharpStakeholderJudDoran).AdministrativePassword' -personalAccessToken "@lab.Variable(PAT)"+++ 

    !IMAGE[Module1-AzureCloudShell-03.png](instructions173831/Module1-AzureCloudShell-03.png)

    > **Note: ** This command will create tree resource groups and register the necessary Azure resource providers. (Keep it running and proceed to the next step.)
    >
    > Make sure you have the Personal access token as part of the command


15. [] Navigate to +++https://dev.azure.com/Student1-@lab.LabInstance.Id+++ and click on **Organization settings**

    !IMAGE[Module6-DefenderForCloud1.png](instructions173831/Module6-DefenderForCloud1.png)

    Click on **Biling** then **Set up billing**

    !IMAGE[Module1-Billing-01.png](instructions173831/Module1-Billing-01.png)

    Click on **Save**

    Set the **MS Hosted CI/CD** text box to 5 then clique **Save** on the bottom

    !IMAGE[Module1-Billing-02.png](instructions173831/Module1-Billing-02.png)

16. [] Click on **Policies** then enable *Third-party application access via OAuth*

    !IMAGE[Module6-DefenderForCloud2.png](Module6-DefenderForCloud2.png)

17. [] Click on **RepositoRepositories ** then click on **Enable All** and **Automatically enable Advanced Security for new projects**

    !IMAGE[Module1-EnableGHAS.png](instructions173831/Module1-EnableGHAS.png)

    Click on **Begin billing**

18. [] Navigate to DevSecOps Project then click on **Project settings** then **Service Connection**

    +++https://dev.azure.com/Student1-@lab.LabInstance.Id/DevSecOps/_settings/+++

    ![Edit Release Pipeline](CreateServiceConnection-01.png )

    Click on **Create Service Connection**

19. [] Select +++Azure Resource Manager+++

    ![Edit Release Pipeline](CreateServiceConnection-04.png )
    
    click on **Next**

    Select **Service principal (automatic)**

    !IMAGE[CreateServiceConnection-02.png](instructions173831/CreateServiceConnection-02.png)

    Click on **Next**

20. [] Select the subscription **Azure Pass ...** and the Resource Group **rg-juiceshop-dev-lod**

    Type +++Azure-Service-Connection-Development+++ on the field **Service connection name** 

    Check the box **Grant access permission to all pipelines**

    !IMAGE[CreateServiceConnection-03.png](CreateServiceConnection-03.png)

    Click **Save**

21. [] Open the service connection and click on **Manage Service Principal**

    !IMAGE[Module1-ServiceConnection-Rename.png](Module1-ServiceConnection-Rename.png)

    Navigate to **Branding & properties** and update the **name** for this SPN to:

    +++@lab.LabInstance.Id-Azure-Service-Connection-Development+++

    !IMAGE[Module1-ServiceConnection-Rename-2.png](Module1-ServiceConnection-Rename-2.png)

    Click **Save** and close the tab

22. [] Repeat the previous steps by selecting  **New Service Connection** under Service Connections, and enter the following values:

    Subscription **Azure Pass ...** 
    
    Resource Group **rg-juiceshop-prod-lod**

    Service connection name +++Azure-Service-Connection-Production+++ 

    Check the box **Grant access permission to all pipelines**

    !IMAGE[CreateServiceConnection-03.png](CreateServiceConnection-03b.png)

    Click on **Save**

23. [] Open the recently created Production service connection and click on **Manage Service Principal**

    !IMAGE[Module1-ServiceConnection-Rename-prod.png](Module1-ServiceConnection-Rename-prod.png)

    Navigate to **Branding & properties** and update the **name** for this SPN to:

    +++@lab.LabInstance.Id-Azure-Service-Connection-Production+++

    !IMAGE[Module1-ServiceConnection-Rename-2-prod.png](Module1-ServiceConnection-Rename-2-prod.png)

    Click on **Save**
    
24. [] Back to *Cloud Shell* on Azure portal and run the following commands (right click to paste alternative):

    1. +++$objectid=$(az ad sp list --query "[?ends_with(displayName, 'Azure-Service-Connection-Production')].id" --all --output tsv)+++

    2. +++az role assignment create --role "Owner" --assignee-object-id $objectid --scope "/subscriptions/$(az account show --query 'id' --output tsv)" --assignee-principal-type ServicePrincipal+++

    !IMAGE[Module1-AzureCloudShell-07.png](instructions173831/Module1-AzureCloudShell-07.png)

25. [] Back on Azure DevOps, navigate to **Repos** --> **Files**

    !IMAGE[Module1-DevOps-BackRepos.png](Module1-DevOps-BackRepos.png)

    Click on **Upload files(s)**

    !IMAGE[Module1-DevOps-Add-File.png](Module1-DevOps-Add-File.png)

26. [] Click on **Browse** and select all files located on: 

    +++C:\Labfiles\Module1+++

    !IMAGE[Module1-DevOps-Add-File-2.png](instructions173831/Module1-DevOps-Add-File-2.png)

    Click on **Commit**

27. [] Navigate to **Pipelines** and click on **Create Pipeline**

    !IMAGE[CreateServiceConnection-05.png](CreateServiceConnection-05.png)

28. [] Select **Azure Repos Git YAML**

    !IMAGE[CreateServiceConnection-06.png](instructions173831/CreateServiceConnection-06.png)

    Select **DevSecOps**

    !IMAGE[CreateServiceConnection-07.png](CreateServiceConnection-07.png)

    Select **Existing Azure Pipelines YAML file**
   
    !IMAGE[Module4-SelectRepository2.png](instructions173831/Module4-SelectRepository2.png)

29. [] Type +++/azure-pipelines-Deployinfra.yml+++ for *Path*

    Click on **Continue**

    !IMAGE[Module1-DevOps-Deploy-Infra-32.png](instructions173831/Module1-DevOps-Deploy-Infra-32.png)

    Click on **Run**

    !IMAGE[Module1-DevOps-Deploy-Infra-3.png](instructions173831/Module1-DevOps-Deploy-Infra-3.png)

30. []  Click on *Pipelines* to go back and rename the pipeline *DevSecOps* to: +++DevSecOps-IaC+++

    !IMAGE[Module1-DevOps-Deploy-Infra-4.png](Module1-DevOps-Deploy-Infra-4.png)

    > **Note**: This will initiate the deployment using infrastructure as code for our production environment. 

### Exercise 2: Set up automated pipelines to deploy the Juice-Shop Aplication 

1. [] Navigate to **Pipelines** and click on **Library** then Click on **+ Variable group**

    !IMAGE[Module1-DevOps-Deploy-Library-1.png](instructions173831/Module1-DevOps-Deploy-Library-1.png)

2. [] For *Variable group name* type +++DevSecOps-Variables+++ then add the following Variables:

    |Name|Value|
    |:--------|:--------|
    |+++ContainerRegistry+++| +++acrdevsecops@lab.LabInstance.Id+++|
    |+++DevResourceGroup+++|+++rg-juiceshop-dev-lod+++|
    |+++ProdResourceGroup+++|+++rg-juiceshop-prod-lod+++|
    |+++DevAppName+++|+++juiceshop-dev-devsecops-@lab.LabInstance.Id+++|
    |+++ProdAppName+++|+++juiceshop-prod-devsecops-@lab.LabInstance.Id+++|
    |+++LabInstanceID+++|+++@lab.LabInstance.Id+++|

    Click on **Save**

    !IMAGE[Module1-DevOps-Deploy-Library-2.png](instructions173831/Module1-DevOps-Deploy-Library-2.png)


3. [] Navigate to **Pipelines** and click on **New Pipeline**

4. [] Select **Azure Repos Git YAML**

    !IMAGE[CreateServiceConnection-06.png](instructions173831/CreateServiceConnection-06.png)

    Select **DevSecOps**

    !IMAGE[CreateServiceConnection-07.png](CreateServiceConnection-07.png)

    Select **Existing Azure Pipelines YAML file**
   
    !IMAGE[Module4-SelectRepository2.png](instructions173831/Module4-SelectRepository2.png)

5. [] Type +++/azure-pipelines-DeployApp.yml+++ for *Path*

    Click on **Continue**

    !IMAGE[Module1-DevOps-Deploy-Infra-33.png](instructions173831/Module1-DevOps-Deploy-Infra-33.png)

    Click on **Run**

    !IMAGE[Module1-DevOps-Deploy-Infra-34.png](instructions173831/Module1-DevOps-Deploy-Infra-34.png)

    >**Note: ** The first build will take approximately 10 minutes to complete. Don't wait, and proceed to the next exercise. 
    >
    > When prompted, approve and grant the necessary permissions for the pipeline to use the environments 

    !IMAGE[deploy_approve_deploy.png](deploy_approve_deploy.png)

## Enable Defender for DevOps

### Overview

Microsoft Defender for Cloud enables comprehensive visibility, posture management, and threat protection across multicloud environments including Azure, AWS, GCP, and on-premises resources. 

Defender for DevOps, a service available in Defender for Cloud, empowers security teams to manage DevOps security across multi-pipeline environments

This process is important to add security inside the pull request process.

## Exercise 3: Enable Defender for DevOps to check the infrainfrastructure 

1. [] Navigate to +++https://portal.azure.com+++ and click on **Microsoft Defender for Cloud**

    !IMAGE[Module6-DefenderForCloud3.png](Module6-DefenderForCloud3.png)

    Under **Getting Started** click on **Upgrade** then click on **Install agents**

    !IMAGE[Module6-DefenderForCloud4.png](Module6-DefenderForCloud4.png)

    >**Note:** After click on *Upgrade* just move on, no feedback here

2. [] Click on **Environnement settings**

    !IMAGE[Module6-DefenderForCloud4-2.png](Module6-DefenderForCloud4-2.png)

    Click on **+ Add environment** then **Azure DevOps**

    !IMAGE[Module6-DefenderForCloud5.png](instructions173831/Module6-DefenderForCloud5.png)

3. [] Type +++DevSecOps+++ for *Connector name* and select **rg-juiceshop-dev-lod** for *resource group*

    Select **Central US** for region

    Click **Next: Select plans >**

    !IMAGE[Module6-DefenderForCloud6.png](Module6-DefenderForCloud6.png)

    Click **Next: Configure access > **

4. [] Click on **Authorize** then **Accept** on the botton of the pop-up window

    !IMAGE[Module6-DefenderForCloud7.png](instructions173831/Module6-DefenderForCloud7.png)

    Click **Next: Review and create >**, click **Create**

    > Defender for cloud automatically checks for vulnerabilities once activated. The results may take a few minutes to appear on the portal 

## Exercise 4: Confirm the deployment in Azure

1. [] Back to +++https://dev.azure.com/Student1-@lab.LabInstance.Id/DevSecOps/_build+++ Wait until the pipeline completes the execution and check the results.

    >**Note: ** When prompted, approve and grant the necessary permissions for the pipeline to use the environments 

    !IMAGE[CreateServiceConnection-08.png](CreateServiceConnection-08.png)

2. [] Open a new tab on your browser and navigate to the portal Azure +++http://portal.azure.com+++

3. [] Open **Resource groups** then **rg-juiceshop-dev-lod**, then open the App Service **juiceshop-dev-devsecops-@lab.LabInstance.Id** 

    !IMAGE[Module1-WebPppDemo.png](Module1-WebPppDemo.png)

    Or just type +++juiceshop-dev-devsecops-@lab.LabInstance.Id+++ on the search bar

4. [] In the **Overview** menu, click on the **Default domain** link to navigate to the website

    !IMAGE[Module1-WebPppDemo2.png](Module1-WebPppDemo2.png)

    >**Note: ** The first opening will take around 3 min to complete. Maybe a stop/start on the website is needed

    Navigate on the website and get familiar

    !IMAGE[Module1-AzureResultAKSShowPortsAKS_Site.png](Module1-AzureResultAKSShowPortsAKS_Site.png)

    >**Note: ** Feel free to test the Production Juice Shop located in the Production resource group. 

[Return to list of modules](#modules) 

===

# Module 2: Credentials Management in Pipeline Lab

## Lab 1: Configure secrets of your Azure DevOps Pipelines

### Introduction

The development team wants to integrate bests practices in credential management and avoid passwords stored in source control and the system.

The requirement is that the SecInfo team can specify new passwords and certificates in a centralized system.
This lab provides a safe way to store and consume credentials from the Azure Key Vault.

### Objectives

After completing this lab, you will be able to:

- Configure an Azure Key Vault in Azure DevOps Pipeline
- Secure your application with secret management, safe and reliable

### Set up security in Pipelines

#### Objectives

After completing this exercise, you will be able to:

- Configure Key Vault in the Azure DevOps pipeline

#### Scenario

In this exercise, you will configure a Build Pipeline and Release that will
get Passwords from a KeyVault and publish artifacts for the Release Pipeline to deploy in production.

## Exercise 1: Set up Approvals in your Service Connection

1. [] In Azure DevOps, Navigate to **Project Settings** --> **Service connections** and click in your Service connections **Azure-Service-Connection-Production**

    ![](Module2-SecurityPipeline-01.png)

    Click on  **...** top right then **Approvals and checks**

    !IMAGE[Module2-SecurityPipeline-02.png](instructions173831/Module2-SecurityPipeline-02.png)

    Click  **Approvals**

    ![](Module2-SecurityPipeline-03.png)

2. [] On the **Approvers** type +++@lab.CloudCredential(SSGM3653sharpStakeholderJudDoran).AdministrativeUsername+++ then select to the approvals list then click **Create**

    > In the Approvals, you can configure the group or the person that will approve any usage of this environment.

    ![](Module2-SecurityPipeline-04.png)

    >**Note:** Service connections allow changes in the infrastructure and Services. Each environment can have different security approvals

## Exercise 2: Link Azure Key Vault to Azure DevOps Pipeline

1. [] Navigate to +++http://portal.azure.com+++ open the Key vault +++kvdevsecops@lab.LabInstance.Id+++ under **rg-juiceshop-dev-lod**

    !IMAGE[Module2-KeyVaultAccess01.png](Module2-KeyVaultAccess01.png)

2. [] Click on **Access policies** then **+ Create**

    !IMAGE[Module2-KeyVaultAccess02.png](Module2-KeyVaultAccess02.png)
    
3. [] On the first combobox, select **Key, Secret & Certificate Management** then  click **Next** and type +++@lab.CloudCredential(SSGM3653sharpStakeholderJudDoran).AdministrativeUsername+++ on the search box

    !IMAGE[Module2-KeyVaultAccess03.png](Module2-KeyVaultAccess03.png)

    Select the listed item then click **Next**, **Next** again then **Create**

    >Note: This action will grant access to your user to manage this Azure Key Vault

4. [] Click on **+ Create** to add another permission 

    !IMAGE[Module2-KeyVaultAccess02.png](Module2-KeyVaultAccess02.png)

5. [] Under **Secret permissions** check **Get** and **List** click next on the search box type +++juiceshop-prod-devsecops-@lab.LabInstance.Id+++

    !IMAGE[Module2-KeyVaultAccess03b.png](Module2-KeyVaultAccess03b.png)

    Select the listed item

    !IMAGE[keyvaultaddpersionsionprod.png](keyvaultaddpersionsionprod.png)

    click **Next**, **Next** again then **Create**

    >Note: This action will grant access to juice-shop-prod app to get secrets using the Managed Identity

6. [] Click on **Secrets**, then click on **+ Generate/Import**

    !IMAGE[Module2-KeyVaultAccess05.png](Module2-KeyVaultAccess05.png)

7. [] On the field **Name** type +++2FASecret+++, for **Secret value** type +++s3cr3t!+++ then click **Create**

    !IMAGE[Module2-KeyVaultAccess06.png](Module2-KeyVaultAccess06.png)

8. []Click on **+ Generate/Import** again

9. [] On the field **Name** type +++SQL-DB-URL+++, for **Secret value** type +++https://sql-devsecops-@lab.LabInstance.Id.database.windows.net+++ then click **Create**

    !IMAGE[Module2-KeyVaultAccess07.png](Module2-KeyVaultAccess07.png)

## Exercise 3: Configure the YAML Pipeline to use the New Key Vault and the new Environment

> We should never store passwords in source control. To ensure this, let's modify the source code to utilize token replacement during the CI/CD process

1. [] Navigate to **Pipelines** and click on **...** then **Edit** to change the pipeline **DevSecOps**

    !IMAGE[Module2-CreateKeyVault000.png](Module2-CreateKeyVault000.png)

2. [] Under *Deploy_prod* Stage (line 70) click on **Settings** over *AzureAppServiceSettings@1* task (line 83)

    !IMAGE[Module2-CreateKeyVaultRelease02b.png](Module2-CreateKeyVaultRelease02b.png)

3. [] On *App settings* add the following code

    ```
    [
        {
            "name": "SQL_DB_URL",
            "value": "@Microsoft.KeyVault(SecretUri=https://kvdevsecops@lab.LabInstance.Id.vault.azure.net/secrets/SQL-DB-URL)",
            "slotSetting": false
        },        
        {
            "name": "2FASecret",
            "value": "@Microsoft.KeyVault(SecretUri=https://kvdevsecops@lab.LabInstance.Id.vault.azure.net/secrets/2FASecret)",
            "slotSetting": false
        }
    ]    
    ```

    !IMAGE[Module2-CreateKeyVaultRelease02C.png](Module2-CreateKeyVaultRelease02C.png)

    Click **Add** to update the task

    > Now, the database address can be updated directly from the Azure Key Vault without the need to redeploy the app.

    Click **Save**, **Save** 

    !IMAGE[Module2-CreateKeyVaultRelease04.png](Module2-CreateKeyVaultRelease04.png)

    Then click **Run**

    >**Note:** When required, approve DevOps to use resources on the Pipelines page for your Library


4. [] Take a 10 min break now, and when you return, navigate to your **rg-juiceshop-prod-lod** resource groups. Verify that the new Application configuration in production is being sourced from the Azure Key Vault

    !IMAGE[webAppKeyVaultDeploy.png](webAppKeyVaultDeploy.png)
    
[Return to list of modules](#modules) 

===

# Module 3: Application Security Principles

## Lab 1: Investigate Security Vulnerabilities

### Introduction

In this lab, you will investigate security vulnerabilities in a web
application and discuss with the instructor how to resolve them.

### Objectives

After completing this lab, you will be able to understand common security design vulnerabilities.

### Scenario

- Use the website
- Explore some basic hacking opportunities
- Discuss your findings with the class and instructor

### Exercise 1: Explore some OWASP listed vulnerabilities in the Juice Shop

#### Task 1: Explorer the website and an XXS attack

1. [] Navigate to Azure portal +++https://portal.azure.com+++ and open the resource **juiceshop-dev-devsecops-@lab.LabInstance.Id** under *rg-juiceshop-dev-lod*

    !IMAGE[Module3-ContosoTimes00.png](Module3-ContosoTimes00.png)

2. [] Click on the *Default Domain* URL located on the **Overview** page. The URL should look similar to: +++https://juiceshop-dev-devsecops-@lab.LabInstance.Id.azurewebsites.net+++

    >**Note:** Click on the start button if the service is stopped

    !IMAGE[Module3-ContosoTimes01.png](Module3-ContosoTimes01.png)
    
    Start being familiar with this website.

    ![Contoso](Module3-ContosoTimes.png )

    >**Note:** The first time the website opens, it's a little slow. Maybe a refresh or Stop/Start is needed

3. [] On the search Box, Perform a reflected XSS (Cross-Site Scripting) attack to see if the website accepts. Use the following code:

    ```js
    <iframe src="javascript:alert('HACKED')">
    ```
    
    !IMAGE[Module3-ContosoTimes02.png](Module3-ContosoTimes02.png)

    > Note as an attacker, XSS can be used to send a malicious script to an unsuspecting user. The end user's browser has no way of knowing that the script should not be trusted and will execute the script. Because it thinks the script came from a trusted source, the malicious script can access any cookies, session tokens, or other sensitive information retained by the browser and used with that site. These scripts can even rewrite the content of the HTML page. 

#### Task 2: Explore the unhandled exception

1. [] Navigate to the login page, and press **Ctrl+Shift+i** to enable developer tools, then select the **Network** tab

    Use the following credentials to trigger an error:

    Email: +++**'**+++

    Password: +++anything+++

    Click **Log in**

    ![Login](Module3-ContosoTimesLogin.png )

    Congratulations, you solved a hidden challenge

    !IMAGE[Module3-ContosoTimesLogin01.png](Module3-ContosoTimesLogin01.png)

2. [] On the network tab, click on the **login** item with the status **500** to explore the unhandled exception in **Preview**.

    > Note: Error and exception not handling should be considered Security Issue because it provides too much information about your environment.
    >
    > Error handling is also important from an intrusion detection perspective. Certain attacks against your application may trigger errors which can help detect attacks in progress.

    ![](Module3-ContosoTimesLinkLogin.png)

    Observe how the front-end just shows the error as **[object Object]**. This indicates that an unhandled error was trowed by the back-end and exposed to the end-user.

    ![Module 3](Module3-ContosoTimesMenu.png )

    Observe that the back-end just trowed all the errors from SQLite to the front-end, and now we know the back-end uses SQLite you can alternatively check all the vulnerabilities for **SQLite** at:

    <[https://cve.mitre.org/cgi-bin/cvekey.cgi?keyword=SQLite](https://cve.mitre.org/cgi-bin/cvekey.cgi?keyword=SQLite)

    >**Note:** Now that we know that the website uses **SQLite** let's explore another widespread SQL Injection

3. [] Log in as Admin using SQL Injection, use the following "Credentials"

    Email: +++**'or 1=1 --**+++

    Password: +++**anything**+++

    > This email uses a SQL inject tactics to bypass username and password verification
    
    ![Contoso Text Body](Module3-ContosoTimesText.png )

    Note that you are now logged in as Admin, but since this is an SQL injection, all possibilities are achievable.

    ![Contoso Text Body](Module3-ContosoTimesText2.png )

#### Task 3: Explore bad session management and failure to handle authorization verification

1. [] Open your **basket** top right corner and observe that you have three items, then click on **application** on the debugger 

    !IMAGE[Module3-ContosoTimesText002.png](Module3-ContosoTimesText002.png)

2. [] Under **Storage** click on **Session Storage** then **htps://juiceshop-dev-dev....** then update the bid from 1 to 2 then **Refresh** your browser

    !IMAGE[Module3-ContosoTimesText003.png](Module3-ContosoTimesText003.png)

    Congratulations, you are seeing someone else's basket

    > The basket ID was provided during login and never verified again. So any manipulation on the front-end will be considered legit. 

#### Task 3: Use an automated tool to attack and find vulnerabilities

> OWASP Zed Attack Proxy (ZAP) is a free, open-source penetration testing tool being maintained under the umbrella of the Open Web Application Security Project (OWASP). ZAP is designed specifically for testing web applications

1. [] Open OWASP ZAP from your taskbar, and click on **Automated Scan**

    ![Contoso Text Body](Module3-ContosoTimesText3.png )

2. [] Type the URL of Juice shop Dev +++https://juiceshop-dev-devsecops-@lab.LabInstance.Id.azurewebsites.net+++ then click **Attack**.

    >This process will take 2+ minutes and apply different tests and checks to evaluate the security of the URL provided

    ![Contoso Text Body](Module3-ContosoTimesText4.png )

    > **Note: ** You can use OWASP Zap as a tool for scan websites on your pipeline on Azure DevOps on the command line. This kind of scan is also known as the Dynamic Application Security Test (DAST)
    >
    > Optional: you can explore all the vulnerabilities found on the **Alerts** tab

    ![Contoso Text Body](Module3-ContosoTimesText5.png )

3. [] Click on **Spider** to check all the hidden URLs found during the scan

    Note that very interesting URL ending with "ftp", try that URL on your browser to see the results

    !IMAGE[Module3-ContosoTimesText6.png](instructions173831/Module3-ContosoTimesText6.png)

4. [] Open the file "acquisitions.md"
  
    ![Contoso Text Body](Module3-ContosoTimesText7.png )

    >**Note:** Here we can check many problems:
    - Restricted area open on the internet without any authentication
    - Data stored without encryption
    - Confidential documents about acquisitions exposed on the internet

    > Optional: Since you are logged in as an Admin, you can now access privileged areas on the website, for instance, all the information from customers:

    (e.g., +++https://juiceshop-dev-devsecops-@lab.LabInstance.Id.azurewebsites.net/#/administration+++ )

    ![Contoso Text Body](Module3-ContosoTimesText8.png )

5. [] **OPTIONAL:** If you feel comfortable, using replay try to **Place an order that makes you rich**

    URL: +++https://juiceshop-dev-devsecops-@lab.LabInstance.Id.azurewebsites.net/api/BasketItems/2+++

    More information here +++https://pwning.owasp-juice.shop/companion-guide/latest/appendix/solutions.html+++

#### Task 4: Discuss your findings with the class and instructor

In this task, you will discuss your findings with your colleagues and instructor.

Most of the vulnerabilities listed here can be detected with a Static Analysis Security Test (SAST), others with a Dynamic Application Security Test (DAST)

In Lab 4, we will see how to automate scanners within the pipelines to search for those vulnerabilities.

[Return to list of modules](#modules) 

===

# Module 4: Automating a Secure and Compliant Pipeline

## Objectives

After completing this exercise, you will be able to:

- Integrate Static Application Security Testing into the Azure DevOps Pipeline
- Integrate Static Code Analysis (SCA) into the Azure DevOps Pipeline
- Integrate Security Verification tests for infrastructure
- Integrate Credential Scanners verification on the repos
- Integrate Dynamic Application Security Testing
- Check the security of your pipelines

## Shift-Left adding security extensions to SDL

### Scenario

The shift-left strategy aims to integrate security testing and validation into the development process as early as possible, 
typically in the left-side of the development life cycle. 

In this exercise, you will attempt to implement the shift-left strategy by 
incorporating security automation into Azure DevOps pipelines. This means that security tests will be run automatically as part of the pipeline, 
providing early feedback and helping to catch security issues before they make it to production. 

By integrating security into the development process, the shift-left strategy can help to improve the overall security of your applications.

## Exercise 1 : Add security extensions to your Azure DevOps

1. [] Go back to +++https://dev.azure.com+++ and click **Browse marketplace**
    
    !IMAGE[module4-AddSonarQube.png](module4-AddSonarQube.png)

2. [] On the search box type +++SonarQube+++ then click on **SonarQube**
    
    !IMAGE[module4-AddSonarQube02.png](module4-AddSonarQube02.png)

    Click in **Get it free**

    !IMAGE[module4-AddSonarQube03.png](module4-AddSonarQube03.png)

    You will see the name of your organization on the Combobox. Click on **Install**

    !IMAGE[module4-AddSonarQube04.png](module4-AddSonarQube04.png)

    Click **Go to Marketplace**

3. [] On the search box type +++dependency track+++ then click on **Dependency Track** from GSoft

    !IMAGE[module4-AddSonarQube05.png](module4-AddSonarQube05.png)

    Click in **Get it free**

    !IMAGE[module4-AddSonarQube06.png](module4-AddSonarQube06.png)

    You will see the name of your organization on the Combobox. Click on **Install**

    !IMAGE[module4-AddSonarQube07.png](module4-AddSonarQube07.png)

    Click **Go to Marketplace**

4. [] On the search box type +++OWASP ZAP Scanner+++ then click on **OWASP ZAP Scanner**

    !IMAGE[module4-AddSonarQube15.png](module4-AddSonarQube15.png)

    Click in **Get it free**

    !IMAGE[module4-AddSonarQube16.png](module4-AddSonarQube16.png)

    You will see the name of your organization on the Combobox. Click in **Install**

    !IMAGE[module4-AddSonarQube17.png](module4-AddSonarQube17.png)

    Click **Go to Marketplace**

5. [] On the search box type +++ADO Security Scanner+++ then click on **ADO Security Scanner**

    !IMAGE[module4-AddSonarQube12.png](module4-AddSonarQube12.png)

    Click in **Get it free**

    !IMAGE[module4-AddSonarQube13.png](module4-AddSonarQube13.png)

    You will see the name of your organization on the Combobox. Click in **Install**

    !IMAGE[module4-AddSonarQube14.png](module4-AddSonarQube14.png)

    Click **Proceed to organization**

    !IMAGE[module4-AddSonarQube11.png](module4-AddSonarQube11.png)

    > On the marketplace, you can find Visual Studio and VS Code security tools. Adding security tools to your IDE is an excellent Shift-Left strategy for Security

## Exercise - 2: Configure a SonarQube Project and configure Quality Gate

1. [] Navigate to Azure portal +++https://portal.azure.com+++ and open the resource +++sonarq-devsecops-@lab.LabInstance.Id+++

     !IMAGE[Module4-AddSonarConfigure02-Portal.png](Module4-AddSonarConfigure02-Portal.png)

2. [] Copy the FQDN Url **e.g.: sonarq-devsecops-@lab.LabInstance.Id.eastus.azurecontainer.io**

    On a new that use the FQDN and port 9000 to navigate to SonarQube, e.g.: +++http://sonarq-devsecops-@lab.LabInstance.Id.eastus.azurecontainer.io:9000/+++.

    !IMAGE[Module4-AddSonarConfigure03-Portal.png](Module4-AddSonarConfigure03-Portal.png)

3. [] On the SonarQube Portal login using the following credentials:

    Username = +++admin+++
    
    Password= +++admin+++

    !IMAGE[Module4-AddSonarConfigure02.png](Module4-AddSonarConfigure02.png)

    > **Note** On the first login, you will be asked to change the password. Take note of your new password

4. [] Click on **Administration** menu in the toolbar,then click on **Projects** tab, then **Management**.
  
    ![](Module4-sonar_admin.png)

5. [] Click on **Create a project** and enter the following information:  

    **Name** +++DevSecOps+++

    **Key** +++DevSecOps+++

    **Visibility** option to **Private**

    !IMAGE[Module4-AddSonarConfigure03.png](instructions173831/Module4-AddSonarConfigure03.png)

    Click **Create** then **Close**

6. [] Click on the **Quality Gates** menu and click **Create** on the Quality Gates screen

    >Quality Gates enforce a quality policy in your organization by answering 
     one question: is my project ready for release?
     In this lab, we will create a Security quality gate

    Use the following information as the name for this Quality Gate: 
    
    Name +++DevSecOpsQG+++ 

    ![](Module4-AddSonarConfigurequalitygate.png)

    Click **Save**

7. [] Click on **Unlock editing**.
    
    !IMAGE[Module4-AddSonarConfigure03b.png](Module4-AddSonarConfigure03b.png)

8. [] Click on **Add Condition**.
    
    > Add a condition to check for the number of security issues in the code. 

    Select **On Overall Code** option

    As **Quality Gate fails when** select +++Security Review Rating+++  in the combo box

    On **Value** select **A** and click **Add Condition**.

    ![](Module4-AddSonarConfigure04.png)

    > **Note**: This condition means that if the number of Vulnerabilities in Sonar Analysis is lower than A, then the quality gate will fail.

9. [] Enforce this quality gate for the DevSecOps project, click on **All** under the **Projects** section and select the **DevSecOps** project checkbox.

    ![](Module4-AddSonarConfigure05.png)

10. [] Navigate to **My Account** then **Security** tab, in the field **Enter Token Name** type +++DevSecOps+++, select **Global Analysis Token** and click **Generate**

    **Copy** the generated token here: @lab.TextBox(SONARQ).

    !IMAGE[Module4-AddSonarConfigure07.png](instructions173831/Module4-AddSonarConfigure07.png)

    > **Note**: This token will be used to run analysis through DevOps services.

## Exercise 3 : Integrate Static Analysis Security test with SonarQube in the Build Pipeline

1. [] Back on Azure DevOps, navigate to **Repos** --> **Files**

    !IMAGE[Module1-DevOps-BackRepos.png](Module1-DevOps-BackRepos.png)

    Click on **Upload files(s)**

    !IMAGE[Module1-DevOps-Add-File.png](Module1-DevOps-Add-File.png)

2. [] Click on **Browse** and select all files located on: 

    +++C:\Labfiles\Module4+++

    !IMAGE[Module4-DevOps-Add-File-1.png](instructions173831/Module4-DevOps-Add-File-1.png)

    Click on **Commit** 

3. [] Click on **Project settings** --> **Service Connection** --> **New Service connection**

    ![Edit Release Pipeline](module2-CreateServiceConnection-1.png )

    In the search, type +++SonarQube+++ and click **Next**

    ![Edit Release Pipeline](module2-CreateServiceConnection-2.png )

4. [] Enter the information you gathered from the previous exercise.

    **Server URL:** +++http://sonarq-devsecops-@lab.LabInstance.Id.eastus.azurecontainer.io:9000+++

    **Token:** +++@lab.Variable(SONARQ)+++

    **Service connection name: ** +++Sonar+++

    Check the box **Grant access permission to all pipelines**

    !IMAGE[module2-CreateServiceConnection-3.png](module2-CreateServiceConnection-3.png)

    Click **Save**

5. [] Go back to **Pipelines** and Click on **New Pipeline** to configure the pipeline 

    !IMAGE[Module4-UsingSAST1.png](Module4-UsingSAST1.png)

    Select **Azure Repos Git YAML**

    !IMAGE[Module2-CreateKeyVaultRelease01a.png](instructions173831/Module2-CreateKeyVaultRelease01a.png)

    Select **DevSecOps**

    !IMAGE[Module4-SelectRepository.png](Module4-SelectRepository.png)

    Select **Existing Azure Pipelines YAML file**
   
    !IMAGE[Module4-SelectRepository2.png](instructions173831/Module4-SelectRepository2.png)

6. [] Enter +++/azure-pipeline-SAST.yml+++ in the *Path* field

    Click **Continue**

    !IMAGE[Module2-CreateKeyVaultRelease01e.png](instructions173831/Module2-CreateKeyVaultRelease01e.png)

    Explore SonarQube. This tool is composed of 3 sections:

    The following task enables the setup configuration for SonarQube

    ![](Module4-AddSonarConfigure08.png)

    The following task enables the start of the SonarQube scanner

    ![](Module4-AddSonarConfigure09.png)

    The following task publishes the results of the scanner to the SonarQube instance in Azure

    ![](Module4-AddSonarTask.png)

    Click in **Run**

7. [] Back to Pipelines, click on **...** to rename the pipeline **DevSecOps (1)**

    !IMAGE[Module4-AddSonarConfigure10.png](Module4-AddSonarConfigure10.png)

    On **Name** text box type +++DevSecOps-SAST+++ 

    !IMAGE[Module4-AddSonarConfigure11.png](Module4-AddSonarConfigure11.png)

    Click **Save**

8. [] Wait until the end of the execution of **DevSecOps-SAST**, then click on it the view the results

    !IMAGE[Module4-AddSonarConfigure12.png](Module4-AddSonarConfigure12.png)

    Click the first line to view the individual result 

    !IMAGE[Module4-AddSonarConfigure13.png](Module4-AddSonarConfigure13.png)

9. [] Click on **Extension** to check the result of **SonarQube Analysis Report**. 

    > With this extension, you can see the analysis without the need to leave Azure DevOps
    
    Click on the link **Detailed SonarQube report >**

    !IMAGE[Module4-AddSonarConfigure14.png](Module4-AddSonarConfigure14.png)

    Review the report by clicking on **Security Hotspots** and discuss with your instructor the report from SonarQube

    !IMAGE[Module4-AddSonarConfigure15.png](Module4-AddSonarConfigure15.png)

    >**Note:** Inspect the **Security Hotspots** on Sonar Qube to check more about the review

## Exercise - 4 : Dependency-Track **

### Managing Open-source security and licenses with Dependency-Track

Dependency-Track is an intelligent Component Analysis platform that allows organizations to identify and reduce risk in the software supply chain. Dependency-Track takes a unique and highly beneficial approach by leveraging the capabilities of Software Bill of Materials (SBOM). This approach provides capabilities that traditional Software Composition Analysis (SCA) solutions cannot achieve

1. [] Navigate to +++http://portal.azure.com+++ open the App Service +++dependency-track-devsecops-@lab.LabInstance.Id+++ under +++rg-juiceshop-dev-lod+++

    Click on the **URL** located on the overview page

    !IMAGE[Module4-WhiteBoltConfig.png](Module4-WhiteBoltConfig.png)

    >**Note:** Expect the first opening to take longer. A website stop/start may be necessary

    > **Tip** Use the following URL as shortcut  +++https://dependency-track-devsecops-@lab.LabInstance.Id.azurewebsites.net+++
    
2. [] Enter the following credentials

    Username: ++admin++

    Password: ++admin++

    !IMAGE[Module4-WhiteBoltConfig2.png](Module4-WhiteBoltConfig2.png)

    >**Note:** You will be prompted to change the password. Use the old credentials (admin/admin) and enter a new password:

    !IMAGE[Module4-WhiteBoltConfig3.png](Module4-WhiteBoltConfig3.png)

    Click on **Change password**

    Then log in with your new password

3. [] Navigate to **Administration** --> **Access Management** --> **Teams**

    !IMAGE[Module4-WhiteBoltConfig4.png](Module4-WhiteBoltConfig4.png)

4. [] Click on **Automation** under *Teams* then 

    **Copy** the **API Keys** here: @lab.TextBox(DEP_TEAM_KEY) (*Without spaces*)

    !IMAGE[Module4-WhiteBoltConfig5.png](Module4-WhiteBoltConfig5.png)

5. [] Navigate to **Policy Management** then create policy with the name +++DevSecOps-Policy+++

    !IMAGE[Module4-WhiteBoltConfig6.png](Module4-WhiteBoltConfig6.png)

6. [] Change the **Violation State** of the policy to *Fail* and add the following conditions 

    |Condition |Operator|Value |
    |:--------|:--------|:--------|
    |Licence group |is| Copyleft|
    |Severity |is| Critical|
    
    !IMAGE[Module4-DependencyTrack-Policy.png](instructions173831/Module4-DependencyTrack-Policy.png)

7. [] Navigate to **Projects** then click **Create Project**

    !IMAGE[Module4-WhiteBoltConfig8.png](Module4-WhiteBoltConfig8.png)

8. [] Enter the following values

    **Project Name**: +++DevSecOps+++
    
    **Classifier**: *Application*

    !IMAGE[Module4-WhiteBoltConfig9.png](Module4-WhiteBoltConfig9.png)

    Click **Create**

9. [] Open the project DevSecOps then Click **View Details**. 

    !IMAGE[Module4-WhiteBoltConfig10.png](Module4-WhiteBoltConfig10.png)

    Copy the **Object Identifier** here: @lab.TextBox(DEP_PROJ_KEY)

10. [] Go back on Azure at +++http://portal.azure.com+++, open the Key Vault  +++kvdevsecops@lab.LabInstance.Id+++ under **rg-juiceshop-dev-lod**

    Under Secrets, click on **Generate/Import** to add the following secrets 

    | Name | Secret value |
    |:--------|:--------|
    |+++dtrackProjId+++ | +++@lab.Variable(DEP_PROJ_KEY)+++|
    |+++dtrackAPIKey+++ | +++@lab.Variable(DEP_TEAM_KEY)+++ |    

    !IMAGE[Module4-KeyVault-NewSecrets.png](instructions173831/Module4-KeyVault-NewSecrets.png)


11. [] Navigate to **Pipelines** and click on **Library** then click on **+ Variable group**

    For *Variable group name* type +++DevSecOps-KeyVault+++ 

    Select the *Azure subscription* **Azure-Service-Connection-Development** 
    
    Authorize the *Key vault name* **kvdevsecops@lab.LabInstance.Id**
    
    Select all available Secrets then click **Ok**

    !IMAGE[Module4-KeyVault-NewSecrets-2.png](instructions173831/Module4-KeyVault-NewSecrets-2.png)

    Click on **Save**

12. [] Go back to **Pipelines** and Click on **New Pipeline** to configure the pipeline 

    !IMAGE[Module4-UsingSAST1.png](Module4-UsingSAST1.png)

    Select **Azure Repos Git YAML**

    !IMAGE[Module2-CreateKeyVaultRelease01a.png](instructions173831/Module2-CreateKeyVaultRelease01a.png)

    Select **DevSecOps**

    !IMAGE[Module4-SelectRepository.png](Module4-SelectRepository.png)

    Select **Existing Azure Pipelines YAML file**
   
    !IMAGE[Module4-SelectRepository2.png](instructions173831/Module4-SelectRepository2.png)

13. [] Enter +++/azure-pipelines-SCA.yml+++ in the *Path* field

    Click **Continue**

    !IMAGE[Module4-DependencyTrack-01.png](instructions173831/Module4-DependencyTrack-01.png)

    Click **Run**

    >**Note:** Since this is your first time running this pipeline, you'll need to approve its execution.

14. [] Back on pipelines rename the new pipeline e.g.: **DevSecOps (1)**. Click on **...** then **Rename/move**

    **Name:**  +++DevSecOps-SCA+++

    !IMAGE[Module4-RenamePipelinepng.png](Module4-RenamePipelinepng.png)

    Click **Save**

15. [] Wait until the end of the execution of **DevSecOps-SCA**, then click on it the view the results

    !IMAGE[Module2-CreateKeyVaultRelease01c.png](Module2-CreateKeyVaultRelease01c.png)

    >**Note** If the first execution fails, you can retry and see the results

    !IMAGE[Module2-CreateKeyVaultRelease01d.png](Module2-CreateKeyVaultRelease01d.png)

    Go back to the Dependency Track portal and click on **DevSecOps** project

    +++https://dependency-track-devsecops-@lab.LabInstance.Id.azurewebsites.net+++

    >**Note: ** The final results may take a few minutes to show up

    !IMAGE[Module2-CreateKeyVaultRelease01.png](Module2-CreateKeyVaultRelease01.png)

16. [] Review the report and discuss with your instructor the report from the Dependency Track

    - Check the number of 'Audit Vulnerabilities'
    - Check the number of 'Policy Violations', which included a GPL 2 licence
  
    !IMAGE[Module2-UsingSCAPipeline2.png](Module2-UsingSCAPipeline2.png)

## Exercise 5: Search for security vulnerabilities using Microsoft Security DevOps

### Microsoft Security DevOps

In this exercise, we will use some Microsoft Security DevOps capabilities. Microsoft Security DevOps is a command line application that integrates static analysis tools into the development lifecycle. Microsoft Security DevOps installs, configures, and runs the latest versions of static analysis tools (including, but not limited to, SDL/security and compliance tools). Microsoft Security DevOps is data-driven with portable configurations that enable deterministic execution across multiple environments. Please refer to [https://learn.microsoft.com/en-us/azure/defender-for-cloud/azure-devops-extension](https://learn.microsoft.com/en-us/azure/defender-for-cloud/azure-devops-extension).

1. [] Go back to **Pipelines** and Click on **New Pipeline** to configure the pipeline 

    !IMAGE[Module4-UsingSAST1.png](Module4-UsingSAST1.png)

    Select **Azure Repos Git YAML**

    !IMAGE[Module2-CreateKeyVaultRelease01a.png](instructions173831/Module2-CreateKeyVaultRelease01a.png)

    Select **DevSecOps**

    !IMAGE[Module4-SelectRepository.png](Module4-SelectRepository.png)

    Select **Existing Azure Pipelines YAML file**
   
    !IMAGE[Module4-SelectRepository2.png](instructions173831/Module4-SelectRepository2.png)

2. [] Enter +++/azure-pipelines-secure-devops.yml+++ in the *Path* field

    Click **Continue**

    !IMAGE[Module4-DependencyTrack-01.png](instructions173831/Module4-DependencyTrack-01.png)
    
    Click on **Run**

    >**Note:** Since this is your first time running this pipeline, you'll need to approve its execution.

3. [] Back on pipelines rename the new pipeline e.g.: **DevSecOps (1)**. Click on **...** then **Rename/move**

    **Name:**  +++DevSecOps-Secure-DevOps-Extension+++

    !IMAGE[Module4-RenamePipelinepng.png](Module4-RenamePipelinepng.png)

    Click **Save**

4. [] Wait until the end of the execution of **DevSecOps-Secure-DevOps-Extension** pipeline, then click on it the view the results

    !IMAGE[Module4-AZSK-FirstResult.png](Module4-AZSK-FirstResult.png)

    Click the first line to view the result 

    !IMAGE[Module4-AZSK-FirstResult2.png](Module4-AZSK-FirstResult2.png)

5. [] Click on **1 published** link on the summary section.

    !IMAGE[Module4-RemediationCheckDownloadLog.png](Module4-RemediationCheckDownloadLog.png)

    Expand the item **CodeAnalysisLogs** and download the file *msdo.sarif*

    !IMAGE[Module4-RemediationCheckDownloadLogb.png](Module4-RemediationCheckDownloadLogb.png)

6. [] After downloading the logs, open a new tab on your browser and navigate to:

    +++https://microsoft.github.io/sarif-web-component+++ 

    !IMAGE[Module4-RemediationCheckLogExtract1.png](Module4-RemediationCheckLogExtract1.png)

    Click **Open** on the right corner and open the file *msdo.sarif* from your Downloads folder

    !IMAGE[Module4-RemediationCheckLogExtract.png](Module4-RemediationCheckLogExtract.png)

7. [] This file consists of the Security Report, click on *routes/login.ts*.

    !IMAGE[Module4-RemediationCheckDownloadCheck2.png](Module4-RemediationCheckDownloadCheck2.png)

    > A new tab will be open pointing to the issue found, in this case a harded code password

8. [] Check the consolidated vulnerabilities across the entire projects by heading over to the Azure Portal and reviewing Microsoft Defender for DevOps.

    !IMAGE[Module4-DefenderForCloud-01.png](instructions173831/Module4-DefenderForCloud-01.png)

More information about this tool here: 
[https://learn.microsoft.com/en-us/azure/defender-for-cloud/azure-devops-extension](https://learn.microsoft.com/en-us/azure/defender-for-cloud/azure-devops-extension)

## Exercise 6: Use OWASP Zap to Dynamic test Juice-Shop 

### Microsoft Security DevOps

[OWASP/ZAP](https://www.owasp.org/index.php/OWASP_Zed_Attack_Proxy_Project) is a popular free security tool for helping to identify vulnerabilities during the development process from OWASP.

This extension shifts scanning and reporting into the Azure DevOps Pipeline model to enable quick feedback and response from development teams throughout the development life-cycle.

1. [] Go back to **Pipelines** and Click on **New Pipeline** to configure the pipeline 

    !IMAGE[Module4-UsingSAST1.png](Module4-UsingSAST1.png)

    Select **Azure Repos Git YAML**

    !IMAGE[Module2-CreateKeyVaultRelease01a.png](instructions173831/Module2-CreateKeyVaultRelease01a.png)

    Select **DevSecOps**

    !IMAGE[Module4-SelectRepository.png](Module4-SelectRepository.png)

    Select **Existing Azure Pipelines YAML file**
   
    !IMAGE[Module4-SelectRepository2.png](instructions173831/Module4-SelectRepository2.png)

2. [] Enter +++/azure-pipelines-DAST.yml+++ in the *Path* field

    Click **Continue**

    !IMAGE[Module4-DAST-01.png](instructions173831/Module4-DAST-01.png)
    
    Click on **Run**

    >**Note:** Since this is your first time running this pipeline, you'll need to approve its execution.

3. [] Back to pipelines rename the pipeline **DevSecOps (1)** to 

    +++DevSecOps-DAST+++

    !IMAGE[Module4-OWASPZap5.png](Module4-OWASPZap5.png)

    Click **Save**

    > Note: this pipeline will take 15 min to execute, it's time to take a break.
    > When you comme back explore the result on the tab Tests 

    !IMAGE[Module4-OWASPZap6.png](Module4-OWASPZap6.png)


## Check the security of your Pipelines and Azure DevOps

### ADO Security Scanner

This tool helps you keep your ADO artifacts such as various org/project settings, build/release configurations, service connections, agent pools, etc., configured securely. 

More information on [https://github.com/azsk/ADOScanner-docs](https://github.com/azsk/ADOScanner-docs).


1. [] Navigate to DevSecOps Project then click on **Project settings** then **Service Connection**

    +++https://dev.azure.com/Student1-@lab.LabInstance.Id/DevSecOps/_settings/+++

    !IMAGE[Module4-Service-Connection.png](instructions173831/Module4-Service-Connection.png)

    Click on **New Service Connection**

    Select **Azure Repos/Team Foundation Server** the click Next

2. [] Enter the following information to create a new service connection:

    **Connection URL**: +++https://dev.azure.com/Student1-@lab.LabInstance.Id+++

    **Personal Access Token**: +++@lab.Variable(PAT)+++

    **Service connection name**: +++SecurityScanner+++

    **Grant access permission to all pipelines**: Checked

    Click on **Verify and save**

    !IMAGE[Module4-ADOScanner6.png](instructions173831/Module4-ADOScanner6.png)

3. [] Go back to **Pipelines** and Click on **New Pipeline** to configure the pipeline 

    !IMAGE[Module4-UsingSAST1.png](Module4-UsingSAST1.png)

    Select **Azure Repos Git YAML**

    !IMAGE[Module2-CreateKeyVaultRelease01a.png](instructions173831/Module2-CreateKeyVaultRelease01a.png)

    Select **DevSecOps**

    !IMAGE[Module4-SelectRepository.png](Module4-SelectRepository.png)

    Select **Existing Azure Pipelines YAML file**
   
    !IMAGE[Module4-SelectRepository2.png](instructions173831/Module4-SelectRepository2.png)

4. [] Enter +++/azure-pipelines-ADO-Scanner.yml+++ in the *Path* field

    Click **Continue**

    !IMAGE[Module4-ADO-01.png](instructions173831/Module4-ADO-01.png)
    
    Click on **Run**

5. [] Go Back to main menu Pipeline and rename the pipeline *DevSecOps (1)* to +++DevSecOps-Security-Scanner+++

6. [] Navigate to **Dashboards** and click on **Add a widget** then Edit

    Add **ADO Security Org Security View**

    Add **ADO Security Project Components**

    !IMAGE[Module4-ADOScanner9.png](Module4-ADOScanner9.png)

    Click **Done Editing**
    
    >Dashboard reflects updates only upon pipeline execution. Local scan results don't reflect automatically. 
    >
    >If you have remediated a control, make sure you run the pipeline to reflect the updated control results on dashboard

    More info at [https://github.com/azsk/ADOScanner-docs/](https://github.com/azsk/ADOScanner-docs/blob/master/05-Running%20ADOScanner%20as%20pipeline%20extension/README.md#-customizing-your-pat-with-minimum-required-privileges-for-azure-devops-connection)


## Conclusion

### **Efficiency and Security: The Advantage of Multiple Pipelines**

In DevOps/Agile process, balancing speed and security is crucial. This balance is best achieved through multiple pipelines, rather than a single, security-laden pipeline.

**1. Uninterrupted Development Workflow**

A single pipeline with integrated security checks can slow down development. Multiple pipelines enable developers to work without delays, enhancing productivity and agility.

**2. Parallel Security Integration**

A dedicated security pipeline running alongside the development pipeline ensures continuous security oversight without hindering development progress. This structure allows for thorough, non-disruptive security scans.

**3. Prompt Feedback and Issue Resolution**

Security issues are identified and addressed faster in a multi-pipeline setup, providing developers with timely feedback and reducing the cost and effort of later fixes.

**4. Specialized Focus**

Separate pipelines allow developers and security teams to focus on their respective areas, leading to better outcomes in both development and security.

**5. Scalability**

Multiple pipelines offer greater scalability and flexibility, accommodating complex and evolving project demands without compromising speed or security.

**Conclusion**

On the next lab we will see how to integrate all Security Scanners using multiple pipelines in the secure development lifecycle to optimise both speed and security. This approach is more efficient, secure, and collaborative environment, leading to higher-quality software delivered promptly.


[Return to list of modules](#modules) 

===

# Module 5: Threat Modeling

## Introduction

Threat modelling is a core discipline of any SDL.

## Objectives

After completing this lab, you will be able to:

- Use Microsoft's threat modelling tool to create threat models for enterprise scenarios.

## Lab 1: Threat Model

### Scenario

In this exercise, you will learn how to create a threat model for a
simple Azure-hosted web application.

- The application is in App Service Environment with VNET integration.
- It is protected by the Azure Application gateway with WAF
- It uses AAD authentication for users
- It stores its data in Cosmos DB and Azure SQL
- It connects to an on-prem web service (rest full) via ExpressRoute.

### Exercise 1: Threat Model

#### Task 1: Create Diagram

>**Note1**: Use the new stencils available on your desktop.

1. [] Enter the elements above into the threat modelling tool.

2. [] Draw Active Flows only in the direction of control (do not diagram responses)

3. [] Draw trust boundaries, such as Azure, VNETs, On-Prem Datacenter

Sample:

!IMAGE[Module5-MTM-03.png](instructions173831/Module5-MTM-03.png)

>**Note2**: If you have difficulty, use the final version file on:  +++C:\Labfiles\Module5\Final\FinalModel.tm7+++

#### Task 2: Generate Threats

1. [] Switch to Analysis view (in View menu)

    !IMAGE[Module5-MTM-01.png](instructions173831/Module5-MTM-01.png)

2. [] Review the generated threats on the **Threat List**

    !IMAGE[Module5-MTM-02.png](instructions173831/Module5-MTM-02.png)

#### Task 3: Mitigate Threats

1. [] Work through some of the mitigations (as time permits)

[Return to list of modules](#modules) 

===

# Module 6: Implementing manual verification using Azure DevOps and Azure Defender for Cloud

## Objectives

After completing this lab, you will be able to:

- Implement Manual verification across the development life cycle
- Make the life of the reviewer easier with build verification
- Implement a pull request process
- Use Azure Defender for Cloud to support Manual verification

## Configure branch policy and bests practices

### Overview

Pull requests let your team give feedback on changes in feature branches before merging the code into the master branch. Reviewers can step through the proposed changes, leave comments, and vote to approve or reject the code. Azure DevOps provides a rich experience for creating, reviewing, and approving pull requests.

This process is important to add security inside the pull request process.

## Exercise 1: Configure branch policies and automation to help the manual process

1. [] Navigate to **Repos** --> **Branches** and click first on **Lock** on the *master* branch, then Click on **Branch policies**

    >Adding a lock will block any direct updates, and only *Pull Requests* will be accepted.

    !IMAGE[Module8-BranchPolicies.png](Module8-BranchPolicies.png)

2. [] Select the following options.

    - **Require a minimum number of reviewers** 
   
        (set the text box **Minimum number of reviewers** to **1**, and check the **Allow requestors to approve their own changes**)
    - **Check for linked work items**
    - **Check for comment resolution**

    ![](Module8-BranchPolicies2.png)

    >Note: Those options will ensure code review for this branch, which is an excellent opportunity to check sensitive portions of the code.

3. [] On the session **Build Validation**, click **+**

    >Configure credential scanners during the manual verification process

    ![](Module8-BranchPolicies3.png)

    Add the following Build Pipelines:
    
    |Pipeline|
    |:--|
    |**DevOps**|
    |**DevSecOps-DAST**|
    |**DevSecOps-SCA**|
    |**DevSecOps-Secure-DevOps-Extension**|
    
    !IMAGE[Module6-BranchPoliciesb.png](Module6-BranchPoliciesb.png)

6. [] On the session **Automatically included reviewers** click **+**

    >Add automatic reviewers for the sensitive portion of the code during the manual verification process.
    
    ![](Module8-BranchPolicies9.png)

    On **Reviewers** type +++@lab.CloudCredential(SSGM3653sharpStakeholderJudDoran).AdministrativeUsername+++  

    On **For pull request affecting these folders** type +++frontend/src/app/oauth/oauth.component.spec.ts+++

    !IMAGE[Module8-BranchPolicies10.png](Module8-BranchPolicies10.png)

    >Note: If you have portions of your code that need more attention, this feature can help you to establish those gates for manual verification

## Exercise 2: Test the secure process with the Pull request

1. [] Navigate to **Boards** --> **Work Items** and click on **New Work Item** and select **Issue** *(if you have a different template select a similar work item)*

    ![](Module8-PullRequest.png)

2. [] On the **Title** type +++Suppress secrets from source code+++, then click **Save**

    Assign the work item to the user *@lab.CloudCredential(SSGM3653sharpStakeholderJudDoran).AdministrativeUsername*

    ![](Module8-PullRequest1.png)


3. [] Click on the **create a branch** link under *Development*

    !IMAGE[Module8-PullRequest1b.png](Module8-PullRequest1b.png)

4. [] Type +++issue/remove-secrets+++ on the name field, then click ***Create Branch***

    !IMAGE[Module8-PullRequest1c.png](Module8-PullRequest1c.png)

5. [] Open the file at +++frontend/src/app/oauth/oauth.component.spec.ts+++ then click **Edit**

    !IMAGE[Module8-PullRequest6.png](Module8-PullRequest6.png)    

6. [] Remove three passwords on lines 85 (two times),92

    Use the shortcuts:
     
    @lab.KeyCombo(ctrl+h)[0x11,72]

    +++bW9jLnRzZXRAdHNldA==+++

    Click on **Commit**

    !IMAGE[Module8-PullRequest7.png](Module8-PullRequest7.png)

    Select the work item **Suppress secrets from source code** then click on**Commit**

    ![](Module8-PullRequest8.png)

7. []  Click on **Create a pull request**

    >This will help to set up the pull request with all the needed information

    !IMAGE[Module8-PullRequest9.png](Module8-PullRequest9.png)

    !IMAGE[Module8-PullRequest9b.png](Module8-PullRequest9b.png)

    Click **Create**

8. [] Wait until all automatic checks pass, including the CredScan

    !IMAGE[Module8-PullRequest10.png](Module8-PullRequest10.png)

    >Note: Include Azure Defender for Cloud in your review process, as some vulnerabilities can only be detected during runtime

    To review Defender for DevOps navigate to:

9. [] Review the Advanced Security settings in the Repos to identify any issues and decide whether to accept or not

    !IMAGE[Module6-GHAS-01.png](instructions173831/Module6-GHAS-01.png)

    Or use the following URL:
    
    +++https://dev.azure.com/Student1-@lab.LabInstance.Id/_git/DevSecOps/alerts?_t=codescanning+++

10. [] Review the Microsoft Defender for Cloud | DevOps security on Azure Portal to identify any issues and decide whether to accept or not

    !IMAGE[Module6-GHAS-02.png](instructions173831/Module6-GHAS-02.png)

    Or use the following URL:

    +++https://portal.azure.com/#view/Microsoft_Azure_Security/SecurityMenuBlade/~/DevOpsSecurity+++
 
9. [] Click **Approve** then click on the button **Complete** if everything is fine.

    !IMAGE[Module8-PullRequest11.png](Module8-PullRequest11.png)

    Click on the button **Complete**

    ![](Module8-PullRequest12.png)

    >Note: Best practice: Complete work items and delete the associated branches. 
    >
    > You can view the branch history for the work item and see who approved the pull request, providing end-to-end traceability.

    ![](Module8-PullRequest12.png)

[Return to list of modules](#modules) 