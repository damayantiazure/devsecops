# Secure DevOps and Web Application Security

**Module 4: Automating a Secure and Compliant Pipeline**

Student Lab Manual

[[_TOC_]]

**Introduction**

**Objectives**

After completing this lab, you will be able to:

- Trigger a build and a deployment of an application

- Secure your application and infrastructure through tooling and
    automation

**Prerequisites**

Completion of the Secure DevOps Prerequisites document.

Completion of the Module 1 Lab, Creating a DevOps Pipeline

**Estimated Time to Complete This Lab**

20 minutes

## Configure Build Pipeline for SonarQube

**Objectives**

After completing this exercise, you will be able to:

- Integrate Static Code Analysis (SCA) into the Azure DevOps Pipeline

**Scenario**

In this exercise, we will use some of the capabilities of SonarCloud.

SonarQube® is an open-source platform developed by SonarSource for
continuous inspection of code quality to perform automatic reviews with
static analysis of code to detect bugs, code smells, and security
vulnerabilities on 20+ programming languages. SonarCloud offers reports
on duplicated code, coding standards, unit tests, code coverage, code
complexity, comments, bugs, and security vulnerabilities. SonarCloud is
the leading product for Continuous Code Quality. It supports all major
programming languages, including C\#, VB .Net, JavaScript, TypeScript,
C/C++ and many more. Integrate it in your on-premise TFS installation,
and continuously track down bugs and vulnerabilities in your codebase.
This extension provides build tasks that you can add in your build
definition. The tool can be integrated for pull-requests to
automatically analyze source code before commits, allowing you to
discover bug or vulnerability early in the process.

## Exercise - 1: Configure a SonarQube Project and configure Quality Gate

1. Access the SonarQube URL provided on the pre-requisites e.g.: http://devsecopsXXXXXsnrdns.eastus.azurecontainer.io:9000

    > Important: The default port for SonarQube is 9000. Copy the DNS name from the created Container Instance in Azure Portal as shown and append :9000 at the end. The final SonarQube URL will be http://YOUR_DNS_NAME:9000
  
    Open a browser and login to the SonarQube Portal using the following credentials-

    > Username= admin, Password= admin

    ![](./images/Module4-AddSonarConfigure02.png =300x)

    > **Note** On the first log-in you will be asked to change the password, take note of your new password

2. Choose `Administration` in the toolbar, click Projects tab and then `Management`.
  
    ![](./images/Module4-sonar_admin.png =800x)

3. Create a project with `Name` and `Key` as `DevSecOps`.

    a) `Name`: Name of the SonarQube project that will be displayed on the web interface.
    b) `Key`: The SonarQube project key that is unique for each project.
    c) Change the `Visibility` option to `Private`.

    ![](./images/Module4-AddSonarConfigure03.png =800x)

    Let us create a Quality Gate to enforce a policy which fails the gate if there are bugs in the code. A Quality Gate is a PASS/FAIL check on a code quality that must be enforced before releasing software.

    Click `Create` then `Close`

4. Click the `Quality Gates` menu and click `Create` in the Quality Gates screen

    Type **DevSecOpsQG** as `Name` for this Quality Gate

    ![](./images/Module4-AddSonarConfigurequalitygate.png =800x)

5. Let us add a condition to check for the number of bugs in the code. Click on `Add Condition`.

   Select `On Overall Code` option

    As `Quality Gate fails when` select **Vulnerabilities**  in the combobox

    On `Value` type **1** and click `Add Condition`.

    ![](./images/Module4-AddSonarConfigure04.png =800x)

    > **Note**: This condition means that if the number of Vulnerabilities in Sonar Analysis is greater than 1 , then the quality gate will fail and optionally this fails the DevOps build.

6. To enforce this quality gate for DevSecOps project, click on `All` under `Projects` section and select the project checkbox.

    ![](./images/Module4-AddSonarConfigure05.png =600x)

