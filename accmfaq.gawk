BEGIN { bInHeaders = 1
	iTime		# system time
	strExpTime	# expiration date/time
	strZoneName # gets full name of time zone
	strZoneAbr	# gets time zone abbreviation
}#BEGIN

bInHeaders {
    if (! length)
    {
    	# Get the system time
    	iTime = systime()
    	# Add a week
    	iTime +=  604800
    	# Create text string of the time
        strExpTime = strftime("Expires: %d %B %Y  %H:%M:%S ", iTime)
        # Get the timezone info
        strZoneName = strftime("%Z", iTime)
        # Figure out the correct abbreviation
        if (strZoneName ~ /Eastern Standard Time/)
        {
        	strZoneAbr = "EST"
        }#if
        else if (strZoneName ~ /Eastern Daylight Time/)
        {
        	strZoneAbr = "EDT"
        }#else if
        
        # Append the zone abbreviation and print the line
        print strExpTime strZoneAbr
        bInHeaders = 0
    }#if
}#if

{ print }