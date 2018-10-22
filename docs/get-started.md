## Overview

This document describes how to configure a forked Helm Broker bundles repository.

## Prerequisites

Before you start, install:

* [Kyma](https://kyma-project.io/docs/latest/root/kyma#getting-started-getting-started) in version v0.4.1 or later
* [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) in version v1.10.0 or later
* [svcat CLI](https://svc-cat.io/docs/cli/) in version v1.10.0 or later

## Steps

Follow these steps to configure your own bundles repository and to complete this Getting Started guide.

### Create a fork and enable Travis CI with the GitHub repository

1. Fork the [bundle repository](https://github.com/kyma-project/bundles).

2. Go to the [GitHub](https://github.com) page.

3 In your GitHub profile account, choose the **Settings** tab. In the left sidebar, click **Developer settings**.

4. In the left sidebar, click **Personal access tokens**.

5. Click **Generate new token**.

6. Give your token a descriptive name.

7. Select the scope of the token `public_repo`.

8. Click **Generate token** and copy your personal access token.

9. Go to [Travis CI](https://travis-ci.com/) and sign up with your GitHub account. Accept the **Authorization** of Travis CI.

10. Click the **Activate** button and select your forked bundles repository. Click the **Approve & Install** button to give Travis CI access to your forked `bundle` repository.

11. In the left sidebar, click **My Repositories** tab and choose your GitHub repository.

12. Click the **More options** tab on the right and select **Settings**.

13. Go to the **Environment Variables** section. Set **Name** as `GITHUB_TOKEN`. **Value** is equal to your GitHub personal access token. Click the **Add** button.

14. Go to the **More options** tab and select **Trigger build**. Select a master branch and click the **Trigger custom build** button.

### Create a bundle

1. Create your bundle according to the [instruction](https://kyma-project.io/docs/latest/components/service-brokers#configuration-how-to-create-a-ybundle).

2. Place your bundle into the `bundles/` directory.

3. Along your bundle directory update `index.yaml` which defines available bundles. 
Instruction how to create a valid file can be found [here](https://github.com/kyma-project/kyma/blob/master/docs/service-brokers/docs/011-configuration-helm-broker.md#configuring-the-helm-broker-externally).

4. Commit changes and push to the master branch.

5. Travis automatically launches new build of the latest release. You can check build status on [travis-ci](https://travis-ci.com/) webpage. The (releasing document)[releasing.md] describes the process of tagging and releasing.

### Setup Helm Broker

1. Go to your forked repository and click the **Settings** tab. Go to the **GitHub Pages** section and copy Github pages link.
  
2. Set up the environment variable on the Helm Broker Deployment:

    ```
    kubectl set env -n kyma-system deployment/core-helm-broker -e APP_REPOSITORY_BASE_URL=https://github.com/{github-user-name}/bundles/releases/download/latest/
    ```
    for example:
    ```
    kubectl set env -n kyma-system deployment/core-helm-broker -e APP_REPOSITORY_BASE_URL=https://github.com/kyma-project/bundles/releases/download/latest/
    ```

3. Wait until the Helm Broker Pod is in the `READY` state. To check it, run this command:
    ```
    kubectl get pod -n kyma-system -l app=core-helm-broker
    ```

4. Synchronize with the Service Catalog:
    ```
    svcat sync broker core-helm-broker
    ```

### Check your Kyma Service Catalog

1. Go to the Kyma console in your browser.

2. Choose Environment.

3. The new bundles are visible in the **Catalog** section in the left sidebar.

4. The new bundles should appear. If not then go to the Troubleshooting section.

## Troubleshooting

### Check Helm Broker logs

Check pod's logs, it can give you a lot of information about occured issue. To check logs enter

```
kubectl logs -n kyma-system -l app=core-helm-broker
```