7. Navigate to `My Account` then `Security` tab, in the field `Enter Token Name` type `DevSecOps` and click `Generate`, **Copy the generated token in a notepad**.

    ![](./images/Module4-AddSonarConfigure07.png =800x)

    > **Note**: The tokens are used to run analysis or invoke web services without access to the user’s actual credentials.

## Exercise - 2 : Integrate SonarQube in the Build Pipeline

1. Navigate to the `DevSecOps` project created on the Module-0 and click on `Project settings`-->`Service Connection`-->`New Service connectionA`

    ![Edit Release Pipeline](./Images/module2-CreateServiceConnection-1.png =800x)

    In the search type `sonar` and click `Next`

    ![Edit Release Pipeline](./Images/module2-CreateServiceConnection-2.png =400x)

    For Server Url, paste the URL of your SonarQube obtained from the script in Module-0, same Url as previous exercise e.g.: **server URL** (e.g.: http://devsecopsXXXXXsnrdns.eastus.azurecontainer.io:9000)

    ![Edit Release Pipeline](./Images/module2-CreateServiceConnection-3.png =400x)

    Click `Save`

2. Bo back to `Pipelines` and Click on `...` to Edit the pipeline `MyHealthClinicSecDevOps-CICD`

    ![](./Images/Module2-CreateKeyVaultRelease01.png =800x)

3. To configure SonarQube, uncomment (Remove the #) the following lines:

    > **Note**: You can select the text and use the keys `CTRL + K`, `CTRL + U` to uncomment

    **26** to **34** enable the setup configuration for SonarQube

    ![](./images/Module4-AddSonarConfigure08.png  =400x)

    **63** to **65** enable start the SonarQube scanner

    ![](./images/Module4-AddSonarConfigure09.png =300x)

    **67** to **71** To Publish the results of the scanner to the SonarQube instance in Azure

    ![](./images/Module4-AddSonarTask.png =300x)

    Click in `Save`

    ![](./Images/Module2-CreateKeyVaultRelease04.png =600x)

    Click in `Save`

    ![](./Images/Module2-CreateKeyVault06.png =400x)

    > **Note** Once you click save DevOps will trigger a new pipeline to build and release changes, approve and check the results in Pipelines

## Managing Open-source security and licenses with WhiteSource Bolt

**Introduction**

WhiteSource is the leader in continuous open source software security
and compliance management. WhiteSource integrates into your build
process, irrespective of your programming languages, build tools, or
development environments. It works automatically, continuously, and
silently in the background, checking the security, licensing, and
quality of your open source components against WhiteSource
constantly-updated deﬁnitive database of open source repositories.

WhiteSource provides WhiteSource Bolt, a lightweight open source
security and management solution developed specifically for
integration with Azure DevOps and Azure DevOps Server. It works per
project and does not offer real-time alert capabilities like the Full
platform which is generally recommended for larger development teams,
wanting to automate their open source management throughout the entire
software development lifecycle (from the repositories to
post-deployment stages) and across all projects and products.

**Objectives**

After completing this lab, you will be able to:

- Detect and remedy vulnerable open source components.
- Generate comprehensive open source inventory reports per project or build.
- Enforce open source license compliance, including dependencies licenses.
- Identify outdated open source libraries with recommendations to update.

**Prerequisites**

Completion of the Module 1 Lab, Creating a DevOps Pipeline

**Estimated Time to Complete This Lab:**

**10 minutes**

## Exercise - 3 : Activate WhiteSource Bolt**

1. In your Azure DevOps Project, under Pipelines section, go to White
    Source Bolt tab, provide your Work Email, Company Name, Country and
    click Get Started button to start using the Free version.

    ![WhiteBolt Config](./images/Module4-WhiteBoltConfig.png =800x)

    Upon activation, the below message is displayed.
    ![WhiteBolt Confirmation](./images/Module4-WhiteBoltConfigResult.png =600x)

2. Bo back to `Pipelines` and Click on `...` to Edit the pipeline `MyHealthClinicSecDevOps-CICD`

    ![](./Images/Module2-CreateKeyVaultRelease01.png =800x)

3. To configure WhiteSource, uncomment (Remove the #) the following lines:

    > **Note**: You can select the text and use the keys `CTRL + K`, `CTRL + U` to uncomment

    **74** to **76** enable Software Composition Analysis

    ![](./images/Module4-WhiteSourceSrc.png  =400x)

    Click in `Save`

    ![](./Images/Module2-CreateKeyVaultRelease04.png =600x)

    Click in `Save`

    ![](./Images/Module2-CreateKeyVault06.png =400x)

    > **Note** Once you click save DevOps will trigger a new pipeline to build and release changes, approve and check the results in Pipelines

## Secure DevOps Kit for Azure

**Introduction**

In this exercise, we will use some of the capabilities of the Secure DevOps Kit for Azure (AzSK). The Secure DevOps Kit for Azure (AzSK) is a collection of scripts, tools, extensions, automation, etc. that caters to the end to end Azure subscription and resource security needs using extensive automation and smooth integration to native DevOps workflows. Please refer to https://azsk.azurewebsites.net for more details.

**Objectives**

After completing this lab, you will be able to:

-   Detect and remedy vulnerable your Azure Subscription.

**Prerequisites**

Completion of the Module 1 Lab, Creating a DevOps Pipeline

**Estimated Time to Complete This Lab**

10 minutes

### Exercise 4: Release Pipeline

1. Bo back to `Pipelines` and Click on `...` to Edit the pipeline `MyHealthClinicSecDevOps-CICD`

    ![](./Images/Module2-CreateKeyVaultRelease01.png =800x)

2. To configure AzSK, uncomment (Remove the #) the following lines:

    > **Note**: You can select the text and use the keys `CTRL + K`, `CTRL + U` to uncomment

    **74** to **76** enable Software Composition Analysis

    ![AzSK Tool](./images/Module4-AzSKAdd1.png =400x)

    Click in `Save`

    ![](./Images/Module2-CreateKeyVaultRelease04.png =600x)

    Click in `Save`

    ![](./Images/Module2-CreateKeyVault06.png =400x)

    > **Note** Once you click save DevOps will trigger a new pipeline to build and release changes, approve and check the results in Pipelines

### Exercise 5: Remediation

1. Bo back to `Pipelines`, wait until the pipeline completes and click on it

    ![](./Images/Module2-CreateKeyVaultRelease01.png =800x)

2. Click the `...` on the right corner to download all the logs to you
    local machine.

    ![Download Logs](./images/Module4-RemediationCheckDownloadLog.png =800x)

3. After downloading the logs, navigate to the below path and extract
    the AzSK Logs.

    ![Extract logs](./images/Module4-RemediationCheckLogExtract.png =600x)

4. This consists of the Security Report in CSV format and also the
    AutoFix Scripts that you can use to fix the failed Controls that are
    supported.

    ![Download Check](./images/Module4-RemediationCheckDownloadCheck.png =600x)

5. Just for illustration, if you open the file `SecurityRepor...csv` in the Excel you can check for the controls which can be Fixed by the Scripts. 
   In the image below Excel sheet shows only one control that is supported by the AutoFix scripts.

    ![Auto Fix Problems](./images/Module4-RemediationAutoFix.png =600x)

6. Navigate to the `FixControlScripts` folder and check the scripts
    generated in the `Services` folder to see what they do.

    ![Run AutoFix](./images/Module4-RemediationAutoFixRun.png =600x)

> (Optional Functionality may not work due the FixControlScripts being a Preview Feature)

7. Running these scripts are not recommended as part of this lab. Typical remediation paths would include a partnership between the
    Developer and Operations teams to ensure the DEV, TEST, or PROD environments are not impacted by the changes.


