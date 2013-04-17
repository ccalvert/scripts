{
	column = gensub(/m_dgc/, "", "", $3)
	
	if (/DataGridTextBoxColumn/)
	{
		printf("%s = new System.Windows.Forms.DataGridTextBoxColumn();\n", $3)
		printf("InitDGTBC(%s, string.Empty, \"%s\", \"%s\", 75);\n\n", $3, column, column)
	}
	
	else if (/DataGridBoolColumn/)
	{
		printf("%s = new System.Windows.Forms.DataGridBoolColumn();\n", $3)
		printf("InitDGBC(%s, \"%s\", \"%s\", 50, true);\n\n", $3, column, column)
	}
}