# Alterações Montador

### defs.h:
~~~ C
106 #define CLS                    98
126 #define CLS                 "110110"
198 #define CLS_STR              "CLS"
~~~

### montador.c:
~~~ C
219 case CLS_CODE :
599 case CLS_CODE :
    str_tmp1 = parser_GetItem_s();
    val1 = BuscaRegistrador(str_tmp1);
    free(str_tmp1);
    parser_Match(',');
    str_tmp2 = parser_GetItem_s();
    val2 = BuscaRegistrador(str_tmp2);
    free(str_tmp2);
    str_tmp1 = ConverteRegistrador(val1);
    str_tmp2 = ConverteRegistrador(val2);
    sprintf(str_msg,"%s%s%s0000",CLS,str_tmp1,str_tmp2);
    free(str_tmp1);
    free(str_tmp2);
    parser_Write_Inst(str_msg,end_cnt);
    end_cnt += 1;
    break;

2254 else if (strcmp(str_tmp,CLS_STR) == 0)
    {
        return CLS_CODE;
    }
~~~