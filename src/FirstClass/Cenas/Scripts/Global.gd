extends Node

var gasolina = 150 #armazena o valor da gasolina
var permissao = false #permite o reabastecimento da gasolina de acordo com a distância percorrida pelo jogador no percurso
var reset = false #permite o reabastecimento da gasolina ao fim do percurso
var points = 0 #armazena a pontuação do jogador

var debuf = false
var debuf2 = false
# Variaveis globais responsáveis por guardar a informação se o jogador está com algum dos debufs de
# Carga ou celular ativos.

var cargaDoCaminhao = 0
#armazena o valor que define o sprite utilizado de acordo com a seleção do usuário

var nome #variável responsável por guardar o nome do usuário
var nomeInstrutor #variável responsável por guarsar o nome do instritor
