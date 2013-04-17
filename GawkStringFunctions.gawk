# AWK String-processing functions

function RTrim(src) { sub(/[ \t]+$/, "", src); return src }

function LTrim(src) { sub(/^[ \t]+/, "", src); return src }

#function Trim(src)  { return LTrim(RTrim(src)) }

# GAWK ONLY!
function Trim(src)  {
    return gensub(/[ \t]+$/, "", 1, gensub(/^[ \t]+/, "", 1, src))
}

function Repeat(rln, pchr, result) {
    if (rln > 0) {
	result = sprintf("%*s", rln, pchr)
	gsub(/ /, pchr, result)
    }
    else result = ""
    return result
}

function LPad(src, rln, pchr) {
    return (Repeat(rln - length(src), pchr) src)
}

function RPad(src, rln, pchr) {
    return (src Repeat(rln - length(src), pchr))
}

function ELength(src, tln) {
    gsub(/[\t]/, Repeat(tln ? tln : 8, " "), src)
    return length(src)
}

function Center(src, cln, pchr, rln) {
    src = Trim(src)
    cln = cln - length(src)
    rln = int(cln / 2)
    return (Repeat(rln, pchr) src Repeat(cln - rln, pchr))
}

#*******************************************************************************
#** TrimChar
#**
#** Trims one (if multi == 0) or all (if multi > 0) occurences of char from
#** the beginning and end of src
#**
#** Arguments:
#**
#**	src		- string to be trimmed.  Modified in place.
#**	char	- char to be trimmed from src
#**	multi	- indicates whether or not multiple consecutive occurences of char
#**			  will be trimmed
#**
#** Return values: modified string
#*******************************************************************************

function TrimChar(src, char, multi)
{
	# Create the regexp to trim the chars from the beginning.
	# If we should trim multiple occurences of the sequence,
	# append the "+" operator to the expression
	sRegExpBegin = "^[" char "]" (multi > 0 ? "+" : "")
	# Create the regexp to trim the chars from the end.
	# If we should trim multiple occurences of the sequence,
	# append the "+" operator to the expression
	sRegExpEnd = "[" char (multi > 0 ? "]+$" : "]$")
	return gensub(sRegExpEnd, "", 1, gensub(sRegExpBegin, "", 1, src))
}
