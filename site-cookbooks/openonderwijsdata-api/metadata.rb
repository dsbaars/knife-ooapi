name             'openonderwijsdata-api'
maintainer       'Djuri Baars'
maintainer_email 'dsbaars@gmail.com'
license          'MIT'
description      'Installs/Configures openonderwijsdata-api'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'python'
depends 'build-essential'
depends 'git'
depends 'apt'
depends 'nodejs'
depends 'uwsgi'
depends 'nginx'
depends 'supervisor'
depends 'elasticsearch'
