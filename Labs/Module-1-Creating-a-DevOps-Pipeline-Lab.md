---
title: Secure DevOps and Web Application Security
---

# Secure DevOps and Web Application Security

Module 1: Creating a DevOps Pipeline

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

## Lab 1: Configure your Azure DevOps Pipelines

**Introduction**

This lab uses a Docker-based ASP.NET Core web application -
MyHealthClinic (MHC). The application will be deployed to a WebApp for Containers Service using Azure DevOps.

The MHC application will be accessible in the mhc-front end pod along
with the Load Balancer. We use this base environment to learn how to
secure an application and infrastructure by adopting a range of tools.

**Objectives**

After completing this lab, you will be able to:

  - Configure an Azure DevOps Pipeline

  - Trigger a build and a deployment of an application

  - Secure your application and infrastructure through tooling and
    automation

**Prerequisites**

Completion of the Secure DevOps prerequisites lab in Module 0 - Secure DevOps - Prerequisites

**Estimated Time to Complete This Lab**

30 minutes

## Configure your Configure Build Pipeline

**Objectives**

After completing this exercise, you will be able to:

  - Configure an Azure DevOps pipeline

**Scenario**

In this exercise, you will configure a Build Pipeline that will
eventually publish artifacts for the Release Pipeline to consume.

## Exercise 1: Setup Parallel MS Hosted Job and Service Connections

1. Navigate to the Azure DevOps organization you created in Module 0.
    The link will look similar to ``https://dev.azure.com/<your organization>``

    At your organizations home page, navigate to the bottom left corner of the page.
    Click on `Organization Settings` 

    ![Modify Organization Settings](./Images/Module-1-OrgSettings.png =800x)

2.  Navigate to the `Billing` area under `General`. Select `Set up billing`.

    ![Modify Organization Settings](./Images/Module-1-BillingOption.png =800x)

3. In Change billing, under `Select an Azure subscription` choose `Azure Pass Subcription`.
    Save your changes by selecting `Save`

    ![Modify Organization Settings](./Images/Module-1-ChangeBilling.png =300x)

4. In the `Paid parallel jobs` box for `MS Hosted CI/CD`, enter the value 1.
    This will provide you with one paid parallel job, which will be charged to your Azure Pass. 

    ![Modify Organization Settings](./Images/Module-1-ParallelJob.png =800x)

    Click on `Save`

5. Navigate to the `DevSecOps` project created on the Module-0 and click on `Project settings`-->`Service Connection`-->`Create Service Connection`

    ![Edit Release Pipeline](./Images/CreateServiceConnection-01.png =800x)

6. Select `Azure Resource Manager` then click on `Next`

    ![Edit Release Pipeline](./Images/CreateServiceConnection-04.png =400x)

   Select `Service principal (automatic)` then click on `Next`

    ![Edit Release Pipeline](./Images/CreateServiceConnection-02.png =400x)

7. Select the subscription `Azure Pass - Sponsorship` with the ID that you got on the Module-0. For **Service connection name** paste the `Subscription ID` that you got on the Module-0

    ![Edit Release Pipeline](./Images/CreateServiceConnection-03.png =400x)

    Click `Save`

8. Navigate to Pipelines and Edit the pipeline `MyHealthClinicSecDevOps-CICD`

    ![Edit Release Pipeline](./Images/CreateServiceConnection-05.png =800x)

9. Explore the YAML pipeline and observe how it is parametrized, then click `Run`

    ![Edit Release Pipeline](./Images/CreateServiceConnection-06.png =800x)

    Click `Run`

    ![Edit Release Pipeline](./Images/CreateServiceConnection-07.png =400x)

## Exercise 2: Confirm de deployment in Azure

1. Wait until the pipeline complete the execution.

    ![Edit Release Pipeline](./Images/CreateServiceConnection-08.png =800x)

2. Once the `Deploy solution` stage is completed, navigate to the portal Azure **http://portal.azure.com**, then open the `App Service` **devsecopsdemoappxxxxxt10** inside the resource group **devsecopsxxxxx-rg**

    ![](./Images/Module1-WebPppDemo.png =800x)

3. In the overview menu, click on the URL link to navigate to the website

    ![](./Images/Module1-WebPppDemo2.png =800x)

    ![](./Images/Module1-AzureResultAKSShowPortsAKS_Site.png =800x)

    > If you want, Use the credentials Username: `user` and Password: `P2ssw0rd@1` to login to the HealthClinic web application.

    ![](./Images/Module1-NavigateSite.png =800x)