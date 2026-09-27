# Ping Pong Tower — LibreTower Mod Overlay

Este branch contém um mod/overlay para o projeto open-source LibreTower:
https://github.com/Applemunch/LibreTower

## O que muda

- Player vira uma bola de ping-pong desenhada por código.
- Mantém a física rápida, dash, corrida, super jump e colisões do LibreTower.
- Cenário é redesenhado por código com visual de arena/mesa de ping-pong.
- Sólidos viram superfícies azuis com linhas brancas.
- Obstáculos perigosos ficam vermelhos.
- Inimigos são desenhados como raquetes/robôs de treino.
- Coletáveis viram mini bolas de ping-pong.
- HUD vira placar de partida.
- Tela principal mostra PING PONG TOWER.

## Como instalar

1. Baixe o LibreTower original.
2. Copie os arquivos deste branch para dentro da pasta do LibreTower, mantendo os mesmos caminhos.
3. Substitua os arquivos quando solicitado.
4. Abra `LibreTower.yyp` no GameMaker.
5. Rode o projeto.

Este overlay não inclui os assets binários do LibreTower. Ele reaproveita o projeto base e altera apenas os arquivos de código necessários para o tema.

## Arquivos alterados

- `objects/obj_control/Create_0.gml`
- `objects/obj_control/Other_4.gml`
- `objects/obj_control/Draw_0.gml`
- `objects/obj_player/Draw_0.gml`
- `objects/obj_hud/Draw_64.gml`
- `objects/obj_mainmenu/Draw_64.gml`

LibreTower usa licença BSD 3-Clause. Preserve o arquivo LICENSE do projeto original ao redistribuir.
