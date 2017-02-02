---
title: "Technical Standards"
permalink: /manifesto/technical/
excerpt: "Simple to understand, easy to follow."
modified: 2016-11-03T10:01:43-04:00
author: max.barrass@gmail.com
redirect_from:
  - /manifesto/content/
---

{% include toc %}

These sections that follow are samples that should be built upon to adopt to your situation.

## Reference Material

[Architecture Overview 5.6.1](https://docs.adobe.com/docs/en/cq/5-6-1/exploring/architecture-overview.html)

[AEM Links](https://github.com/paulrohrbeck/aem-links)

## Sample JS Project Namespace

location: ```/etc/designs/`/js/namespace-aem-design.js```

```javascript
//namespace-aemdesign.js
window.AEMDESIGN = window.AEMDESIGN || {};
window.AEMDESIGN.jQuery = window.jQuery || {};
window.AEMDESIGN.$ = window.jQuery || $;

;(function ($, ns, window, undefined) { //add additional dependencies

    "use strict";
    var _version = "0.1";

    ns.version = function () {
        return _version;
    };

    var http = AEMDESIGN.HTTP;

    $.ajaxSetup({ // necessary global modifications for ajax calls
        statusCode: {
            403: function(jqXHR) {
                if (jqXHR.getResponseHeader("X-Reason") === "Authentication Failed") {
                    // login session expired: redirect to login page
                    http.handleLoginRedirect();
                }
            }
        }
    });

    $.ajaxSettings.traditional = true;


})(AEMDESIGN.jQuery, AEMDESIGN, this); //pass in additional dependencies
```

## Sample JS Console Log Utility Class

location: ```/etc/designs/aem-design/js/aem-design.log.js```

```javascript
//aem-design.log.js
window.AEMDESIGN = window.AEMDESIGN || {};
window.AEMDESIGN.log = window.AEMDESIGN.log || {};

(function ($, ns, window, undefined) { //add additional dependencies

    //"use strict";
    var _version = "0.1";
    var settings = {
        enableLog: false
    }

    ns.version = function () {
        return _version;
    };

    ns.enableLog = function() {
        settings.enableLog = true;
    }

    ns.disableLog = function() {
        settings.enableLog = false;
    }


    ns.log = function (data) {

        if (window.console && window.console.log) {
            var url = $(location).attr('href');

            var traceStack;
            if (typeof printStackTrace == "function") {
                traceStack = printStackTrace();
            }
            var debug = {
                "caller": arguments.caller,
                "traceStack": traceStack
            };

            if (settings.enableLog) {
                console.log([url,data,debug]);
            }
        }

    };

})(AEMDESIGN.jQuery, AEMDESIGN.log, this); //pass in additional dependencies
```


## Sample JS Component Namespace

location: ```/apps/aemdesign/componentX/clientslibs/js.txt```

```text
#base=js

functions.js
behaviour.js
```


location: ```/apps/aemdesign/componentX/clientslibs/js/behaviour.js```

```javascript
//searchBox - behaviour

;(function($, _, ko, searchBox, window, undefined) { //add additional dependencies

    $(document).ready(function() {
        $("[data-modules='Search']").each(function() {

            var base = $(this);
            AEMDESIGN.log.log("loading search box");
            searchBox.init(base);

        });
    });


})(AEMDESIGN.jQuery, _, ko,  AEMDESIGN.components.searchBox, this); //pass in additional dependencies
```


location: ```/apps/aemdesign/componentX/clientslibs/js/functions.js```

```javascript
//searchBox - functions

window.AEMDESIGN = window.AEMDESIGN || {};
window.AEMDESIGN.components = AEMDESIGN.components || {};
window.AEMDESIGN.components.searchBox = AEMDESIGN.components.searchBox || {};

;(function ($, _, ko, ns, window, undefined) { //add additional dependencies

    "use strict";
    var _version = "0.1";

    ns.version = function () {
        return _version;
    };

    ns.init = function($el) {

        return $el; //chaining
    };

})(AEMDESIGN.jQuery,_,ko, AEMDESIGN.components.searchBox, this); //pass in additional dependencies
```

## Sample Health Check

```java
package com.aem-design.health;

import java.io.IOException;
import javax.servlet.ServletException;
import org.apache.felix.scr.annotations.sling.SlingServlet;
import org.apache.felix.scr.annotations.Property;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.SlingHttpServletResponse;
import org.apache.sling.api.servlets.SlingAllMethodsServlet;

@SlingServlet(paths = "/bin/aem-design/health", methods = "GET", metatype = true)
@Property(name = "sling.auth.requirements", value = "-/bin/aem-design/health", propertyPrivate = true)
public class HealthServlet extends SlingAllMethodsServlet {
    private static final long serialVersionUID = 636174686179L;

    @Override
    protected void doGet(SlingHttpServletRequest request, SlingHttpServletResponse response) throws ServletException, IOException {
        response.getWriter().write("AEM-OK");
    }
}
```

## Sample Adaptive Image

location: ```/apps/aemdesign/content/image/variant.responsive.jsp```

```html
<a href="/content/geometrixx-media/en/events/andrew-novokov.html">
    <div data-picture data-alt='Interview with Russian author Andrew Novokov'>
        <div data-src='/content/geometrixx-media/en/events/andrew-novokov.image.370.150.medium.jpg' data-media="(min-width: 1px)"></div>
        <div data-src='/content/geometrixx-media/en/events/andrew-novokov.image.480.190.medium.jpg' data-media="(min-width: 480px)"></div>
        <div data-src='/content/geometrixx-media/en/events/andrew-novokov.image.770.300.medium.jpg' data-media="(min-width: 768px)"></div>
        <div data-src='/content/geometrixx-media/en/events/andrew-novokov.image.940.340.high.jpg'   data-media="(min-width: 980px)"></div>
        <div data-src='/content/geometrixx-media/en/events/andrew-novokov.image.1170.400.high.jpg'  data-media="(min-width: 1199px)"></div>
        <noscript>
            <img src='/content/geometrixx-media/en/events/andrew-novokov.image.370.150.low.jpg' alt='Interview with Russian author Andrew Novokov'>
        </noscript>
    </div>
</a>
```

location: ```/apps/aemdesign/content/image/clientslibs/js/functions.js```

```javascript
$("div[data-picture]", context).each(function () {
    var currentPicture = this;
    var matches = [];
    $("div[data-media]", currentPicture).each(function () {
        var media = $(this).attr("data-media");
        if (!media || ( w.matchMedia && w.matchMedia(media).matches )) {
            matches.push(this);
        }
    });

    var $picImg = $("img", currentPicture).first();

    if (matches.length) {
        if ($picImg.size() === 0) {
            var $currentPicture = $(currentPicture);
            $picImg = $("<img />").attr("alt", $currentPicture.attr("data-alt")).appendTo($currentPicture);
        }
        $picImg.attr("src", matches.pop().getAttribute("data-src"));
    } else {
        $picImg.remove();
    }
});
```

## Sample Sling Content Manipulation

Sling allows ability to automate content creation, deletion and updates.

Sling API Manipulation Manual : [http://sling.apache.org/documentation/bundles/manipulating-content-the-slingpostservlet-servlets-post.html](http://sling.apache.org/documentation/bundles/manipulating-content-the-slingpostservlet-servlets-post.html)

## Import UTF Characters using Sling

``` bash
curl -X POST -u "admin:admin" -F"_charset_=utf-8" --form-string "text-ja=あなたが喜んで学ぶならば、誰かが喜んで教えるでしょう！。" http://localhost:4502/content/testpage/jcr:content/par/label
```
