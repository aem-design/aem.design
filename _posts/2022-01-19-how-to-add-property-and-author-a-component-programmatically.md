---
layout: single
permalink: /blog/2022/01/19/how-to-add-property-and-author-a-component-programmatically
title:  "How to add property and author a component programmatically?"
excerpt: "ACS On-Deploy is the answer!"
date:   2022-01-19 00:00:00:00 +1000
author: max@aem.design
categories:
- blog
tags:
- aem
- ondeploy
- acs
- data
- patterns
---

## Updatating AEM Content programmatically?

By far the easiest method of updating your AEM content programmatically is to use [ACS On-Deploy Script](https://adobe-consulting-services.github.io/acs-aem-commons/features/on-deploy-scripts/index.html)

To do this you will need these java files
* [OnDeployScriptProviderImpl.java](#1-ondeployscriptproviderimpljava) - which will load your Script `UpdateNodeAttibutes`, read more about this in the docs.
* [UpdateNodeAttibutes.java](#2-updatenodeattibutesjava) - which will update your data..

Here is starting content for your files...

### 1. OnDeployScriptProviderImpl.java

Location: `design\aem\ondeploy\OnDeployScriptProviderImpl.java`

```java
package design.aem.ondeploy;

import com.adobe.acs.commons.ondeploy.OnDeployScriptProvider;
import com.adobe.acs.commons.ondeploy.scripts.OnDeployScript;
import design.aem.ondeploy.scripts.*;
import java.util.Arrays;
import java.util.List;

import org.apache.felix.scr.annotations.Properties;
import org.apache.felix.scr.annotations.Property;
import org.apache.felix.scr.annotations.Service;
import org.osgi.service.component.annotations.Component;

@Component(immediate = true)
@Service
@Properties({
        @Property(name = "service.description", value = "Developer service that identifies code scripts to execute upon deployment")
})
public class OnDeployScriptProviderImpl implements OnDeployScriptProvider {
    @Override
    public List<OnDeployScript> getScripts() {
        return Arrays.asList(
            new UpdateNodeAttibutes()
        );
    }
}
```
  
### 2. UpdateNodeAttibutes.java

Location: `design\aem\ondeploy\scripts\UpdateNodeAttibutes.java`

```java
package design.aem.ondeploy.scripts;

import com.adobe.acs.commons.ondeploy.scripts.OnDeployScript;
import com.adobe.acs.commons.ondeploy.scripts.OnDeployScriptBase;
import com.day.cq.search.PredicateGroup;
import com.day.cq.search.Query;
import com.day.cq.search.QueryBuilder;
import com.day.cq.search.result.Hit;
import com.day.cq.search.result.SearchResult;
import com.day.cq.wcm.api.Page;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.jcr.Node;
import javax.jcr.RepositoryException;
import javax.jcr.Session;

import org.apache.commons.lang3.StringUtils;
import org.apache.sling.api.resource.ModifiableValueMap;
import org.apache.sling.api.resource.Resource;
import org.apache.sling.api.resource.ResourceResolver;


public class UpdateNodeAttibutes extends OnDeployScriptBase {

    private static final String CONTENT_ROOT_PATH = "/content/";

    private static Map<String,String> RENAME_ATTRIBUTES = new HashMap<String, String>() {{
        put("OLD ATTRIBUTE1", "NEW ATTRIBUTE1");
        put("OLD ATTRIBUTE2", "NEW ATTRIBUTE2");
    }};

    private static Map<String,String> ADD_ATTRIBUTES = new HashMap<String, String>() {{
        put("NEW ATTRIBUTE3", "NEW ATTRIBUTE3 VALUE");
        put("NEW ATTRIBUTE4", "NEW ATTRIBUTE4 VALUE");
    }};

    @Override
    protected void execute() throws Exception {

        QueryBuilder queryBuilder = this.getResourceResolver().adaptTo(QueryBuilder.class);

        // predicates for properties we are looking for.
        // more info on how to make these https://github.com/paulrohrbeck/aem-links/blob/master/querybuilder_cheatsheet.md
        HashMap<String, String> param = new HashMap<>();

        param.put("path", CONTENT_ROOT_PATH);
        param.put("p.limit", "-1");

        long i = 1;
        for(Map.Entry<String, String> entry : RENAME_ATTRIBUTES.entrySet()) {
            String key = entry.getKey();

            param.put("group." + i + "_property", "@" + key);
            param.put("group." + i + "_property.value", "true");
            param.put("group." + i + "_property.operation", "exists");
            i++;

        }

        param.put("group.p.or", "true");

        // this will return a list of all pages that have any of properties we need
        Query query = queryBuilder.createQuery(
                PredicateGroup.create(param),
                this.getResourceResolver().adaptTo(Session.class)
        );

        SearchResult result = query.getResult();

        boolean migrationError = false;

        // walk the query result
        for (final Hit hit : result.getHits()) {

            Resource resultResource = hit.getResource();

            if (resultResource != null) {

                ModifiableValueMap resourceProps = resultResource.adaptTo(ModifiableValueMap.class);

                try {
                    // walk though all nodes that need to be renamed
                    for(Map.Entry<String, String> entry : RENAME_ATTRIBUTES.entrySet()) {
                        String key = entry.getKey();
                        String newKey = entry.getValue();

                        // if node map contains attribute create a new entry.
                        if (resourceProps.containsKey(key)) {
                            // add value with new key
                            resourceProps.put(newKey,resourceProps.get(key));
                            // remove old key and value
                            resourceProps.remove(key);
                        }
                    
                    }
                    
                    for(Map.Entry<String, String> entry : ADD_ATTRIBUTES.entrySet()) {
                        String key = entry.getKey();
                        String value = entry.getValue();

                        // if node map contains attribute create a new entry.
                        if (resourceProps.containsKey(key)) {
                            // add new key and value
                            resourceProps.put(key,value);
                        }
                    
                    }

                } catch (Exception e) {
                    migrationError = true; 
                    e.printStackTrace();
                    throw new RuntimeException("Could not complete migration.");
                }

                
            }
        }

        if (!migrationError) {
            this.getSession().save();
        }
    }

}
```

Update `RENAME_ATTRIBUTES` and `ADD_ATTRIBUTES` maps for desired oucome, good luck and have fun! 

### Thank you

If you would like to contribute or fork the code, you can get it on GitHub [https://github.com/aem-design](https://github.com/aem-design) and through Maven central.

Don't forget to tell your friends.
