#!/bin/bash

#
# Copyright 2016. Stephen Knight, EMC Corporation (Application Work Group).
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

## Launches Json into the Marathon endpoint as either a standalone app or group.
## Usage ./deploy.sh app name_of_json.json which will follow with a hostname prompt

## User notice
echo ""
echo "## Make sure to modify the json files accordingly if you plan to use the examples in this directory."
echo ""

## Grab IP or hostname of Mesos controller instead of hard coding it
echo -n "Type the hostname/IP of the Mesos controller, followed by [ENTER]: "
read -r controller_name
echo ""

MARATHON="http://${controller_name}:8080"
ARGUMENT="$1"
APP_DEFINITION="$2"

if [ "$ARGUMENT" = "app" ];
then

        $(which curl) -X POST $MARATHON/v2/apps --data-binary @$APP_DEFINITION -H "Content-type: application/json"
        printf "\n\nDeploying file: %s of type: %s\n" $APP_DEFINITION $ARGUMENT

elif [ "$ARGUMENT" = "group" ];
then

        $(which curl) -i -X PUT -d @$APP_DEFINITION -H "Content-Type: Application/json" $MARATHON/v2/groups
        printf "\n\nDeploying file: %s of type: %s\n" $APP_DEFINITION $ARGUMENT

else
        echo "Invalid option: $ARGUMENT"
        exit 1
fi
