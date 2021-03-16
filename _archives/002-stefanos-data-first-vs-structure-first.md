---
layout: single
title: "Data First vs. Structure First"
permalink: /archives/data-first-vs-structure-first
excerpt: "by Stefano Mazzocchi"
date:   2005-07-28 16:41:45 -0700
comments: true
header:
  overlay_image: /assets/images/site-logo.png
---

Some people find the act of categorizing and abstracting natural and rewarding, others find it frustrating and unnecessary.

The problem with information technologies is that computer programmers are likely to fall in the first category and users of such programs are likely to fall into the second one.

For example, the file system.

Files and folders are concepts that were invented by people that were managing tons of paper information and, because of that, they liked categorizing and abstracting... normal users don't! Look at the average car, desk, room, closet... are they all perfectly ordered and structured, labeled and well categorized?

If it's easier/faster to find something in 8 billion pages of the web than in your own 100 thousand files (including documents, emails, pictures, etc..), there's a problem.

Another example, spreadsheets vs. databases.

Both are based on tables, rows being the items, columns being their attributes. Both allow relationships, yet spreadsheets feel suboptimal and amateurish to the average database guy and databases feel obnoxiously rigid to the average spreadsheet user. Spreadsheets (not databases!) were the reasons why people spent 10K$ on a personal computer in the early 80's. No wonder why IBM didn't see that coming.

Yet another example: blogs vs. CMSs.

When you blog, you don't tell the blog where to put it. You just write, you blog. When you write a diary, you don't pick a random page and then write an index to indicate where to locate that item. You just pick up from where you left off. Some people like to categorize their blog posts, some don't. Some people decide what goes in their feeds, and some others allow you to have an RSS feed of a particular query.

See the pattern?

```
Data First strategies have higher usability efficiency (all rest being equal) than Structure First strategies.
```

The reasons are not so obvious:

* Data First is how we learn and how languages evolve. We build rules, models, abstractions and categories in our minds after we have collected information, not before. This is why it's easier to learn a computer language from examples than from its theory, or a natural language by just being exposed to it instead of knowing all rules and exceptions.
* Data First is more incrementally reversible, complexity in the system is added more gradually and it's more easily rolled back.
* Because of the above, Data First's Return on Investment is more immediately perceivable, thus lends itself to be more easily bootstrappable.

But then, one might ask, why is everybody so obsessed with design and order? Why is it so hard to believe that self-organization could be used outside the biological realm as a way to manage complex information systems?

One important thing can be noted:

```
On a local time-scale and once established, "Structure First" systems are more efficient.
```

This basically means that in any given instant and with infinite energy to establish them, structure first systems are preferable. Problem is that both bootstrapping costs and capacity to evolve over time of any given designed system are endemically underestimated, making pretty much any 'Structure First' project appear more appealing over 'Data First' ones, at least at design time.

But there is more: we all know that a complete mess is not a very good way to find stuff, so "data first" has to imply "structure later" to be able to achieve any useful capacity to manage information. Here is where things broke down in the past: not many believed that useful structures could emerge out of collected data.

But look around now: the examples of 'data emergence' are multiplying and we use them every day. Google's PageRank, Amazon's co-shopping, Citeseer's co-citation, del.icio.us and Flickr co-tagging, Clusty clustering, these are all examples of systems that try to make structure emerge from data, instead of imposing the structure and pretend that people fill it up with data.

Some believe that the semantic web is an example of 'structure first' but it's really not the case... yet, many and many people truly believe that in order to be successful a 'Structure First' design (well "ontology first" in this case) is the way you build interoperability.

As you might have guessed, I disagree.

I think that RDF is a good data model for graph-like structures and that complex, real life systems, tend to exhibit graph-like structures. I also believe that the value is not in the ontology used to describe the data but in the ability to globally identify (and isolate) information fragments and in the existence (or lack thereof!) of relationships between them.

Don't get me wrong, some common vocabularies (RDF, RDF Schema and Dublin Core) go a long way in reducing the bootstrapping effort and make basic interoperability happening. At the same time, I believe people will "pick cherries" in the ontology space and when they don't find anything satisfying they will write their own. Sometimes use and abuse will be hard to tell apart, creating a sort of Babel of small deviations that will have to be processed with a 'Data First' approach in mind. An immune system will have to be created, trusted silos established, peer review enforced.

Next time you spend energy writing the ontology, or the database schema, or the XML schema, or the software architecture, or the protocol, that 'foresees' problems that you don't have right now think about "you ain't gonna need it", "do the simplest thing that can possibly work", "keep it simple stupid", "release early and often", "if it ain't broken don't fix it" and all the various other suggestions that tell you not to trust design as the way to solve your problems.

But don't forget to think about ways to make further structure emerge from the data, or you'll be lost with a simple system that will fail to grow in complexity without deteriorating.
