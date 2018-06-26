#!/bin/bash
# deploy to netlify
if [ ! -z "$ACCESS_TOKEN" ]
then
	netlify deploy --access-token $NETLIFY_TOKEN
else
	netlify deploy
fi