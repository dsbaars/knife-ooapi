openonderwijsdata-api cookbook
=====================
Configureert een server voor openonderwijsdata-api via chef/knife solo

Requirements
------------
Alleen getest op een Ubuntu 14.04 amd64 omgeving.

#### packages
- `python`
- `git`
- `npm`
- `uwsgi`
- `supervisor`
- `elasticsearch`

Attributes
----------
#### openonderwijsdata-api::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['ooapi']['user']</tt></td>
    <td>String</td>
    <td>The user to configure for</td>
    <td><tt>ubuntu</tt></td>
  </tr>
  <tr>
    <td><tt>['ooapi']['group']</tt></td>
    <td>String</td>
    <td>Group where the user to configure to is in</td>
    <td><tt>ubuntu</tt></td>
  </tr>
  <tr>
    <td><tt>['ooapi']['git']['repo']</tt></td>
    <td>String</td>
    <td>Repository to check-out</td>
    <td><tt>https://github.com/dsbaars/openonderwijsdata-api</tt></td>
  </tr>
  <tr>
    <td><tt>['ooapi']['git']['ref']</tt></td>
    <td>String</td>
    <td>Commit or branch to check out</td>
    <td><tt>master</tt></td>
  </tr>
</table>

Usage
-----
#### openonderwijsdata-api::default
Installeert basis (Python virtualenv, packages, bower en andere handige dingen)

#### openonderwijsdata-api::web
Configureert nginx en uwsgi voor een semi-productie omgeving

#### openonderwijsdata-api::index
Configureert elasticsearch-instance (nog niet af)

```json
{
  "name":"webserver",
  "run_list": [
    "recipe[openonderwijsdata-api::default]"
    "recipe[openonderwijsdata-api::web]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Djuri Baars
