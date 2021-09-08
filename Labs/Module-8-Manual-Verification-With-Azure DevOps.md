# Secure DevOps and Web Application Security

**Module 8: Implementing manual verification using Azure DevOps**

Student Lab Manual

[[_TOC_]]

**Introduction**

**Objectives**

After completing this lab, you will be able to:

- Implement Manual verification across the development life cycle
- Make the life of the reviewer easier with build verification
- Implement a pull request process

**Pre-requisites**

Completion of the Secure DevOps Prerequisites document.

Completion of the Module 4 Lab, Automating a Secure and Compliant Pipeline

**Estimated Time to Complete This Lab**

45 minutes

**Configure branch policy and bests practices**

**Overview**

Pull requests let your team give feedback on changes in feature branches before merging the code into the master branch. Reviewers can step through the proposed changes, leave comments, and vote to approve or reject the code. Azure DevOps provides a rich experience for creating, reviewing, and approving pull requests.

This process is an important place to add security inside the pull request process.

## Exercise - 1: Configure branch policies and automation to help the manual process

1. Navigate to `Repos` --> `Branches` and click on `Lock` on the master branch. This will block any direct updates. Then Click on `Branch policies`

    ![](./images/Module8-BranchPolicies.png =800x)

    > **Note** On the first log-in, you will be asked to change the password, take note of your new password

2. Select the following options.

    1. `Require a minimum number of reviewers` 
   
        (set the text box `Minimum number of reviewers` to `1`, and check the `Allow requestors to approve their own changes`)
    2. `Check for linked work items`
    3. `Check for comment resolution`

    ![](./images/Module8-BranchPolicies2.png =800x)

    >Note: Those options will ensure code review for this branch, and it is an excellent opportunity to check sensitive portions of the code.

3. Configure credential scanners during the manual verification process. on the bottom of the page on the `Build Validation` click `+`

    ![](./images/Module8-BranchPolicies3.png =800x)

    On `Build pipeline *` select **MyHeathClinicSecDevOps-CredScan** then click save

    ![](./images/Module8-BranchPolicies4.png =800x)

4. Verify if there are no drifts coming from the Dev environment during the manual verification process. on the bottom of the page on the `Build Validation` click `+`

    ![](./images/Module8-BranchPolicies5.png =500x)

    On `Build pipeline *` select **MyHeathClinicSecDevOps-Scan-Infra** then click `Save`

    ![](./images/Module8-BranchPolicies6.png =800x)

5. Update the verification for the third-party components during the manual verification process. on the bottom of the page on the `Build Validation` click `+`

    ![](./images/Module8-BranchPolicies7.png =500x)

    On `Build pipeline *` select **MyHeathClinicSecDevOps-SCA** then click `Save`

    ![](./images/Module8-BranchPolicies8.png =800x)

    >Note: We will NOT add the SAST pipeline because the version of the SonarQube free don't allow verifications during the pull requests process and only work for Master/Main Branches

6. Add automatic reviewers for the sensitive portion of the code during the manual verification process. on the bottom of the page on the `Automatically included reviewers` click `+`

    ![](./images/Module8-BranchPolicies9.png =500x)

    On `Reviewers` select your e-mail/name

    On `For pull request affecting these folders` type **/test/MyHealth.API.IntegrationTests/appsettings.json**

    ![](./images/Module8-BranchPolicies10.png =800x)

    >Note: If you have portions for your code that need more attention, this feature can help you to establish those gates for manual verification

## Exercise - 2: Test the secure process with the Pull request

1. Navigate to `Boards` --> `Branches` and click on `new Work Item` and select `Issue` *(if you have a different template select a similar work item)*

    ![](./images/Module8-PullRequest.png =800x)

2. On the `Title` type **Suppress secrets from source code**, then click `Save`

    Assign the work item to your user

    ![](./images/Module8-PullRequest1.png =800x)

3. Associate this work item with the work in progress on the branch `issue/remove-secrets`

    Click on `Add link` on `Development` session

    On the box `Branch`, select the branch `issue/remove-secrets`, then click `OK`

    ![](./images/Module8-PullRequest2.png =800x)

    Click `Save` then click `Create a pull request`

    ![](./images/Module8-PullRequest3.png =800x)

4. Navigate to `Repos`-->`Files` Select `MyHealthClinicSecDevOps-Public`

    ![](./images/Module8-PullRequest4.png =800x)

    Open the file at `test/MyHealth.API.IntegrationTests/appsettings.json`

    ![](./images/Module8-PullRequest5.png =800x)

5. switch to the branche `issue/remove-secrets` then click `Edit`

    ![](./images/Module8-PullRequest6.png =800x)

    Set the  `DefaultPassword` to `""`

    Set the  `DefaultAdminPassword` to `""`

    Click on `Commit`

    ![](./images/Module8-PullRequest7.png =800x)

    Select the work item `Suppress secrets from source code` then click on`Commit`

    ![](./images/Module8-PullRequest8.png =500x)

    Select the work item `Suppress secrets from source code` then click on`Commit`

    ![](./images/Module8-PullRequest8.png =500x)

    Click on `Suppress secrets from source code` link to navigate to the open Pull request

    ![](./images/Module8-PullRequest9.png =800x)

6. Wait until all automatic checks pass, including the CredScan, then click `Approve`

    > NOTE! since we are changing the file **/test/MyHealth.API.IntegrationTests/appsettings.json**, your user name is already added as reviewers required.
    >
    > You probably already received an e-mail with the approval request

    ![](./images/Module8-PullRequest10.png =800x)

    Click on the button `Complete`

    ![](./images/Module8-PullRequest11.png =800x)

    Click on the button `Complete`

    ![](./images/Module8-PullRequest12.png =500x)

    >NOTE!: It's a good practice to complete the work item and delete the work branch
    >
    >you can always check from the history of the work item which branch the changes come from
    > 
    >who approved the pull-request, and have the traceability end-to-end from this process

     ![](./images/Module8-PullRequest12.png =500x)
