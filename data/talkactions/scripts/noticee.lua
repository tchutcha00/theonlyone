--- Criado por Absolute ---
function onSay(cid, words, param)
file = io.open('noticia.txt','r')
notice = file:read(-1)
doShowTextDialog(cid,8976,notice)
file:close()
end