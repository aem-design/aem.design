---
layout: single
permalink: /blog/2019/10/20/enter-the-github-actions😘🐙🚀
title:  "Enter the Github Actions 😘🐙🚀"
excerpt: "We are in the end game now"
date:   2019-10-20 00:37:00:00 +1100
author: max@aem.design
categories:
  - blog
tags:
  - devops
  - aem
  - docker
  - automation
  - github
  - actions
  - github-actions
redirect_from:
  - /blog/2019/10/20/enter-the-github-actions
header:
    overlay_image: /assets/images/github/gihub-actions-matrix.png
---

<style>
.page__hero--overlay p, .page__hero--overlay h1{
    background-color: rgba(23,168,23, 0.6);
    max-width: fit-content !important;
    border-radius: 25px;
    padding: 10px;
}
</style>

CI/CD space if going off like a bunch of emoji in a url! But one thing you can be sure is to kiss 😘 your all-enveloping 🐙 pipeline tools good bye and put on your seat belt, as the pipeline mother-ship is taking off 🚀!   

Travis, Gitlab, Jenkins, Azure DevOps, CircleCI, Codeship all of these and more are awesome pipeline tools! We use them daily, they do us proud of things that we can accomplish with effort alone in this virtual world of ours. They make us happy when we move our piplines from one provider to another by giving us latest YAML syntax. They make us happy when they give us badges that we wear with pride in our readme's! They give us fancy plugins and cli tools that make us rewrite all of our pipelines over and over!

But late night wrestling with CI tools does leave feelings of doubt deep in your mind, maybe this is not the end game. Yes pulling data across the oceans so that you can just build the code does seem ok and mirroring your repos to another build system so that your Git LFS quota does not get smashed is worthy battle. But you wonder should you need to do all that and is there a better way.  

We know that big things come from little things, so all the small battles with these awesome tools seem to be a built up to something big. All these battles helped us to figure out what we really need from these pipeline tools.

And it seems that the ask is much firmer now after all the experimenting and it goes something like this:

- I want my code to be in a place where everyone can get at it.
- I want my code base to be respected by everyone
- I want my pipeline to be right there with the code so that I dont need to worry about any smudges, submodules and other solvable unknowns.
- I want this YAML config to be easy to understand and simple to follow, like Travis but with more YAML

Sure there is things to consider but for lets see where this takes us.

Now to be clear Travis is #1 until you need to run something longer than 50min then is Azure DevOps at #2. Travis is simple and it give you exactly what you want and for free. Azure DevOps is the all in one package that you dream of, but you need to move your code from Github. 🤔 

Gitlab is awesome for a few years we have been running on it, running over quotas etc pain full but worth while experience right up to archiving all project and moving to github. Gitlab is a great one-stop-shop if you want to run on-prem, as there is Github and Azure in paid categories, that compete at different level.   

Github has become the defacto standard for open source projects. Yes Azure has tried to capture the market and its done a bloody great job and Gihub is now owned by Mirosoft, and we will see who will win the internal pageant in the end but there will always be open source favorite. 

But all of this really does not really matter for now, what matters is that Github announced and delivered on their promise to have pipelines built into their offering. This was a long throw of a spanner and it has been is slow motion for a year, but it landed and pressed the tak off button! And its looking good! Yes there are features missing, but it wont be long.

Amazingly it seems that they copied some of the Azure DevOps pipeline components and have improved on them! This makes Github an absolute steal for open source project as its now one stop shop for all of your needs. It's astonishing how much [value this offers](https://help.github.com/en/github/automating-your-workflow-with-github-actions/about-github-actions) it leaves you with the thought what is the catch?! There aint none atm and I do hope they wont do Larry Ellison on us in a few years. Obviously people will just move to where there is more common sense.       

For now we have started to migrate all of our pipelines from Travis to Github Actions, so far it has been a very quick migration there are many guides how to migrate but if you know your pipelines its simpler to just get started!

### From Travis to Github Actions - the non definitive guide

To get started all you need to do is make `.github/workflows/main.yml` file in your project with following content:

