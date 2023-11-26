function onLogin(cid) 
doCreatureSetStorage(cid, 1219, os.time()) 
return true 
end 
function 
onLogout(cid) 
doCreatureSetStorage(cid, 1219, 0) 
return true 
end