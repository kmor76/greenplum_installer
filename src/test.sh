#!/bin/bash
set -f

OM_TANBLES=(
om_application
om_option_type_nick
om_option_type
om_trial_tariff
om_tariff_with_options
om_fresh_subscriber
om_user_organization_subscriber
om_user_organization_user
om_user
om_options_package_owner
om_user_organization
om_options_package_purchase_type
om_options_package
om_option
)

for om_table in "${OM_TANBLES[@]}"
do
 command="docker exec -it trino trino --catalog postgres --schema public --user admin --execute 'SELECT * from \"$om_table\"' --output-format  CSV_HEADER_UNQUOTED > /tmp/$om_table.csv"
 eval $command
done
