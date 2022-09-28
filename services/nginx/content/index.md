---
layout: page
---

<!-- markdownlint-disable MD025 -->
# {{ page.title | default: site.title }}

<p>{{ site.description }}</p>

<!-- markdownlint-disable MD033 -->
<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Service</th>
      <th scope="col">Description</th>
      <th scope="col">URLs</th>
      <th scope="col">Port, Debug</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row"><img src="{{ site.env.SITE_LOGO }}" alt="{{ site.env.SITE_TITLE}}" class="logo"></th>
      <td>Project Dashboard</td>
      <td>this page</td>
      <td><a target="_blank" class="btn btn-primary" href="{{ site.env.DOMAIN_URL }}">Open</a>
      </td>
      <td></td>
    </tr>
    <tr>
      <th scope="row"><img src="{{ site.env.SITE_LOGO }}" alt="{{ site.env.SITE_TITLE}}" class="logo"></th>
      <td>Local</td>
      <td>development instance</td>
      <td><a target="_blank" class="btn btn-primary" href="{{ site.env.SERVER_SITE_URL }}">Open</a>
      </td>
      <td>Live reload {{ site.env.SERVER_SITE_LIVERELOAD_PORT }}</td>
    </tr>
    <tr>
      <th scope="row"><img src="logos/Traefik.logo.png" alt="Traefik" class="logo"></th>
      <td>Traefik</td>
      <td>environment proxy for all services</td>
      <td><a target="_blank" class="btn btn-primary" href="{{ site.env.TRAEFIK_URL }}/dashboard/">Open</a></td>
      <td>8080</td>
    </tr>
    <tr>
      <th scope="row"><img src="{{ site.env.SITE_LOGO }}" alt="{{ site.env.SITE_TITLE}}"  class="logo"></th>
      <td>{{ site.env.SITE_TITLE }}</td>
      <td>public version</td>
      <td><a target="_blank" class="btn btn-primary" href="{{ site.env.PUBLIC_URL }}">{{ site.env.SITE_TITLE }}</a>
      </td>
      <td></td>
    </tr>
    <tr>
      <th scope="row"><img src="logos/github-dark.png" alt="github"  class="logo"></th>
      <td>Github</td>
      <td>repo</td>
      <td>
          <a target="_blank" class="btn btn-primary" href="{{ site.env.GIT_REPO }}"><i class="fab fa-github"></i> Github</a>
      </td>
      <td></td>
    </tr>
  </tbody>
</table>
