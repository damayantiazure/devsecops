---
title: Secure DevOps and Web Application Security
---

# Secure DevOps and Web Application Security

Module 2 - Credentials Management in Pipeline Lab

Student Lab Manual

Instructor Edition

**Conditions and Terms of Use**

**Microsoft Confidential**

This training package is proprietary and confidential and is intended
only for uses described in the training materials. Content and software
is provided to you under a Non-Disclosure Agreement and cannot be
distributed. Copying or disclosing all or any portion of the content
and/or software included in such packages is strictly prohibited.

The contents of this package are for informational and training purposes
only and are provided \"as is\" without warranty of any kind, whether
express or implied, including but not limited to the implied warranties
of merchantability, fitness for a particular purpose, and
non-infringement.

Training package content, including URLs and other Internet Web site
references, is subject to change without notice. Because Microsoft must
respond to changing market conditions, the content should not be
interpreted to be a commitment on the part of Microsoft, and Microsoft
cannot guarantee the accuracy of any information presented after the
date of publication. Unless otherwise noted, the companies,
organizations, products, domain names, e-mail addresses, logos, people,
places, and events depicted herein are fictitious, and no association
with any real company, organization, product, domain name, e-mail
address, logo, person, place, or event is intended or should be
inferred.

**Copyright and Trademarks**

© 2019 Microsoft Corporation. All rights reserved.

Microsoft may have patents, patent applications, trademarks, copyrights,
or other intellectual property rights covering subject matter in this
document. Except as expressly provided in written license agreement from
Microsoft, the furnishing of this document does not give you any license
to these patents, trademarks, copyrights, or other intellectual
property.

Complying with all applicable copyright laws is the responsibility of
the user. Without limiting the rights under copyright, no part of this
document may be reproduced, stored in or introduced into a retrieval
system, or transmitted in any form or by any means (electronic,
mechanical, photocopying, recording, or otherwise), or for any purpose,
without the express written permission of Microsoft Corporation.

For more information, see Use of Microsoft Copyrighted Content at

<http://www.microsoft.com/en-us/legal/intellectualproperty/Permissions/default.aspx>

DirectX, Hyper-V, Internet Explorer, Microsoft, Outlook, OneDrive, SQL
Server, Windows, Microsoft Azure, Windows PowerShell, Windows Server,
Windows Vista, and Zune are either registered trademarks or trademarks
of Microsoft Corporation in the United States and/or other countries.
Other Microsoft products mentioned herein may be either registered
trademarks or trademarks of Microsoft Corporation in the United States
and/or other countries. All other trademarks are property of their
respective owners.

[[_TOC_]]

## Lab 1: Configure secrets your Azure DevOps Pipelines

**Introduction**

The development team want to integrate bests practices in credential management and avoid passwords 
stored in source control and the system.

The requirement is that the SecInfo team can specify new passwords and certificates in a centralized system.
This lab gives you a safe way to store and consume credentials from the Azure Key Vault.

**Objectives**

After completing this lab, you will be able to:

  - Configure an Azure Key Vault in Azure DevOps Pipeline

  - Secure your application with a secret management safe and reliable

**Prerequisites**

Completion of the Module 1: Creating a DevOps Pipeline.

**Estimated Time to Complete This Lab**

30 minutes

## Set up security in Pipelines

**Objectives**

After completing this exercise, you will be able to:

  - Configure Key Vault in Azure DevOps pipeline

**Scenario**

In this exercise, you will configure a Build Pipeline and Release that will
get Passwords from a KeyVault and publish artifacts for the Release Pipeline to deploy in production.

## Exercise 1: Set up Approvals in your Service Connection

1. In Azure DevOps, Navigate to `Project Settings`-->`Service connections` and click in your Service connections created to deploy to Azure Infrastructure e.g.:

    ![](./Images/Module2-SecurityPipeline-01.png  =800x)

    In the the  `...` top right then `Approvals and checks`

    ![](./Images/Module2-SecurityPipeline-02.png  =800x)

    Click  `Approvals`

    ![](./Images/Module2-SecurityPipeline-03.png  =600x)

2. In the Approvals you can configure the group or the person that will approve any usage of this Environment.

    Add your name to the approvals list then click `Create`

    ![](./Images/Module2-SecurityPipeline-04.png  =400x)

    > Each environment can have different security approvals

## Exercise 2: Set up Approvals for environments

