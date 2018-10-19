# Overview

This document describes the release flow and how to create a bundle release.

## Latest tag 

Every change in the master branch which passes all checks triggers creating a `latest` tag and a [latest release](https://github.com/kyma-project/bundles/releases/tag/latest).

## Versioned releases

Every tag pushed to the repository triggers new release. If the tag name matches the version pattern `x.y.0` (revision is `0`) Travis CI build creates a release tag `release-x.y`.

## Create a release from the master branch

Follow these steps to create a new bundle release 0.6.0:

1. Checkout the master branch with the latest changes:

    ```
    git checkout master
    git pull
    ```

2. Create a tag with proper release version:

    ```
    git tag 0.6.0
    ```   

3. Push the tag:

    ```
    git push 0.6.0 
    ```

4. After the Travis CI jobs finish, go to the [releases page](https://github.com/kyma-project/bundles/releases/) and the [branches list](https://github.com/kyma-project/bundles/branches). You can find there new release and new release branch.
 
## Create a release from the release branch

Follow these steps to create a new bundle release 0.6.1:

1. Checkout a release branch with the latest changes, for example:

    ```
    git checkout release-0.6
    git pull
    ```

2. Create a tag with proper release version, for example:

    ```
    git tag 0.6.1
    ```   

3. Push the tag:

    ```
    git push 0.6.1 
    ```

4. After the Travis CI jobs finish, go to the [releases page](https://github.com/kyma-project/bundles/releases/). You can find there new release.
