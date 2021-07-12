%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#include "tamazgha.tab.h"



int line=1;
%}


%%




"while"                   return(WHILE_LOOP);





%%