1. In Azure DevOps, Navigate to `Pipelines`-->`Environments` and click in `New environment` top right corner.

    > Environments are created by YAML pipelines and by Default don't have approvals

    ![](./Images/Module2-SecurityPipeline-05.png  =800x)

    For the name type **MyClinicSecOps-Prod**, then click on `Create`

    ![](./Images/Module2-SecurityPipeline-06.png  =400x)

    Click on `...` top right corner and then `Approvals and checks`

    ![](./Images/Module2-SecurityPipeline-07.png  =600x)

    Click  `Approvals`

    ![](./Images/Module2-SecurityPipeline-03.png  =600x)

2. In the Approvals you can configure the group or the person that will approve any usage of this Environment.

    Add your name to the approvals list then click `Create`

    ![](./Images/Module2-SecurityPipeline-04.png  =400x)

    > Each environment can have their own approvals and check

## Exercise 3: Link Azure Key Vault to Azure DevOps Pipeline

1. In Azure DevOps, Navigate to `Pipelines`-->`Library` and click **+ Variable group**

    ![Key vault](./Images/Module2-CreateKeyVault01.png  =600x)

2. In the field `Variable group name` type `SecurityKeyVault`, then

    a) Switch the `Link secrets from Azure key vault as variables` to On.

    b) Select your `Azure Pass - Sponsorship`.

    c) Select your Azure Key Vault and click in `Authorize` button.

    > If asked login in with the same account you used for Azure Pass

    ![Key vault](./Images/Module2-CreateKeyVault02.png =800x)

3. Click on `+ Add` in the current page, select `SQLpassword` and click `Ok`

    ![Key vault](./Images/Module2-CreateKeyVault03.png =600x)

    Click on `Save` 

     ![Key vault](./Images/Module2-CreateKeyVault04.png =400x)

4. Go Back to Library open the `DevSecOpsVariables` variable group, and delete the variable named `SQLpassword` in the list.

    ![Key vault](./Images/Module2-CreateKeyVault05.png =800x)

    Click on `Save`

## Exercise 4: Configure the YAML Pipeline to use the New Key Vault and the new Environment

1. Bo back to `Pipelines` and Click on `...` to Edit the pipeline `MyHealthClinicSecDevOps-CICD`

    ![](./Images/Module2-CreateKeyVaultRelease01.png =800x)

2. Uncomment (Remove the #) the line **14** to enable the usage of the new variable group that comes from Azure Key Vault

    > **Note**: You can select the text and use the keys `CTRL + K`, `CTRL + U` to uncomment

    With this new variable group the password for the database comes from Azure Key Vault

    ![](./Images/Module2-CreateKeyVaultRelease02.png =800x)

3. Uncomment (Remove the #) all lines from **216**  to **261** to enable the deployment on the Production environment

    > **Note**: You can select the text and use the keys `CTRL + K`, `CTRL + U` to uncomment

    ![](./Images/Module2-CreateKeyVaultRelease03.png =800x)

    Click in `Save`

    ![](./Images/Module2-CreateKeyVaultRelease04.png =600x)

    Click in `Save`

    ![](./Images/Module2-CreateKeyVault06.png =400x)

    > **Note** Once you click save DevOps will trigger a new pipeline to build and release changes

## Exercise 5: Approve the usage of the Service Connections and the Production

1. Bo back to `Pipelines` and Click on `MyHealthClinicSecDevOps-CICD`

    ![](./Images/Module2-CreateKeyVault07.png =700x)

    Click on the pending deployment

    ![](./Images/Module2-CreateKeyVault08.png =700x)

    Click `Review`

    ![](./Images/Module2-CreateKeyVault09.png =800x)

    > **Note** Since all stages use the `service connection` the pipeline will wait until the approval for that resource

    Click `Approve`

    ![](./Images/Module2-CreateKeyVault10.png =400x)

    Repeat the approval for the Stage development.

2. Approve the deployment for **Production** environment

    > **Note** Since the production uses 2 resources that need approvals, you should check both

    > Click in `Review`

    ![](./Images/Module2-CreateKeyVault11.png =800x)

    > **Note** The next scree shows the two resources used in this pipeline that requires approvals

    Click `Approve`

    ![](./Images/Module2-CreateKeyVault12.png =400x)

3. Wait for the release to be completed and confirm that the website is still running, but now with passwords coming from Azure Key Vault.

    ![](./Images/Module1-AzureResultAKSShowPortsAKS_Site.png =800x)

    > If you want, Use the credentials Username: `user` and Password: `P2ssw0rd@1` to login to the HealthClinic web application.

    ![](./Images/Module1-NavigateSite.png =800x)