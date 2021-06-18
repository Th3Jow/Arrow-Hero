# Alterações OpenGL_Simulator

### defines.h:
~~~ C
59 #define CLS	    54  // "110110" = 54
//CLS Rx        -- Video[Rx]								  Format: < inst(6) | Rx(3) | xxxxxxx >
~~~

### simple_simulator.c:
~~~ C
239 case CLS:
		//printf("%c", ' ') DO REG[Ry] ATE FINAL;
		selM3 = 1;
		selM4 = 0;
		Video = 1;
		
		if((reg[rx] & 0x7f) < 32)
			c = pega_pedaco(32, 7, 0);

		else c = pega_pedaco(reg[rx], 7, 0);

		cor = pega_pedaco(reg[rx], 15, 8);

		for(i = reg[ry]; i < 1200; i++) {
			curses_out_char(c, i, cor);
		}
		// -----------------------------
		state=STATE_FETCH;
		break;
~~~

### simulator_curses.c:
~~~ C
418 case CLS:
        mvwprintw(codeWindow,y,x, "PC: %05d  |  CLSR%d, R%d       |   VIDEO[R%d] <- CHAR[R%d] ",pc, rx, ry, ry, rx);
        break;
~~~