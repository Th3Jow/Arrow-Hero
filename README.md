# Projeto Organização de Computadores Digitais

* SSC0511 - Organização de Computadores Digitais
* Professor: Eduardo do Valle Simões
* Ano: 2020

## O que é o projeto ?
O projeto tem como objetivo explorar na prática os conhecimentos teóricos acerca da lógica digital e de organização de computadores que, dentre outros, é relevante destacar os blocos lógicos, arquitetura de computadores, barramentos e linguagem assembly. Possui 2 partes que serão desenvolvidas a partir do Processador ICMC desenvolvido no ICMC-USP:
* Implementação de uma nova função no [Processador ICMC](https://github.com/simoesusp/Processador-ICMC);

* Realização de um jogo eletrônico em Assembly com o Processador ICMC.

## Parte 1 <h1>
A função implementada foi a `CLS (Clear Screen ou Limpa Tela)` que tem o objetivo de deixar a tela vazia a partir de um determinado ponto, passado como parâmetro, até o final da tela. Além disso, a função, também, pode imprimir repetidas vezes na tela um mesmo caractere passado como parâmetro, desde que esse parâmetro seja maior que 32, caso contrário, a tela será apagada, conforme o papel principal da função. A sintaxe da função, onde `Rx` e `Ry` são dois registradores (podendo ser iguais), é:

    CLS Rx, Ry

## Parte 2 <h1>
### Jogo: Arrow Hero
Objetivo: Acertar o maior numero de sequências de setas mostradas na tela.

# Instalação

## Windows:
1. Faça o download do arquivo `Arrow_Hero_Windows.zip`

2. Descompacte o arquivo

3. Execute o `sublime_text.exe` dentro da pasta `Sublime Text 3`

4. `No Sublime Text`, abra o arquivo `Arrow_Hero.asm`

5. Pressione o `F7` e um simulador irá ser aberto. Existem 3 comandos para esse simulador:
    
        Insert: reinicia a simulação;
		Home: alterna para o modo Automático ou Manual;
		End: executa um passo do seu programa (usado para uma execução passo a passo).

6. Basta pressionar o botão `Home` do teclado e jogar !!!

## Linux:
### Método 1 (usando o editor Sublime Text):
0. Instale o [Sublime Text](https://www.sublimetext.com/).

1. Instale o GTK:

        sudo apt install libcanberra-gtk-module
        sudo apt install libgtk2.0-dev

2. Descubra onde é o diretório de configuração do seu sublime. Normalmente ele se encontra no .config da sua Home.
		
        ~/.config/sublime-text-3/

3. Dentro deste diretório existe uma subdiretório chamado Packages. Copie para a pasta `Packages` os arquivos `icmc.tmLanguage` e o `icmc_processor.sublime-build` contidos em `Processador_modificado/Sublime_config` (substitua o diretório especificamente para o da sua máquina).
		
        sudo cp icmc.tmLanguage icmc_processor. sublime-build ~/.config/sublime-text-3/Packages/
	
4. Copie o arquivo `buildandrun` contido em `Processador_modificado/Sublime_config` para a pasta `/usr/bin` 
		
        sudo cp buildandrun /usr/bin/
		
5. Copie os arquivos `sim` e `montador` contidos, respectivamente, em `Processador_modificado/simulador_fonte` e `Processador_modificado/montador_fonte`  para a pasta `/usr/bin`
		
        sudo cp sim /usr/bin/
	sudo cp montador /usr/bin/
		
6. Com o Sublime Text aberto, abra o arquivo `Arrow_Hero.asm`
	
7. Dê um F7 para montar e rodar o programa
	
8. Uma janela do simulador irá se abrir. Existem 3 comandos para esse simulador:
		
        Insert: reinicia a simulação;
		Home: alterna para o modo Automático ou Manual;
		End: executa um passo do seu programa (usado para uma execução passo a passo);

9. Basta pressionar o botão `Home` do teclado e jogar !!!

OBS.: Caso necessário gerar o executável `montador`, vá até `Processador_modificado/montador_fonte` e depois, no terminal, execute `gcc -o montador *c` , em seguida execute `sudo chmod +x ./montador`

Caso necessário gerar o executável `sim`, vá até `Processador_modificado/simulador_fonte` e depois, no terminal, execute `sh compila.sh` , em seguida execute `sudo chmod +x ./sim`

### [Método 2](https://github.com/simoesusp/Processador-ICMC/tree/master/OpenGL_Simulator):
### Montador: <h1>
1. Vá na pasta que contem os arquivos do montador: `Processador_modificado/montador_fonte`

2. Copie o executável `montador` para a pasta do jogo `Arrow_Hero.asm`

3. Para montar o código: `./montador <nome_do_arquivo>.asm <nome_do_arquivo_de_saida>.mif`

4. Esse `.mif` será utilizado posteriormente no OpenGL_Simulator.

OBS.: Caso necessário gerar o executável `montador`, repita o `passo 1` e depois, no terminal, execute `gcc -o montador *c` , em seguida execute `sudo chmod +x ./montador`

### OpenGL_Simulator: <h1>
### Dependências
Ubuntu e derivados: `sudo apt update && sudo apt install libglfw3-dev libglew-dev libncurses5-dev libncursesw5-dev`

Arch e derivados: `sudo pacman -Sy ncurses glew glfw-x11`

### Clone o repositório
Você pode usar HTTPS: `git clone https://github.com/simoesusp/Processador-ICMC.git`

Ou SSH: `git clone git@github.com:simoesusp/Processador-ICMC.git`

### Compilar
Vá para o diretório do simulador: `cd Processador-ICMC/OpenGL_Simulator`

E compile: `make`

### Usagem
Basta executar o binário (`./simple-simulator`)

Você pode especificar qual `.mif` utilizar usando argumento, por exemplo: `./simple-simulator Nave11.mif`

Caso omitido, assumirá o arquivo `cpuram.mif` do diretório atual como argumento.


## Observações
É necessário ressaltar que o simulador do `método 2` é mais `lento` que o simulador do `método 1`.

Todos os testes e desenvolvimento foram realizados com base no `método 1`, portanto é aconselhável utilizar o `método 1`.

### [Vídeo do jogo](https://drive.google.com/file/d/1FviX1WuvPaKyYyMVWJV6UlzLv3SR1n6h/view?usp=sharing)

### [Apresentação](https://drive.google.com/file/d/1bCAl-iuBOPLLAT4uuAxY4crkfCyXaLKD/view?usp=sharing)