```yaml
name: CI

on: [push]

jobs:
  build:
    env:
      GLOBAL_VAR: i am global
      SECRET_VAR: ${{ secrets.SECRET_VAR }}     # set this in Github Repo -> Setting -> Secrets
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - name: run a one-line script
        run: echo Hello, world!
      - name: Run a multi-line script
        run: |
          echo Add other actions to build,
          echo test, and deploy your project.
      - name: run a one-line script with if
        if: github.ref == 'refs/heads/master'
        run: echo Hello, world!
      - name: set step output and set some vars
        id: stepwithoutputs
        run: |
          echo ::set-env name=COOL_OUTPUT::HELLO THERE ENV
          echo ::set-output name=COOL_OUTPUT::HELLO THERE OUTPUT
      - name: dump some vars
        run: |
          echo STEP_OUTPUT_MAP=${STEP_OUTPUT_MAP}
          echo STEP_OUTPUT=${STEP_OUTPUT}
          echo STEP_SET_ENV_VAR=${STEP_SET_ENV_VAR}
          echo JOB_VAR=${JOB_VAR}
        env:
          STEP_OUTPUT_MAP: ${{ toJson(steps.stepwithoutputs.outputs) }}
          STEP_OUTPUT: ${{ steps.stepwithoutputs.outputs.COOL_OUTPUT }}
          STEP_SET_ENV_VAR: ${{ env.COOL_OUTPUT }}
          JOB_VAR: ${{ env.SECRET_VAR }}
      - uses: meeDamian/github-release@1.0
        with:
          token: ${{ secrets.GITHUB_TOKEN }}
          tag: ${{ env.GITHUB_TAG }}
          name: ${{ env.GITHUB_TAG }}
          body: ${{ env.GIT_RELEASE_NOTES }}
```

Here you can see common items that you could use in your simple pipeline, its a good start for converting your pipelines. 

Then you can go ahead and replace steps with the ones you have in your travis file. Here are some how to notes on things that you will need to know:

