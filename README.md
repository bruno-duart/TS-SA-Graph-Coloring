# GraphColor 

Este projeto implementa algoritmos de Coloração de Grafos, com o objetivo de resolver o problema de coloração utilizando diferentes métodos. A coloração de grafos é uma técnica útil em diversas áreas como alocação de frequências, escalonamento de tarefas, e problemas de otimização combinatória.

## Funcionalidades

- **Métodos implementados:**
  - Algoritmos gulosos
  - Simulated Annealing
  - Busca Tabu (Tabu Search)
- **Suporte para leitura e escrita de arquivos DIMACS**:
  - Grafos representados como lista de adjacência para otimizar o consumo de memória.
- **Análise estatística de combinações de parâmetros**:
  - Realização de grid search com análise dos resultados para encontrar a melhor combinação de parâmetros.
  
## Estrutura do Projeto

- `include/`: Contém os arquivos .h das bibliotecas utilizadas/implementadas.
- `lib/`: Contém os arquivos .cpp utilizados no trabalho.
- `instances/`: Contém os arquivos de grafos em formato DIMACS para testes e simulações.
- `shell_scripts/`: Scripts auxiliares para execução de testes e análise de resultados.
- `results/`: Contém os resultados gerados pelas execuções dos algoritmos.
- `Tables/`: Contém os arquivos .csv que contém os resultados compilados.
- `images/`: Contém os arquivos de imagem (.eps) com os plots utilizados no artigo

## Como executar

### Pré-requisitos

- **C++** (Compilador compatível com o padrão C++11 ou superior)
<!-- - **CMake** (para a construção do projeto) -->
- **Bibliotecas padrão**: STL (Standard Template Library)
- **Editor de código**: Ferramenta da sua preferência

#### Configurações utilizadas neste projeto

- **Sistema Operacional**: Windows Subsystem for Linux (WSL) - Ubuntu 22.04 LTS
- **C++**: Compilador g++ versão
- **Editor de código**: Visual Studio Code

### Compilação e Execução -- EM CONSTRUÇÃO ---

1. Clone o repositório:

   ```bash
   git clone https://github.com/bruno-duart/TS-SA-Graph-Coloring.git
   ```

2. Navegue até o diretório do projeto:

   ```bash
   cd TS-SA-Graph-Coloring
   ```

3. Para compilar:
    1. Greedy Method:

        ```bash
        g++ run_main_greedy.cpp lib/graphs.cpp lib/solution.cpp lib/heuristics.cpp lib/utils.cpp -I include -o run_greedy
        ```

    2. Simulated Annealing:

       ```bash
       g++ run_main_sa.cpp lib/graphs.cpp lib/solution.cpp lib/heuristics.cpp lib/metaheuristics.cpp lib/utils.cpp lib/SAGraphColoring.cpp -I include -o run_sa
       ```

    3. Busca Tabu:

        ```bash
        g++ run_main_tabu_v2.cpp lib/graphs.cpp lib/solution.cpp lib/utils.cpp lib/heuristics.cpp lib/metaheuristics.cpp lib/TabuGraphColoring.cpp -I include -o run_tabu
        ```

4. Para executar um único caso de teste:
    Considere os parâmetros abaixo como comuns a todos os métodos:
    - **$instance_name**: nome do caso de teste (disponíveis na pasta instances)
    - **$k**: número de cores disponível para colorir o grafo

    Considere os parâmetros abaixo para Simulated Annealing e Busca Tabu:
    - **$output_folder**: pasta onde os resultados serão salvos

    1. Greedy Method:

        ```bash
        ./run_greedy instances/$instance_name.col $k results/greedy/$instance_name.txt
        ```

    2. Simulated Annealing:

        ```bash
        ./run_sa instances/$instance_name.col $k $T_max $alpha_int results/sa/analysis/$instance_name.txt
        ```

        Considere:
        - **$T_max**: Temperatura inicial do sistema
        - **alpha_int**: Valor inteiro que corresponde à taxa de decaimento da temperatura

    3. Busca Tabu:

        ```bash
        ./run_tabu instances/$instance_name.col $k $T_iter $max_iter results/tabu/analysis/$instance_name.txt
        ```

        Considere os parâmetros abaixo para o ABC:
        - **$T_iter**: número de iterações para restrição de movimentos
        - **$max_iter**: número máximo de iterações sem melhora

    Os resultados da execução serão armazenados em "results/greedy/$instance_name.txt", "results/sa/results/$instance_name.txt" e "results/tabu/results/$instance_name.txt", respectivamente.

5. Para executar todos os casos de teste, considere utilizar os scripts da pasta **shell_scripts**. Estes scripts consideram o arquivo **instances_with_k** como guia para escolha de $k e outras informações
    1. Greedy Method:

        ```bash
        bash shell_scripts/greedy.sh
        ```

    2. Simulated Annealing:

        ```bash
        bash shell_scripts/sa.sh
        ```

    3. Busca Tabu:

        ```bash
        bash shell_scripts/tabu.sh
        ```

6. Importante: As metaheutísticas Simulated Annealing e Busca Tabu podem ser executadas considerando soluções iniciais gulosas ou aleatórias. No momento, essa definição é realizada em código.

   - Simulated Annealing: navegue até `lib/SAGraphColoring.cpp`, descomente as linhas abaixo

        ```c++
        // GreedyGraphColoring greedy = GreedyGraphColoring(graph, num_colors, rng);
        // Individual indv = greedy.run();
        ```
        e comente a linha

        ```c++        
        Individual indv = initialize_individual(num_colors, graph, rng);
        ```
        para executar o Simulated Annealing com solução inicial gulosa. Faça o procedimento inverso para executar com solução inicial aleatória.
    
    - Busca Tabu: navegue até `lib/TabuGraphColoring.cpp`, e siga o mesmo procedimento.

    Após esse processo, compile e execute novamente o código.
    Na próxima atualização, isso será realizado por meio de parâmetros na execução do shell_script.

## Contribuição

Contribuições são bem-vindas! Siga os passos abaixo para contribuir com este projeto:

1. Faça um fork do repositório

2. Crie uma nova branch:

      ```bash
      git checkout -b minha-nova-funcionalidade
      ```

3. Faça suas alteraçõs e adicione os commits:

      ```bash
      git commit -m "Adicionei nova funcionalidade"
      ```

4. Envie as alterações para seu fork:

      ```bash
      git push origin minha-nova-funcionalidade
      ```

5. Abra um Pull Request no repositório original.
