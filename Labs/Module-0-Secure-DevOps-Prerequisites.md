---
title: Secure DevOps and Web Application Security
---

Lab instructions for `Workshop Plus: Secure DevOps`  

**Secure DevOps - Prerequisites:**

`Azure DevOp Organization` and `Pipeline` setup


**Conditions and Terms of Use**

**Microsoft Confidential**

This training package is proprietary and confidential and is intended only for uses described in the training materials. Content and software is provided to you under a Non-Disclosure Agreement and cannot be distributed. Copying or disclosing all or any portion of the content and/or software included in such packages is strictly prohibited.

The contents of this package are for informational and training purposes only and are provided "as is" without warranty of any kind, whether express or implied, including but not limited to the implied warranties of merchantability, fitness for a particular purpose, and non-infringement.

Training package content, including URLs and other Internet Web site references, is subject to change without notice. Because Microsoft must respond to changing market conditions, the content should not be interpreted to be a commitment on the part of Microsoft, and Microsoft cannot guarantee the accuracy of any information presented after the date of publication. Unless otherwise noted, the companies, organizations, products, domain names, e-mail addresses, logos, people, places, and events depicted herein are fictitious, and no association with any real company, organization, product, domain name, e-mail address, logo, person, place, or event is intended or should be inferred.

**Copyright and Trademarks**
© 2019 Microsoft Corporation. All rights reserved.

Microsoft may have patents, patent applications, trademarks, copyrights, or other intellectual property rights covering subject matter in this document. Except as expressly provided in written license agreement from Microsoft, the furnishing of this document does not give you any license to these patents, trademarks, copyrights, or other intellectual property.

Complying with all applicable copyright laws is the responsibility of the user. Without limiting the rights under copyright, no part of this document may be reproduced, stored in or introduced into a retrieval system, or transmitted in any form or by any means (electronic, mechanical, photocopying, recording, or otherwise), or for any purpose, without the express written permission of Microsoft Corporation. 
For more information, see Use of Microsoft Copyrighted Content at  
http://www.microsoft.com/en-us/legal/intellectualproperty/Permissions/default.aspx

DirectX, Hyper-V, Internet Explorer, Microsoft, Outlook, OneDrive, SQL Server, Windows, Microsoft Azure, Windows PowerShell, Windows Server, Windows Vista, and Zune are either registered trademarks or trademarks of Microsoft Corporation in the United States and/or other countries. Other Microsoft products mentioned herein may be either registered trademarks or trademarks of Microsoft Corporation in the United States and/or other countries. All other trademarks are property of their respective owners.
<br><br>

**Prerequisites**

- Edge Chromium or Chrome
- Recomended a new @outlook or @hotmail account, e.g: DevSecOpsYourName@outlook.com at https://account.microsoft.com using a InPrivate/Incognito browser Window

    ![](images/CreateOutlookAcc00.png =300x)

**Overview**
In this pre-work module (lab 2 of 2) you will setup your `Azure DevOps` environment including the initial `Build Pipeline` and `Release Pipeline`.
- Azure DevOps organization and project
- Clone the source repo into the azure DevOps project
- Create and test initial build pipeline
- Create and test initial release pipleine

[[_TOC_]]

### Exercise 1 : Get you free Azure Subscription

> Please Note: You will not need to perform this step if you have already redeemed your Azure Pass

1. Navigate to http://aka.ms/azurepass and use the Promo code located in your VM

    ![](images/CreateAzurePass02.png =600x)
    ![](images/CreateAzurePass01.png =800x)

    Click Claim

    ![](images/CreateAzurePass03.png =600x)

2. Fill all fields and click Next

    ![](images/CreateAzurePass04.png =600x)

3. Accept the terms and click ``Sign up``

    ![](images/CreateAzurePass05.png =600x)
  
> `Attention`
>
> **This process will take about 15 minutes, don't refresh your screen!**
> ---

### Exercise 2 :Create an Azure DevOps

1. Navigate to https://dev.azure.com/ Click `Start Free`

    ![](images/CreateDevOpsAcc00.png =500x)

2. Select **United States** for Country/Region and Login with your new Microsoft account and Select `Continue`

    ![](images/CreateDevOpsAcc01.png =300x)

3. In your new Organization, create a **Personal Access Token (PAT)**. Navigate to `Security` or `User Settings`

    ![](images/CreateDevOpsAcc10.png =400x)

    Click `+ New Token`

    ![](images/CreateDevOpsAcc11.png =300x)

4. Name the Personal Access Token (PAT) as `DevSecOps`, select Full access and click `Create`

   ![](images/CreateDevOpsAcc12.png =500x)


    ![](images/CreateDevOpsAcc13.png =400x)

   > **``IMPORTANT !``** **Save** your new Personal Access Token (PAT) key in a notepad for next exercises

### Exercise 3 : Create the Infrastructure in Azure

1. Open the new Windows Terminal, Run as Administrator :

    ![](images/poweshell-runcommand.png =800x)

    > run the following commands, IF asked, for the following command answer with A for `[A] Yes to All`

    ```powershell
    Set-ExecutionPolicy Unrestricted -Scope Process -Force
    ```

    ```powershell
    Invoke-WebRequest 'https://aka.ms/DevSecOpsSetupFile' -UseBasicParsing -OutFile .\IaC-AzureEnvCreation.ps1
    ```

    ```powershell
    .\IaC-AzureEnvCreation.ps1
    ```

    **The script will request you Personal Access Token generated on the Exercice 1 and the DevOps Organization URL**

    URL DevOps with your organization name (e.g. https://dev.azure.com/myorg)

    ![](images/CreateDevOpsAcc15.png =800x)

    Exection of the script

    ![](images/poweshell-runcommand2.png =800x)

    **The script will take about 15 minutes to execute.**
    **If any task fails during the execution of the script, feel free to run the script again. The script is able to create any missing artifacts.**
    **Script failures typically use red lettering unless you changed the CLI color scheme**

    ![](images/CreateDevOpsAcc16.png =800x)

    > Optional
    >
    > You can navigate to https://portal.azure.com in the resource group DevSecOps-xxxxx-RG and see all resources created to the workshop
    >
    > Explore as well the new repo created in your Organization-->Project named MyHealthClinicSecDevOps-Public in https://dev.azure.com 