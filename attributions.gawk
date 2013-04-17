BEGIN {
	months["JAN"] = 1
	months["FEB"] = 2
	months["MAR"] = 3
	months["APR"] = 4
	months["MAY"] = 5
	months["JUN"] = 6
	months["JUL"] = 7
	months["AUG"] = 8
	months["SEP"] = 9
	months["OCT"] = 10
	months["NOV"] = 11
	months["DEC"] = 12

	months["JANUARY"] = 1
	months["FEBRUARY"] = 2
	months["MARCH"] = 3
	months["APRIL"] = 4
	months["MAY"] = 5
	months["JUNE"] = 6
	months["JULY"] = 7
	months["AUGUST"] = 8
	months["SEPTEMBER"] = 9
	months["OCTOBER"] = 10
	months["NOVEMBER"] = 11
	months["DECEMBER"] = 12
}

{
	if (/^[> ]*From:/)
	{
		# Find the colon at the end of "From:"
		pos_colon = match($0, /:/)
#		print "pos_colon = " pos_colon
		if (pos_colon > 0)
		{
			# Find the "<" at the beginning of the email address
			pos_less_than = match($0, /</)
			# If not found, check for a bracket instead
			if (0 == pos_less_than)
			{
				pos_less_than = match($0, /\[/)
			}
#			print "pos_less_than = " pos_less_than
			if (pos_less_than > 0)
			{
				strFrom = substr($0, pos_colon + 2, (pos_less_than - 1) - (pos_colon + 2))
				strFrom = gensub(/\"/, "", "g", strFrom)
			}
			else
			{
				pos_name = match($0, /From: /)
				strFrom = substr($0, RSTART + RLENGTH)
			}
		}
	}

	else if (/^[> ]*(Sent|Date):/)
	{
		# Thu Apr 10 10:04:53 2008
		pos = match($0, /[A-Z][a-z][a-z] [A-Z][a-z][a-z] [0-9][0-9] [0-9][0-9]:[0-9][0-9]:[0-9][0-9] [0-9][0-9][0-9][0-9]/)
		if (pos > 0)
		{
			month = months[toupper(substr($0, pos + 4, 3))]
			day = substr($0, pos + 8, 2)
			year = substr($0, pos + 20, 4)
			time = substr($0, pos + 11, 8)
		}
		# July 20, 2009 1:26:48 PM EDT
		pos = match($0, /[A-Z][a-z]+ [0-9]+, [0-9][0-9][0-9][0-9] [0-9]+:[0-9]+:[0-9]+ (am|AM|pm|PM) [A-Z][A-Z][A-Z]/)
#		print "pos = " pos
		if (pos > 0)
		{
			split(substr($0, pos), fields)
			month = months[toupper(fields[1])]
#			print "fields[2] = \"" fields[2] "\""
			day = substr(fields[2], 1, 2)
			year = fields[3]
			time = fields[4] " " fields[5] " " fields[6]
		}
		
		# Dec 19, 2008 1:30 PM
		pos = match($0, /[A-Z][a-z][a-z] [0-9]+, [0-9][0-9][0-9][0-9] [0-9]+:[0-9]+ (am|AM|pm|PM)/)
		if (pos > 0)
		{
			split(substr($0, pos), fields)
			month = months[toupper(fields[1])]
			day = substr(fields[2], 2)
			year = fields[3]
			time = fields[4] " " fields[5]
		}
		
		# Wed, Nov 19, 2008 at 2:28 PM
		pos = match($0, /[A-Z][a-z][a-z], [A-Z][a-z][a-z] [0-9]+, [0-9][0-9][0-9][0-9] at [0-9]+:[0-9][0-9]/)
		if (pos > 0)
		{
			count = split($0, tokens_on_comma, ",")
			month = months[toupper(substr($0, pos + 5, 3))]
			day = substr(tokens_on_comma[2], 6)
			year = substr(tokens_on_comma[3], 2, 4)
			time = substr(tokens_on_comma[3], 10)
		}

		
		# Friday, February 29, 2008 12:49 PM
		pos = match($0, /[A-Z][a-z]+, [A-Z][a-z]+ [0-9]+, [0-9][0-9][0-9][0-9] [0-9]+:[0-9]+(:[0-9]+)* (am|AM|pm|PM)/)
		if (pos > 0)
		{
			split(substr($0, pos), fields)
			month = months[toupper(substr(fields[2], 1, 3))]
			day = gensub(/,/, "", "", fields[3])
			year = fields[4]
			time = fields[5] " " fields[6]
		}

		# Sunday, October 17, 2010 11:42:04 AM
		pos = match($0, /[A-Z][a-z]+, [A-Z][a-z]+ [0-9]+, [0-9][0-9][0-9][0-9] [0-9]+:[0-9]+:[0-9]+ (am|AM|pm|PM)/)
		if (pos > 0)
		{
			split(substr($0, pos), fields)
			month = months[toupper(substr(fields[2], 1, 3))]
			day = gensub(/,/, "", "", fields[3])
			year = fields[4]
			time = fields[5] " " fields[6]
		}
		
		# 18 December 2008 08:35
		pos = match($0, /[0-9]+ [A-Z][a-z]+ [0-9][0-9][0-9][0-9] [0-9][0-9]:[0-9][0-9]/)
		if (pos > 0)
		{
			split(substr($0, pos), fields)
			month = months[toupper(substr(fields[2], 1, 3))]
			day = fields[1]
			year = fields[3]
			time = fields[4]
		}
		
		# Wed, 14 Jan 2009 6:18 pm
		pos = match($0, /[A-Z][a-z]+, [0-9]+ [A-Z][a-z]+ [0-9][0-9][0-9][0-9] [0-9]+:[0-9]+ (am|AM|pm|PM)/)
		if (pos > 0)
		{
			split(substr($0, pos), fields)
			month = months[toupper(fields[3])]
			day = fields[2]
			year = fields[4]
			time = fields[5] " " fields[6]
		}
		
		# Sat 2/13/2010 2:52 PM
		pos = match($0, /[A-Z][a-z]+ [0-9]+\/[0-9]+\/[0-9][0-9][0-9][0-9] [0-9]+:[0-9]+ (am|AM|pm|PM)/)
		if (pos > 0)
		{
			split(substr($0, pos), fields)
			split(fields[2], datefields, /\//)
			month = datefields[1]
			day = datefields[2]
			# Handle European date format.  Fails for days <= 12.
			if (month > 12)
			{
				temp = day
				day = month
				month = temp
			}
			year = datefields[3]
			time = fields[3] " " fields[4]
		}
		
		
		strSent = sprintf("%d/%d/%d %s", month, day, year, time)
#		print "strSent = \"" strSent "\""

	}
}

END {
	printf("On %s, %s wrote:\n", strSent, strFrom)
}