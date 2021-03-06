#!/usr/bin/env bash

last_merged_pr_branch=$(git log --oneline --merges master -1 | sed 's/^[^/]*\///')

echo ${last_merged_pr_branch}

if [[ ${last_merged_pr_branch} =~ ^release/major/.* ]];
then
	echo "Creating Major Release"
	gradle release -Prelease.disableChecks -Prelease.pushTagsOnly -Prelease.customKeyFile=".travis/id_rsa_partner_center.dec" -Prelease.versionIncrementer=incrementMajor -s;
elif [[ ${last_merged_pr_branch} =~ ^release/minor/.* ]];
then
	echo "Creating Minor Release"
	gradle release -Prelease.disableChecks -Prelease.pushTagsOnly -Prelease.customKeyFile=".travis/id_rsa_partner_center.dec" -Prelease.versionIncrementer=incrementMinor -s;
elif [[ ${last_merged_pr_branch} =~ ^release/.* ]];
then
	echo "Creating Patch Release"
	gradle release -Prelease.disableChecks -Prelease.pushTagsOnly -Prelease.customKeyFile=".travis/id_rsa_partner_center.dec" -Prelease.versionIncrementer=incrementPatch -s;
else
	echo "Release Regex not matched. No release will be built."
fi
