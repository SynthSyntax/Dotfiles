#!/bin/bash

API_KEY="b74178d971ca0291523189a9d07fad09"
CITY="Zurich"
UNITS="metric"  # or 'imperial'
SYMBOL="°C"     # or '°F'

weather=$(curl -sf "https://api.openweathermap.org/data/2.5/weather?q=${CITY}&appid=${API_KEY}&units=${UNITS}")
if [ ! -z "$weather" ]; then
    temp=$(echo "$weather" | jq ".main.temp" | cut -d "." -f 1)
    desc=$(echo "$weather" | jq -r ".weather[0].main")
    echo "${desc} ${temp}${SYMBOL}"
else
    echo "N/A"
fi
