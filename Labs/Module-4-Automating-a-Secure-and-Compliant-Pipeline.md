# Secure DevOps and Web Application Security

**Module 4: Automating a Secure and Compliant Pipeline**

Student Lab Manual

[[_TOC_]]

**Introduction**

**Objectives**

After completing this exercise, you will be able to:

- Integrate Static Application Security Testing into the Azure DevOps Pipeline
- Integrate Static Code Analysis (SCA) into the Azure DevOps Pipeline
- Integrate Security Verification tests for infrastructure
- Integrate Credential Scanners verification on the repos

**Prerequisites**

Completion of the Secure DevOps Prerequisites document.

Completion of the Module 1 Lab, Creating a DevOps Pipeline

**Estimated Time to Complete This Lab**

45 minutes

## Configure Build Pipeline for SonarQube

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
This extension provides build tasks that you can add to your build
definition. The tool can be integrated for pull requests to
automatically analyze source code before commits, allowing you to
discover bugs or vulnerabilities early in the process.

## Exercise - 1: Configure a SonarQube Project and configure Quality Gate

1. Access the SonarQube URL provided on the prerequisites e.g.: http://devsecopsXXXXXsnrdns.eastus.azurecontainer.io:9000

    > Important: The default port for SonarQube is 9000. Copy the DNS name from the created Container Instance in Azure Portal as shown and append :9000 at the end. The final SonarQube URL will be http://YOUR_DNS_NAME:9000
  
    Open a browser and log in to the SonarQube Portal using the following credentials-

    > Username= admin, Password= admin

    ![](./images/Module4-AddSonarConfigure02.png =300x)

    > **Note** On the first log-in, you will be asked to change the password, take note of your new password

2. Choose `Administration` in the toolbar, click on `Projects` tab and then `Management`.
  
    ![](./images/Module4-sonar_admin.png =800x)

3. Create a project with `Name` and `Key` as `DevSecOps`.

    a) `Name`: Name of the SonarQube project that will be displayed on the web interface.
    b) `Key`: The SonarQube project key that is unique for each project.
    c) Change the `Visibility` option to `Private`.

    ![](./images/Module4-AddSonarConfigure03.png =800x)

    Let us create a Quality Gate to enforce a policy that fails the gate if there are bugs in the code. A Quality Gate is a PASS/FAIL check on a code quality that must be enforced before releasing software.

    Click `Create` then `Close`

4. Click the `Quality Gates` menu and click `Create` in the Quality Gates screen

    Type **DevSecOpsQG** as `Name` for this Quality Gate

    ![](./images/Module4-AddSonarConfigurequalitygate.png =800x)

5. Let us add a condition to check for the number of bugs in the code. Click on `Add Condition`.

   Select `On Overall Code` option

    As `Quality Gate fails when` select **Security Review Rating**  in the combo box

    On `Value` select **A** and click `Add Condition`.

    ![](./images/Module4-AddSonarConfigure04.png =800x)

    > **Note**: This condition means that if the number of Vulnerabilities in Sonar Analysis is lower than A, then the quality gate will fail, and optionally this fails the DevOps build.

6. To enforce this quality gate for the DevSecOps project, click on `All` under `Projects` section and select the project checkbox.

    ![](./images/Module4-AddSonarConfigure05.png =600x)

7. Navigate to `My Account` then `Security` tab, in the field `Enter Token Name` type `DevSecOps` and click `Generate`, **Copy the generated token in a notepad**.

    ![](./images/Module4-AddSonarConfigure07.png =800x)

    > **Note**: The tokens are used to run analysis or invoke web services without access to the user’s actual credentials.

## Exercise - 2 : Integrate Static Analysis Security test with SonarQube in the Build Pipeline

