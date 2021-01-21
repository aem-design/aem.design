---
layout: single
permalink: /blog/2021/01/21/automation-testing-for-aem-dialogs
title:  "Automation Testing For AEM Dialogs"
date:   2021-01-21 00:37:00:00 +1100
author: max@aem.design
categories:
  - blog
tags:
  - devops
  - aem
  - testing
  - automation-testing
---

Automation testing is an absolute mandatory and covered in [Automation Testing and Human Reporting](/blog/2017/06/28/automation-testing) and demonstrates a viable, usable AEM Automated Testing approach and does not make the automated testing suite a development only agenda.

Over the last few years, AEM Automation Testing for AEM Dialog has been getting more focus, and I have been asked by many how to do this easily. The current approach leverages existing AEM Editor experience to view and load dialogs so that they can be tested. One of the improvements that have been asked can that be made faster so that actual pages do not require loading, so that spec execution speed improves.

AEM being a gem of capabilities has this covered, and with little effort, we can leverage this to really create powerful specs that test component dialogues as a user would use them. The key to this is understanding how AEM loads component dialogs and the data they represent. Fortunately this pattern very simple using sling.

* First you need a path to a dialog (`/apps/aemdesign/components/details/generic-details/v1/generic-details/_cq_dialog.html`) this path is a component that takes as a parameter as a path to the component dialog should show and update.
* Second you need a content path (`/content/aemdesign-showcase/au/en/component/details/generic-details/jcr:content/article/par/contentblock7/par/genericdetails`) which dialog should update. This is simply any path that dialog will use for reading and wirting. 
* Third you combine these into a url you can use for automation `http://localhost:4512/mnt/override/apps/aemdesign/components/details/generic-details/v1/generic-details/_cq_dialog.html/content/aemdesign-showcase/au/en/component/details/generic-details/jcr:content/article/par/contentblock7/par/genericdetails`

And that's it! Now you can write any tests around this URL. Taking this knowledge a spec can be updated to allow testing AEM Dialog with ease and without loading whole pages!

Here is a reference AEM component dialog spec that tests of the tabs that appear on the component have the right content appearing. This is done simply by taking a screenshot of the dialog's page.

```groovy
package specs.component.details.genericdetails

import spock.lang.Stepwise
import support.AuthorDialogSpec

@Stepwise
class GenericDetailsAuthorDialogSpec extends AuthorDialogSpec {

    String pathPage = "components/details"
    String pathSite = "mnt/override/apps/aemdesign"
    String language = ""
    String componentPath = "generic-details/v1/generic-details/_cq_dialog"
    String pageExtensionSuffix = "/content/aemdesign-showcase/au/en/component/details/generic-details/jcr:content/article/par/contentblock7/par/genericdetails"

    def setupSpec() {
        loginAsAdmin()
    }

    def cleanupSpec() {
        analyzeLog()
    }

    def "Dialog of Component with Content"() {

        given: "Component dialog exist"
        def selector = "coral-dialog"

        when: "I open dialog with content"
        go "/${pathSite}/${pathPage}/${componentPath}${pageExtension}${pageExtensionSuffix}"

        then: "The component dialog should render"
        waitFor { $(selector) }

        and: "Dialog should be able to open"
        showDialogDirect()
        report("Dialog should be able to open")

        when: "When I select Layout tab"
        selectDialogTab("Layout")
        waitFor { tabSelected("Layout") }
        report("Layout tab selected")

        then: "Then it should have the Custom Layout options selected and matching configuration options"
        designRefFull(selector, "tab-layout")

        where:
        viewport << getDialogViewPort()

    }
}
```

Once you run this spec you will get an excellent report that will help you determine if the dialog works as you expected it.

![Automation Testing Report - Generic Details](/assets/images/automation-testing/dialog-test/GenericDetailsAuthorDialog.png)

As you can see this pattern will allow you to test AEM Dialogs especially if you are into making customised controls, if you are stuck, look at some examples in [GenericDetailsAuthorDialogSpec.groovy](https://github.com/aem-design/aemdesign-aem-support/blob/clean-up-compose-project/aemdesign-testing/src/test/groovy/specs/component/details/genericdetails/GenericDetailsAuthorDialogSpec.groovy).

Don't forget to tell your friends.
