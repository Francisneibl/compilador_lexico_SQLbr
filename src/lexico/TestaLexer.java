package lexico;
import java.io.*;

public class TestaLexer {
	public static void main(String args[]) throws IOException{
		
		String arq = "C:/ProjetosJavaEclipse/compilador_parte1/programa.txt";
		
		BufferedReader in = new BufferedReader(new FileReader(arq));
		
		Lexer analise = new Lexer(in);
		
		while(true) {
			 Token token = analise.yylex();
			 
			 if(token == null) break;
		}
	}
}
