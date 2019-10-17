#############################################################################
#                     U N R E G I S T E R E D   C O P Y
# 
# You are on day 7 of your 30 day trial period.
# 
# This file was produced by an UNREGISTERED COPY of Parser Generator. It is
# for evaluation purposes only. If you continue to use Parser Generator 30
# days after installation then you are required to purchase a license. For
# more information see the online help or go to the Bumble-Bee Software
# homepage at:
# 
# http://www.bumblebeesoftware.com
# 
# This notice must remain present in the file. It cannot be removed.
#############################################################################

#############################################################################
# myparser.v
# YACC verbose file generated from myparser.y.
# 
# Date: 10/17/19
# Time: 16:11:23
# 
# AYACC Version: 2.07
#############################################################################


##############################################################################
# Rules
##############################################################################

    0  $accept : lines $end

    1  lines : lines expr ';'
    2        | lines ';'
    3        |

    4  expr : expr PLUS expr
    5       | expr MINUS expr
    6       | expr TIMES expr
    7       | expr OVER expr
    8       | LP expr RP
    9       | MINUS expr
   10       | NUMBER
   11       | ID


##############################################################################
# States
##############################################################################

state 0
	$accept : . lines $end
	lines : .  (3)

	.  reduce 3

	lines  goto 1


state 1
	$accept : lines . $end  (0)
	lines : lines . expr ';'
	lines : lines . ';'

	$end  accept
	';'  shift 2
	MINUS  shift 3
	LP  shift 4
	NUMBER  shift 5
	ID  shift 6

	expr  goto 7


state 2
	lines : lines ';' .  (2)

	.  reduce 2


state 3
	expr : MINUS . expr

	MINUS  shift 3
	LP  shift 4
	NUMBER  shift 5
	ID  shift 6

	expr  goto 8


state 4
	expr : LP . expr RP

	MINUS  shift 3
	LP  shift 4
	NUMBER  shift 5
	ID  shift 6

	expr  goto 9


state 5
	expr : NUMBER .  (10)

	.  reduce 10


state 6
	expr : ID .  (11)

	.  reduce 11


state 7
	lines : lines expr . ';'
	expr : expr . PLUS expr
	expr : expr . MINUS expr
	expr : expr . TIMES expr
	expr : expr . OVER expr

	';'  shift 10
	PLUS  shift 11
	MINUS  shift 12
	TIMES  shift 13
	OVER  shift 14


state 8
	expr : expr . PLUS expr
	expr : expr . MINUS expr
	expr : expr . TIMES expr
	expr : expr . OVER expr
	expr : MINUS expr .  (9)

	.  reduce 9


state 9
	expr : expr . PLUS expr
	expr : expr . MINUS expr
	expr : expr . TIMES expr
	expr : expr . OVER expr
	expr : LP expr . RP

	PLUS  shift 11
	MINUS  shift 12
	TIMES  shift 13
	OVER  shift 14
	RP  shift 15


state 10
	lines : lines expr ';' .  (1)

	.  reduce 1


state 11
	expr : expr PLUS . expr

	MINUS  shift 3
	LP  shift 4
	NUMBER  shift 5
	ID  shift 6

	expr  goto 16


state 12
	expr : expr MINUS . expr

	MINUS  shift 3
	LP  shift 4
	NUMBER  shift 5
	ID  shift 6

	expr  goto 17


state 13
	expr : expr TIMES . expr

	MINUS  shift 3
	LP  shift 4
	NUMBER  shift 5
	ID  shift 6

	expr  goto 18


state 14
	expr : expr OVER . expr

	MINUS  shift 3
	LP  shift 4
	NUMBER  shift 5
	ID  shift 6

	expr  goto 19


state 15
	expr : LP expr RP .  (8)

	.  reduce 8


state 16
	expr : expr PLUS expr .  (4)
	expr : expr . PLUS expr
	expr : expr . MINUS expr
	expr : expr . TIMES expr
	expr : expr . OVER expr

	TIMES  shift 13
	OVER  shift 14
	.  reduce 4


state 17
	expr : expr . PLUS expr
	expr : expr MINUS expr .  (5)
	expr : expr . MINUS expr
	expr : expr . TIMES expr
	expr : expr . OVER expr

	TIMES  shift 13
	OVER  shift 14
	.  reduce 5


state 18
	expr : expr . PLUS expr
	expr : expr . MINUS expr
	expr : expr TIMES expr .  (6)
	expr : expr . TIMES expr
	expr : expr . OVER expr

	.  reduce 6


state 19
	expr : expr . PLUS expr
	expr : expr . MINUS expr
	expr : expr . TIMES expr
	expr : expr OVER expr .  (7)
	expr : expr . OVER expr

	.  reduce 7


##############################################################################
# Summary
##############################################################################

12 token(s), 3 nonterminal(s)
12 grammar rule(s), 20 state(s)


##############################################################################
# End of File
##############################################################################
