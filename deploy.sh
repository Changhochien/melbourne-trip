#!/bin/bash
# Trigger Netlify build via the build hook
curl -s -X POST "https://api.netlify.com/build_hooks/69dcc39014af381f853baa75"
echo ""
echo "Netlify build triggered."
