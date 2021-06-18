# Alterações Simulador

### Mneumonicos.h:
~~~ C
14 #define LNAND 54
~~~

### Model.cpp:
~~~ C++
521 case CLS:
		if(reg[ry] > 1199 || reg[ry] < 0)
		{	cout << "ERRO - posição da tela " << re[ry] << "invalida" << endl;
		    break;
		}

		letra = reg[rx] & 0x7f;

		if(letra > 32)
      		temp = letra;
		else
			temp = 32;

		for(i = reg[ry]; i < 1200; i++) {
			block[i].color = pega_pedaco(reg[rx], 11, 8);
      		block[i].sym = temp * 8;
			Vid->updateVideo(i);
		}
		break;
~~~

### View.cpp:
~~~ C++
223 case CLS:	sprintf(texto, "PC: %05d\t|	CLS R%d, R%d	|	video[R%d] <- char[R%d]", pc, _rx, _ry, _ry, _rx); break;
~~~