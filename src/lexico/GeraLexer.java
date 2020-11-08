package lexico;

import java.io.*;

public class GeraLexer {
	public static void main(String args[]) throws IOException{
		String arq = "C:/ProjetosJavaEclipse/compilador_parte1/src/lexico/gramatica.flex";
		gerarLexer(arq);
	}
	
	public static void gerarLexer(String arq) {
		
		File file = new File(arq);
		jflex.Main.generate(file);
		
	}
	

}
