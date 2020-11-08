package lexico; //nome do pacote onde geramos o analisador

import static lexico.Token.*; //importamos a classe Enum com as constantes dos tipos de tokens

%%
//onde inserimos o metodo que retorna a classificação do lexema
%{

	private void imprimir(String token, String lexema){
		System.out.println(lexema + " --> "+token);
	}

%}

%class Lexer //nome da classe que sera gerada pelo Jflex.

%type Token //definição da classe Enum Token como tipo de retorno do yytext().

//aqui definimos as regras gramaticais 

digito = [0-9]
literal = \" [^\"\n\r]* \"   //indicamor tudo que esteja entre aspas duplas exeto saldo de linha \n aspas duplas \" e retrocesso \r
operadorAritimetico = "+" | "-" | "/"| "*"
operadorComparacao = "<>" | "<=" | ">=" | "<" | ">" | "=" 
operadorLogico = .OU. | .E.
identificador = [_a-zA-Z][_a-zA-Z_]*
branco = [\n\t\r ]+
inteiro = {digito}+
decimal = {inteiro}"."{inteiro}
fimInstrucao = ";"

palavraChave = "MOSTRAR" | "DE" | "ONDE" | "ORDENAR_POR" | "ATUALIZAR" | "COMO" | "EXCLUIR_DE" | "CONTENHA"
%% //fim da seção

//identificando palavras chaves
{palavraChave}  {imprimir("PALAVRA CHAVE",yytext()); return PALAVRA_CHAVE; }
{identificador} {imprimir("IDENTIFICADOR",yytext()); return IDENTIFICADOR; }
{operadorAritimetico} {imprimir("OPERADOR ARITIMETICO",yytext()); return OPERADOR_ARITIMETICO;}
{inteiro} {imprimir("INTEIRO",yytext()); return INTEIRO;}
{decimal} {imprimir("DECIMAL",yytext()); return DECIMAL;}
{operadorComparacao} {imprimir("OPERADOR COMPARACAO",yytext()); return OPERADOR_COMPARACAO;}
{operadorLogico} {imprimir("OPERADOR LOGICO",yytext()); return OPERADOR_LOGICO;}
{literal} {imprimir("LITERAL",yytext()); return LITERAL;}
{fimInstrucao} {imprimir("FIM INSTRUCAO", yytext()); return PTV;}
{branco} {return BRANCO; }

. {imprimir ("<<< CARACTER NÃO VALIDO!!! >>> ",yytext()); return ERROR; } //caracteres não reconhecidos pela gramatica, serão reconhecidos por (.);
<<EOF>> {return null;}
