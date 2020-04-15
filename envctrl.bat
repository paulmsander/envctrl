@echo off
set command=sh envctrl %1 

:getparm
	shift
	if {%1}=={} goto end
	set command=%command% %1

	goto getparm
:end
%command%
@echo on
