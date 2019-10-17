%{
/****************************************************************************
myparser.y
ParserWizard generated YACC file.

Date: 2019脛锚10脭脗17脠脮
****************************************************************************/

#include<iostream>
#include<cctype>
using namespace std;
%}

// place any declarations here
%include {
#ifndef YYSTYPE
#define YYSTYPE string
#endif
}

%name myparser
// class definition
{
	// place any extra class members here
	virtual int yygettoken();
	string py;
	string lxy;
}
// constructor
{
	// place any extra initialisation code here
}

// destructor
{
	// place any extra cleanup code here
}


%token PLUS
%token MINUS 
%token TIMES 
%token OVER
%token LP 
%token RP
%token NUMBER 
%token ID

%left PLUS MINUS
%left TIMES OVER
%right UMINUS

%%

lines : lines expr ';' {cout<<$2<<endl;}
      | lines ';'
      |
      ;
      
expr : expr PLUS expr {$$=$1+$3+"+";}
  | expr MINUS expr {$$=$1+$3+"-";}
  | expr TIMES expr {$$=$1+$3+"*";}
  | expr OVER expr {$$=$1+$3+"/";}
  | LP expr RP  {$$=$2;}
  | MINUS expr %prec UMINUS {$$="-"+$2;}
  | NUMBER {$$=py.c_str();}
  | ID {$$=lxy.c_str();}
  ;

%%

int YYPARSERNAME::yygettoken()
{
    int t;
	while(1){
	    t=getchar();
		if(t==' '||t=='\t'||t=='\n')
		   continue;
		if(isdigit(t)){
		    string temp="";
			while(isdigit(t)){
			    temp.append(1,t);
				t=getchar();
			}
			py=temp;
			ungetc(t,stdin);
			return NUMBER;
		}
        if((t>='a'&&t<='z')||(t>='A'&&t<='Z')||(t=='_')){
		     string temp2="";
			 while((t>='a'&&t<='z')||(t>='A'&&t<='Z')||(t=='_')||isdigit(t))
			 {
			       temp2.append(1,t);
				   t=getchar();
			 }
			 lxy=temp2;
			 ungetc(t,stdin);
			 return ID;
		}
        if(t=='+')
		{
		  return PLUS;
		}
		if(t=='-')
		{
		  return MINUS;
		}
		if(t=='*')
		{
		  return TIMES;
		}
		if(t=='/')
		{
		  return OVER;
		}
		if(t=='(')
		{
		  return LP;
		}
		if(t==')')
		{
		  return RP;
		}
		return t;
    }		
}
int main(int argc, char *argv[])
{
	int n = 1;
	myparser parser;
	if (parser.yycreate()) {
			n = parser.yyparse();
	}
	getchar();
	return n;
}