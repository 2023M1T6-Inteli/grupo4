extends Node

var dificuldade = "" #armazena a dificuldade selecionada pelo jogador
var gasolina = 105 #armazena o valor da gasolina
var permissao = false #permite o reabastecimento da gasolina de acordo com a distância percorrida pelo jogador no percurso

var points = 0 #armazena a pontuação do jogador

var qualDebuf = "Nada" # Identifica qual debuf foi pego pelo jogador
var debuf = false
var debuf2 = false
# Variaveis globais responsáveis por guardar a informação se o jogador está com algum dos debufs de
# Carga ou celular ativos.

var cargaDoCaminhao = 0
#armazena o valor que define o sprite utilizado de acordo com a seleção do usuário

var nome #variável responsável por guardar o nome do usuário
var nomeInstrutor #variável responsável por guardar o nome do instritor
var rostoInstrutor #variável responsável por guardar a animação do instrutor

var lingua = "pt" #variável que guarda a linguagem escolhida pelo jogador
var mapa = 1 #variável que guarda o mapa escolhido pelo jogador

