@echo off

REM Process the faq to add the "Expires" header and stick it in the Posts directory
gawk -f c:\bat\accmfaq.gawk "C:\Documents and Settings\ccalvert\My Documents\Newsgroups\accm\accmfaq.ngp" > "C:\Documents and Settings\ccalvert\My Documents\Newsgroups\accm\Posts\accmfaq.post"


cd "C:\Documents and Settings\ccalvert\My Documents\Newsgroups\accm\Posts"

call doit.bat skip

REM Post the news messages
postnews /f:accmfaq.ngp /s:news.newsguy.com /D /u:ccalvert /p:Timp4ng