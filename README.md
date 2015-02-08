# dsi-users

Installe et configure les différents comptes utilisés par la DSI. Le principe est hébergé sur Github, les comptes réels sont privés.

## Platformes suppportées

* Debian 7
* Ubuntu 14.04

## Attributs

* default['dsi-users']['dev'] = false
* default['dsi-users']['databag']['name'] = 'users'
* default['dsi-users']['databag']['encrypted'] = true

## Utilisation

### Data bag
Créer un data bag 'users' avec un compte par item au format json. Des exemples de configuration de compte se trouvent dans le répertoire 'test/integration/default/data_bags/users'.

Pour générer un mot de passe, une procédure rake est inclus dans ce cookbook :

```bash
rake password
```

Si vous ne saisissez pas de mot de passe, il en génèrera un automatiquement. Le mot de passe à privilégier est celui au format SHA512.

Une fois votre data bag configuré et injecter sur le serveur chef, vous pouvez passer à la suite.


### Recipe

Inclure `dsi-users` dans la `run_list` de votre noeud pour injecter les comptes par défaut :

```json
{
  "run_list": [
    "recipe[dsi-users::default]"
  ]
}
```

### Définition

Ce cookbook peut-être réutiliser en le mettant en dépendance du votre. La définition suivante est disponible :

```ruby
dsi_users 'compte' do
  password 'PASSWORD_SHA512'
  passwordless true
end
```

ou plus simplement si vous avez un data bag :

```ruby
dsi_users 'compte'
```

## License and Authors

```
Copyright 2015 Stephane LII

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

Authors :

* Stéphane LII (<stephane.lii@informatique.gov.pf>)
* Léonard TAVAE (<leonard.tavae@informatique.gov.pf>)