- `name:` at the top is the ID of action so keep that short.
- unlike Travis there is `jobs/<job_id>` layout where you can separate your flow if you need, initially having everything in one job is easiest, you can refactor once you have more requirements.
- `uses` mean using another pre made action from marketplace, you pass parameters to actions using `with`.
- you can use bash variables in `run` steps but you need to use "Context Expression" when doing it on other YAML attributes such `if`, `when` or passing variables to things.
- `if` is added directly to step YAML and you use Context Expressions to evaluate your logic, ex check if current branch is master: `if: github.ref == 'refs/heads/master'`.
- to `export` a variable to environment you need to do following echo command format `echo ::set-env name={name}::{value}`.
- you can also set step outputs `::set-output name={name}::{value}` that allow you to reference this step it in Context Expression `steps.<step_id>.outputs.<variable>` this separates global from step variables.
- to use `env` variables in `run` steps you can just do `${DOCKER_REGISTRY}` this will evaluate the variable as bash variable.
- to use `env` in YAML parts such as `with` etc you need to use Content Expressions `${{ env.DOCKER_REGISTRY }}` this will evaluate the variable as bash variable.
- to pass secrets to steps or use them in `env` variables use the Content Expression `${{ secrets.GITHUB_TOKEN }}`.
- check Awesome List of Must Have Actions in your Pipeline](https://github.com/sdras/awesome-actions) for custom actions that will replace comparable Travis actions, example [meeDamian/github-release@1.0](https://github.com/marketplace/actions/github-release-create-update-and-upload-assets) replaces Travis `deploy` step.
- caching is not there yet but will be available in November 2019.
- you can use Build Matrix see [Github Actions YAML Syntax](https://help.github.com/en/articles/workflow-syntax-for-github-actions) for more info

Following is a list of resource you should use to learn about syntax before you stat googling.

- [YAML Syntax](https://help.github.com/en/github/automating-your-workflow-with-github-actions/metadata-syntax-for-github-actions)
- [Github Actions YAML Syntax](https://help.github.com/en/articles/workflow-syntax-for-github-actions)
- [Setting Variables](https://help.github.com/en/github/automating-your-workflow-with-github-actions/development-tools-for-github-actions)
- [Global Variables and Secrets](https://help.github.com/en/articles/virtual-environments-for-github-actions)
- [Context Expression and Global Context](https://help.github.com/en/articles/contexts-and-expression-syntax-for-github-actions) 
- [Awesome List of Must Have Actions in your Pipeline](https://github.com/sdras/awesome-actions) - check this before googling
- [Github Actions Forum](https://github.community/t5/GitHub-Actions/bd-p/actions) - search here before googling

For better comparison here is an actual [Travis pipeline](https://github.com/aem-design/docker-toughday/blob/master/.travis.yml):

```yaml
language: java

if: tag is blank

services:
  - 'docker'

env:
  global:
    - PACKAGE_PATH="$(pwd)/packages"

cache:
  directories:
    - $PACKAGE_PATH


before_install:
  - "source <(curl -sL https://github.com/aem-design/aemdesign-docker/releases/latest/download/get_config.sh)"
  - echo GET PACKAGES
  - echo $PACKAGE_PATH
  - if [[ ! -d $PACKAGE_PATH ]]; then mkdir $PACKAGE_PATH; fi
  - echo PACKAGES CONTENTS $PACKAGE_PATH
  - ls -latr $PACKAGE_PATH
  - echo DOWNLOAD PACKAGES INTO ${PACKAGE_PATH}
  - ./scripts/download.sh "$PACKAGE_PATH/" "-" "-" "https://helpx.adobe.com/experience-manager/6-2/sites/developing/using/tough-day/_jcr_content/main-pars/download-section/download-1/file.res/toughday-6.1.jar"
  - ./scripts/download.sh "$PACKAGE_PATH/" "-" "-" "https://repo.adobe.com/nexus/content/repositories/releases/com/adobe/qe/toughday2/0.9.2/toughday2-0.9.2.jar"
  - ./scripts/download.sh "$PACKAGE_PATH/" "-" "-" "https://repo.adobe.com/nexus/content/repositories/releases/com/adobe/qe/toughday2/0.2.1/toughday2-0.2.1.jar"
  - ls -latr $PACKAGE_PATH
  - "source <(curl -sL https://github.com/aem-design/aemdesign-docker/releases/latest/download/get_version.sh)"


#build and test
install:
  - docker build --pull -t $IMAGE:$IMAGE_VERSION .
  - export CONTAINER_COMMAND="docker run $IMAGE:$IMAGE_VERSION $TEST_COMMAND"
  - echo CONTAINER_COMMAND=$CONTAINER_COMMAND
  - export CONTAINER_OUTPUT=$(eval $CONTAINER_COMMAND)
  - echo CONTAINER_OUTPUT=$CONTAINER_OUTPUT
  - if [[ ! ${CONTAINER_OUTPUT} =~ ${TEST_COMMAND_VERIFY} ]]; then travis_terminate 1; fi
  - docker images

#test
script:
  - echo "LOGIN TO HUB.DOCKER"
  - docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
  - echo "PUSH HUB.DOCKER"
  - docker push $IMAGE:$IMAGE_VERSION
  - if [[ $TRAVIS_BRANCH == "master" ]]; then docker tag $IMAGE:$IMAGE_VERSION $IMAGE:latest && docker push $IMAGE:latest; fi
  - echo "UPDATE README IN HUB.DOCKER"
  - if [[ $TRAVIS_BRANCH == "master" ]]; then docker run --rm -v $(pwd):/data/ aemdesign/dockerhub-description "$DOCKER_USERNAME" "$DOCKER_PASSWORD" "$IMAGE"; fi

## Get the project version
before_deploy:
  - if [[ $TRAVIS_BRANCH == "master" ]]; then git tag $TRAVIS_TAG; fi

## Create release in GitHub
deploy:
  provider: releases
  tag_name: $TRAVIS_TAG
  name: $TRAVIS_TAG
  target_commitish: $TRAVIS_COMMIT
  api_key: $GITHUB_TOKEN
  skip_cleanup: true
  on:
    branch: master

``` 

Its ported version looks very similar [Gitub Actions](https://github.com/aem-design/docker-toughday/blob/master/.github/workflows/build.yml):

```yaml
{% raw %}
name: build

on: [push]

jobs:
  build:

    runs-on: ubuntu-latest
    env:
      DOCKER_REGISTRY: docker.io
      ORGANISATION_NAME: aemdesign
      DOCKER_USERNAME: ${{ secrets.DOCKER_USERNAME }}
      DOCKER_PASSWORD: ${{ secrets.DOCKER_PASSWORD }}
    steps:
      - uses: actions/checkout@v1
      - name: set envirnment variables
        id: config
        run: |
          echo GET PACKAGES
          export PACKAGE_PATH=$(pwd)/packages
          echo ::set-env name=PACKAGE_PATH::${PACKAGE_PATH}
          source <(curl -sL https://github.com/aem-design/aemdesign-docker/releases/latest/download/github_get_config.sh)
          echo $PACKAGE_PATH
          if [[ ! -d $PACKAGE_PATH ]]; then mkdir $PACKAGE_PATH; fi
          echo PACKAGES CONTENTS $PACKAGE_PATH
          ls -latr $PACKAGE_PATH
          echo DOWNLOAD PACKAGES INTO ${PACKAGE_PATH}
          ./scripts/download.sh "$PACKAGE_PATH/" "-" "-" "https://helpx.adobe.com/experience-manager/6-2/sites/developing/using/tough-day/_jcr_content/main-pars/download-section/download-1/file.res/toughday-6.1.jar"
          ./scripts/download.sh "$PACKAGE_PATH/" "-" "-" "https://repo.adobe.com/nexus/content/repositories/releases/com/adobe/qe/toughday2/0.9.2/toughday2-0.9.2.jar"
          ./scripts/download.sh "$PACKAGE_PATH/" "-" "-" "https://repo.adobe.com/nexus/content/repositories/releases/com/adobe/qe/toughday2/0.2.1/toughday2-0.2.1.jar"
          ls -latr $PACKAGE_PATH
          source <(curl -sL https://github.com/aem-design/aemdesign-docker/releases/latest/download/github_get_version.sh)

      - name: build and test docker image
        run: |
          docker build --pull -t $IMAGE:$IMAGE_VERSION .
          source <(curl -sL https://github.com/aem-design/aemdesign-docker/releases/latest/download/container_verify.sh)
          (cd test && ./run_tests.sh "$IMAGE:$IMAGE_VERSION")
          docker images
          
      - name: login to docker registry
        run: echo "${{ secrets.DOCKER_PASSWORD }}" | docker login ${DOCKER_REGISTRY} -u "${{ secrets.DOCKER_USERNAME }}" --password-stdin

      - name: push image version
        run: docker push $IMAGE:$IMAGE_VERSION

      - name: push latest image on master
        if: github.ref == 'refs/heads/master'
        run: |
          docker tag $IMAGE:$IMAGE_VERSION $IMAGE:latest
          docker push $IMAGE:latest

      - name: update registry description with readme on master
        if: github.ref == 'refs/heads/master'
        run: |
          docker run --rm -v $(pwd):/data/ aemdesign/dockerhub-description "$DOCKER_USERNAME" "$DOCKER_PASSWORD" "$IMAGE"

      - uses: meeDamian/github-release@1.0
        with:
          token: ${{ secrets.GITHUB_TOKEN }}
          tag: ${{ env.GITHUB_TAG }}
          name: ${{ env.GITHUB_TAG }}
          body: ${{ env.GIT_RELEASE_NOTES }}
{% endraw %}

```

Differences are almost minor and migration follow copy-paste approach for majority of pipeline which is ideal. That's all there is to this migration all you have to do now is commit and head to the Actions console in your repo to see your build take off 🚀 as the next stop is the moon!  

As always checkout the code, fork, extend and contribute if you wish.