1. Navigate to the `DevSecOps` project created on Module-0 and click on `Project settings`-->`Service Connection`-->`New Service connectionA`

    ![Edit Release Pipeline](./Images/module2-CreateServiceConnection-1.png =800x)

    In the search, type `sonar` and click `Next`

    ![Edit Release Pipeline](./Images/module2-CreateServiceConnection-2.png =400x)

    For Server Url, paste the URL of your SonarQube obtained from the script in Module-0, same Url as previous exercise e.g.: **server URL** (e.g.: http://devsecopsXXXXXsnrdns.eastus.azurecontainer.io:9000)

    ![Edit Release Pipeline](./Images/module2-CreateServiceConnection-3.png =400x)

    Click `Save`

2. Go back to `Pipelines` and Click on `New Pipeline` to configure the pipeline `azure-pipelines-SAST.yml`

    ![](./Images/Module4-UsingSAST1.png =800x)

    Select `Azure Repos Git YAML`

    ![](./Images/Module2-CreateKeyVaultRelease01b.png =800x)

    Select `MyHealthClinicSecDevOps-Public`

    ![](./Images/Module2-CreateKeyVaultRelease01c.png =800x)

    On the bottom of the list, select `Existing Azure Pipelines YAML file`

    ![](./Images/Module2-CreateKeyVaultRelease01d.png =800x)

    Select `/azure-pipelines-SAST.yml` then click `Continue`

    ![](./Images/Module2-CreateKeyVaultRelease01e.png =800x)

3. Explore SonarQube. This tool is composed of 3 sections:

    The following task enables the setup configuration for SonarQube

    ![](./images/Module4-AddSonarConfigure08.png  =400x)

    The following task enable the start of the SonarQube scanner

    ![](./images/Module4-AddSonarConfigure09.png =300x)

    The following task publish the results of the scanner to the SonarQube instance in Azure

    ![](./images/Module4-AddSonarTask.png =300x)

    Click in `Run`

    ![](./Images/Module2-CreateKeyVaultRelease04.png =600x)

4. Back to Pipelines, rename the pipeline `MyHeathClinicSecDevOps-Pulic` to `MyHeathClinicSecDevOps-SAST`

    ![](./images/Module4-AddSonarConfigure10.png  =800x)

    On **Name** text box type `MyHeathClinicSecDevOps-SAST` then click `Save`

    ![](./images/Module4-AddSonarConfigure11.png  =800x)

5. Back to Pipelines, Wait until the end of the execution of `MyHeathClinicSecDevOps-SAST`, click on it the view the results and click on `Extension` to check the result of `SonarQube Analysis Report`. Click on the link `Detailed SonarQube report >`

     ![](./images/Module4-AddSonarConfigure12.png  =800x)

    If you have multiple executions, click on the most recent (first on that list)

    ![](./images/Module4-AddSonarConfigure13.png  =800x)

    View the detailed report on SonarQube Portal, click on on the link `Detailed SonarQube report >`

    ![](./images/Module4-AddSonarConfigure14.png  =800x)

    Review the report and discuss with your instructor the report from SonarQube

    ![](./images/Module4-AddSonarConfigure15.png  =800x)

## Managing Open-source security and licenses with WhiteSource Bolt

**Introduction**

WhiteSource is the leader in continuous open source software security
and compliance management. WhiteSource integrates into your build
process, irrespective of your programming languages, build tools, or
development environments. It works automatically, continuously, and
silently in the background, checking the security, licensing, and
quality of your open source components against WhiteSource
constantly updated deﬁnitive database of open source repositories.

WhiteSource provides WhiteSource Bolt, a lightweight open-source
security and management solution developed specifically for
integration with Azure DevOps and Azure DevOps Server. It works per
project and does not offer real-time alert capabilities like the Full
the platform, which is generally recommended for larger development teams,
wanting to automate their open source management throughout the entire
software development lifecycle (from the repositories to
post-deployment stages) and across all projects and products.

## Exercise - 3 : Activate WhiteSource Bolt**

1. In your Azure DevOps Project, under the Pipelines section, go to White
    Source Bolt tab, provide your Work Email, Company Name, Country and
    click `Get Started` button to start using the Free version.

    ![WhiteBolt Config](./images/Module4-WhiteBoltConfig.png =800x)

    Upon activation, the below message is displayed.

    ![WhiteBolt Confirmation](./images/Module4-WhiteBoltConfigResult.png =600x)

2. Go back to `Pipelines` and Click on `New Pipeline` to configure the pipeline `azure-pipelines-SCA.yml`

    ![](./Images/Module4-UsingSCA1.png =800x)

    Select `Azure Repos Git YAML`

    ![](./Images/Module2-CreateKeyVaultRelease01b.png =800x)

    Select `MyHealthClinicSecDevOps-Public`

    ![](./Images/Module2-CreateKeyVaultRelease01c.png =800x)

    On the bottom of the list, select `Existing Azure Pipelines YAML file`

    ![](./Images/Module2-CreateKeyVaultRelease01d.png =800x)

    Select `/azure-pipelines-SCA.yml` then click `Continue`

    ![](./Images/Module2-CreateKeyVaultRelease01.png =800x)

3. Explore SCA pipeline. This tool is composed of 1 section:

    The following task Scan for Third-Party components vulnerabilities and Licences

    Click in `Run`

    ![](./images/Module2-UsingSCAPipeline.png  =800x)

4. Wait until the end of the execution of the pipeline and then click on `WhiteSource Bolt Build Report` tab

    Review the report and discuss with your instructor the report from WhiteSource

    - Check the number of vulnerabilities
    - Check the number of licences among all the open-source components
  
    ![](./images/Module2-UsingSCAPipeline2.png  =800x)

5. Back to Pipelines, rename the pipeline `MyHeathClinicSecDevOps-Pulic` to `MyHeathClinicSecDevOps-SCA`

    ![](./images/Module2-UsingSCAPipeline3.png  =800x)

    On **Name** text box type `MyHeathClinicSecDevOps-SCA` then click `Save`

    ![](./images/Module2-UsingSCAPipeline4.png  =500x)

## Secure DevOps Kit for Azure

**Introduction**

In this exercise, we will use some of the capabilities of the Secure DevOps Kit for Azure (AzSK). The Secure DevOps Kit for Azure (AzSK) is a collection of scripts, tools, extensions, automation, etc., that caters to the end-to-end Azure subscription and resource security needs using extensive automation and smooth integration to native DevOps workflows. Please refer to https://azsk.azurewebsites.net for more details.

## Exercise 4: Search for security vulnerabilities on the Infrastrucure

1. Go back to `Pipelines` and Click on `New Pipeline` to configure the pipeline `azure-pipeline-AzSK.yml`

    ![](./Images/Module4-UsingSCA1.png =800x)

    Select `Azure Repos Git YAML`

    ![](./Images/Module2-CreateKeyVaultRelease01b.png =800x)

    Select `MyHealthClinicSecDevOps-Public`

    ![](./Images/Module2-CreateKeyVaultRelease01c.png =800x)

    On the bottom of the list, select `Existing Azure Pipelines YAML file`

    ![](./Images/Module2-CreateKeyVaultRelease01d.png =800x)

    Select `/azure-pipeline-AzSK.yml` then click `Continue`

    ![](./Images/Module4-UsingAzSK2.png =800x)

2. Explore AzSK pipeline. This tool is composed of 1 section:

    The following task Scan the infrastructure for drifts regarding security

    Click in `Run`

    ![](./images/Module4-UsingAzSK3.png  =800x)

3. Wait until the end of the execution, then click the `...` on the right corner to download all the logs to you
    local machine.

    ![Download Logs](./images/Module4-RemediationCheckDownloadLog.png =800x)

4. After downloading the logs, open the zip file and navigate to the below path and extract
    the AzSK Logs.

    ![Extract logs](./images/Module4-RemediationCheckLogExtract.png =600x)

5. This consists of the Security Report in CSV format and other support/log files.

    ![Download Check](./images/Module4-RemediationCheckDownloadCheck.png =600x)

    > (Optional Functionality may not work due to the FixControlScripts being a Preview Feature)

6. Open the file `SecurityRepor...csv` with **Visual Studio Code** to get more details on the security issues found during the analysis.

    ![Auto Fix Problems](./images/Module4-RemediationAutoFix.png =800x)

    Right-click on the tab with the file open and click on `Open Preview`

    ![Run AutoFix](./images/Module4-RemediationAutoFixRun.png =800x)

    Explore the description and recommendation columns

    ![Run AutoFix](./images/Module4-RemediationAutoFixRun2.png =800x)

7. Back to Pipelines, rename the pipeline `MyHeathClinicSecDevOps-Pulic` to `MyHeathClinicSecDevOps-Scan-Infra`

    ![](./Images/Module4-UsingAzSK4.png  =800x)

    On **Name** text box type `MyHeathClinicSecDevOps-Scan-Infra` then click `Save`

    ![AzSK Tool](./images/Module4-AzSKAdd1.png =600x)

## Scan for Credentials stored on the repositories

**Introduction**

The detect-secrets tool is an open source project that uses heuristics and rules to scan for a wide range of secrets. We can extend the tool with custom rules and heuristics via a simple Python plugin API.

Unlike other credential scanning tools, detect-secrets does not attempt to check a project's entire git history when invoked, but instead scans the project's current state. This means that the tool runs quickly, which makes it ideal for use in continuous integration pipelines.

detect-secrets employs the concept of a "baseline file", i.e. a list of known secrets already present in the repository, and we can configure it to ignore any of these pre-existing secrets when running. This makes it easy to gradually introduce the tool into a pre-existing project.

The baseline file also provides a simple and convenient way of handling false positives. We can white-list the false positive in the baseline file to ignore it on future invocations of the tool.

However, unlike other similar packages that solely focus on finding secrets, this package is designed with the enterprise client in mind: providing a backwards-compatible, systematic means of:

1. Preventing new secrets from entering the code base,
2. Detecting if such preventions are explicitly bypassed, and
3. Providing a checklist of secrets to roll, and migrate off to more secure storage.

## Exercise 5: Search for credentials on the repo

1. Go back to `Pipelines` and Click on `New Pipeline` to configure the pipeline `azure-pipeline-CredScan.yml`

    > Note!, this pipeline will fail because there's a bunch of credentials on the source code

    ![](./Images/Module4-UsingSCA1.png =800x)

    Select `Azure Repos Git YAML`

    ![](./Images/Module2-CreateKeyVaultRelease01b.png =800x)

    Select `MyHealthClinicSecDevOps-Public`

    ![](./Images/Module2-CreateKeyVaultRelease01c.png =800x)

    On the bottom of the list, select `Existing Azure Pipelines YAML file`

    ![](./Images/Module2-CreateKeyVaultRelease01d.png =800x)

    Select `/azure-pipeline-CredScan.yml` then click `Continue`

    ![](./Images/Module4-UsingDetectCredentials.png =800x)

2. Explore the CredScan pipeline and run the pipeline:

    This task uses Command-line tools to download the latest version of the open-source and then scan our repo

    Click in `Run`

    ![](./images/Module4-UsingDetectCredentials2.png  =800x)

    Wait until the end of the execution and check the pipeline will fail

    Click on `1 published` link

    ![](./images/Module4-UsingDetectCredentials3.png  =800x)

    Expand detect-secrets section then download the `detect=secrets.json` file

    Open the file on Visual Studio code

    ![](./images/Module4-UsingDetectCredentials4.png  =800x)

    Go to line 115 and observe that the password used on the Lab Module 1 was caught by this tool

    ![](./images/Module4-UsingDetectCredentials5.png  =800x)

    >Note: Sometimes the tool will find some false-positive cases. You can manage those cases using the baseline file, more information on:
    >
    > <a href="https://github.com/Yelp/detect-secrets" target="_blank">https://github.com/Yelp/detect-secrets</a>

3. Back to Pipelines, rename the pipeline `MyHeathClinicSecDevOps-Pulic` to `MyHeathClinicSecDevOps-CredScan`

    ![](./images/Module4-UsingDetectCredentials6.png  =800x)

    On **Name** text box type `MyHeathClinicSecDevOps-CredScan` then click `Save`

    ![](./images/Module4-UsingDetectCredentials7.png =500x)
