UPDATE usuario
SET nome = $ { nome },
    nick = $ { nick },
    dtNasc = $ { dtNasc },
    email = $ { email },
    senha = $ { senha },
    foto_perfil = $ { foto }
WHERE id_usuario = $ { id_usuario };