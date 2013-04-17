BEGIN {
	
	FS = "[ ,()]"
	
	arTypes["BIGINT"]			= "System.Data.SqlDbType.BigInt"
	arTypes["BINARY"]			= "System.Data.SqlDbType.Binary"
	arTypes["BIT"]				= "System.Data.SqlDbType.Bit"
	arTypes["CHAR"]				= "System.Data.SqlDbType.Char"
	arTypes["DATETIME"] 		= "System.Data.SqlDbType.DateTime"
	arTypes["DECIMAL"]			= "System.Data.SqlDbType.Decimal"
	arTypes["FLOAT"]			= "System.Data.SqlDbType.Float"
	arTypes["IMAGE"]			= "System.Data.SqlDbType.Image"
	arTypes["INT"]				= "System.Data.SqlDbType.Int"
	arTypes["INTEGER"]			= "System.Data.SqlDbType.Int"
	arTypes["MONEY"]			= "System.Data.SqlDbType.Money"
	arTypes["NCHAR"]			= "System.Data.SqlDbType.NChar"
	arTypes["NTEXT"]			= "System.Data.SqlDbType.NText"
	arTypes["NVARCHAR"]			= "System.Data.SqlDbType.NVarChar"
	arTypes["REAL"]				= "System.Data.SqlDbType.Real"
	arTypes["SMALLDATETIME"]	= "System.Data.SqlDbType.SmallDateTime"
	arTypes["SMALLINT"]			= "System.Data.SqlDbType.SmallInt"
	arTypes["SMALLMONEY"]		= "System.Data.SqlDbType.SmallMoney"
	arTypes["TEXT"]				= "System.Data.SqlDbType.Text"
	arTypes["TIMESTAMP"]		= "System.Data.SqlDbType.TimeStamp"
	arTypes["TINYINT"]			= "System.Data.SqlDbType.TinyInt"
	arTypes["UNIQUEIDENTIFIER"]	= "System.Data.SqlDbType.UniqueIdentifier"
	arTypes["VARBINARY"] 		= "System.Data.SqlDbType.VarBinary"
	arTypes["VARCHAR"] 			= "System.Data.SqlDbType.VarChar"

	arSizes["BIGINT"]			= 8
	arSizes["BIT"]				= 1
	arSizes["DATETIME"] 		= 8
	arSizes["DECIMAL"]			= 16
	arSizes["FLOAT"]			= 8
	arSizes["INT"]				= 4
	arSizes["INTEGER"]			= 4
	arSizes["MONEY"]			= 8
	arSizes["REAL"]				= 4
	arSizes["SMALLDATETIME"]	= 4
	arSizes["SMALLINT"]			= 2
	arSizes["SMALLMONEY"]		= 4
	arSizes["TIMESTAMP"]		= 8
	arSizes["TINYINT"]			= 1
}

{
#	for (i = 1; i <= NF; ++i)
#		print "field " i " = " $i

	printf("\t\t\t\t\tthis.%s.Parameters.Add(\n", strSQLCmd)
	print "\t\t\t\t\t\tnew System.Data.SqlClient.SqlParameter("
	printf("\t\t\t\t\t\t\t\"%s\",\n", $1)
	printf("\t\t\t\t\t\t\t%s,\n", arTypes[toupper($2)])
	if (NF == 3)
		printf("\t\t\t\t\t\t\t%d\n", arSizes[toupper($2)])
	else
		printf("\t\t\t\t\t\t\t%s\n", $3)
	print "\t\t\t\t\t\t)"
	print "\t\t\t\t\t);"

}