extends Node

var gasolina = 105 #armazena o valor da gasolina
var permissao = false #permite o reabastecimento da gasolina de acordo com a distância percorrida pelo jogador no percurso
var notificacao = false #permite o funcionamento da notificação de bonus de volta

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

const ARQUIVO = "user://save.data"
var pontos_ranking=[]
var nomes_ranking=[]
#Função que salvará os dados do jogo
func salvar_dados():
	
	#Variável que armazena o arquivo que guardará os dados
	var arquivo = File.new()
	#Variável que guardará um valor caso tenha erro ao abrir o arquivo
	var erro = arquivo.open(ARQUIVO, File.WRITE)
	#Dicionário que guarda os dados
	var dados = {"points" : points,"nome" : nome}
	
	#Se não ocorrer erro os dados serão salvos
	if not erro:
		arquivo.store_var(dados)
	else:
		print("erro ao salvar dados")
		
	arquivo.close()
#Função que carrega os dados para o jogo	
func carregar_dados():
	
	#Variável que armazena o arquivo onde os dados serão carregados
	var arquivo = File.new()
	var erro = arquivo.open(ARQUIVO, File.READ)
	
	if not erro:
		#Variável que salva os dados que são resgatados do arquivo
		var dados_salvos = arquivo.get_var()
		pontos_ranking.append(points)
		nomes_ranking.append(nome)
	else:
		print("erro ao carregar dados")
		
	arquivo.close()
