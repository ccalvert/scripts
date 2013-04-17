# AWK String-processing functions
function RTrim(src) { sub(/[ \t]+$/, "", src); return src }
function LTrim(src) { sub(/^[ \t]+/, "", src); return src }
function Trim(src)  { return LTrim(RTrim(src)) }
# GAWK ONLY!
#function Trim(src)  {
#    return gensub(/[ \t]+$/, "", 1, gensub(/^[ \t]+/, "", 1, src))
#}
function Repeat(rln, pchr,    result) {
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
function Center(src, cln, pchr,    rln) {
    src = Trim(src)
    cln = cln - length(src)
    rln = int(cln / 2)
    return (Repeat(rln, pchr) src Repeat(cln - rln, pchr))
}


################################################################################
## ToCamelCase
##
## Converts FOO_BAR_BAZ or foo_bar_baz to FooBarBaz.
################################################################################
function ToCamelCase(strInput)
{
	strRes = ""
	delete array

	strTemp = toupper(strInput)
	
	iLen = split(strTemp, array, "")
	for (i = 2; i <= iLen; ++i)
	{
		if (array[i - 1] != "_")
			array[i] = tolower(array[i])
	}#for
	
	for (i = 1; i <= iLen; ++i)
	{
		strRes = strRes array[i]
	}#for
	
	return strRes
}#ToCamelCase