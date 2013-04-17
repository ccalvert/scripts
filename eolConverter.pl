#!/usr/bin/perl -w
#
# $Id: eolConverter.pl,v 1.1.1.1 2001/06/11 22:13:21 daviddpd Exp $

# Converts Line Endings from Mac-DOS-UNIX to Mac-DOS-UNIX
# Copyright (C) 2001, David P. Discher <dpd@dpdtech.com>
# 
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
#  <http://www.gnu.org/copyleft/gpl.html>

# Usage [perl -w] <program> <file> <unix, mac, dos> [ > <output> ]
# output goes to stdout.
# Get the File Name

if ( $ARGV[0] eq "" ) {
	print STDERR "What file am I suppose to open? -> $ARGV[0] \n";
	print STDERR "  Usage:  $0 <filename> <unix, mac, dos> [ > output ]\n";
	exit -1;
}

# what to I translate to?

$type = "";
if ( $ARGV[1] eq "" ) {	
	print STDERR " *** DEFAULT IS UNIX!  Setting Output to UNIX! *** \n";
	$type = "unix";
} else {

	$type = lc($ARGV[1]);
		
	if (
		($type eq "unix") &&
		($type eq "dos") &&
		($type eq "mac") 
	) {  
		print STDERR " *** Opps, I don't know -> $type !";
		exit -1;
	}

}


#		Dec	/	HEX	ASCII
# LF  = 10 		x0a
# CR  = 13		x0d
#
# Just for reference
# FF  = 12		x0c

# Line Endings .... Why didn't everybody use the UNIX line endings?

# dos     <CR><LF>	\x0d\x0a
$dos = "\x0d\x0a";

# unix    <LF>		\x0a
$unix = "\x0a";

# mac     <CR>		\x0d
$mac = "\x0d";


$newline = "{!_NEWLINE!}";		# hopefully this is unique for any file
								# If you have anything better, go for it.

$convert_to = "";

open(fh1,"<$ARGV[0]");			# open the file

	while ( <fh1> ) {			# while not EOF ... not EOL !	
	
		$_	=~	s/\x0d\x0a/$newline/g;		# find dos
		$_	=~	s/\x0a/$newline/g;			# find UNIX		
		$_	=~	s/\x0d/$newline/g;			# find Mac

		if ($type eq "unix") {
					$convert_to = $unix;	# set converter to unix
			}
				elsif ($type eq "mac") {
					$convert_to = $mac;		# set converter to mac
			}
				elsif ($type eq "dos") {
					$convert_to = $dos;		# set converter to dos
		}
		
		$_	=~	s/$newline/$convert_to/g;	# convert to correct line endings

		print $_;							# put results to STDOUT
		
	}
close(fh1);						# be kind and clase the file.
