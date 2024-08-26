--object update functions
function updatee(e)
	if(type(e)=="table") then
		e.update()
	else
		return
	end
end

function roomupdate(r)
	if (type(r)=="table") then
		r.update()
	else
		return
	end
end
