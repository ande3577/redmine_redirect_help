# Redmine Redirect Help

## Overview

Redmine links the help button on the top of the page to a wiki entry on their
global site.  In some cases, a user may wish to create a customized help
resource tailored to their specific redmine configuration/usage.  This plugin
will redirect the help link to a specified wiki page in the redmine database.

The help page will not be drawn as part of a gven project in order to prevent 
users from accidently logging issues to the help project.

## Compatibility

This plugin is developed and tested on version 2.3.3, it may or may not work 
with other versions.  Because it overrides at least one view, future Redmine 
versions are likely to break compatibility and should be verified.

## Installation

1.  Clone to plugins/redmine_redirect_help
1.  Restart the server

## License

This program is free software: you can redistribute it and/or modify 
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
