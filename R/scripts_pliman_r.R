#' ---
#' title: Scripts R - pliman
#' ---
#'
#' # Diretório das imagens
## ----eval=FALSE----------------------------------------------------------------------------------------------
## # mudar de acordo com a pasta em seu computador
## setwd("E:/Desktop/tiagoolivoto/static/tutorials/pliman_lca/imgs")

#https://www.expstat.com/eventos/cursopliman
# install.packages("pliman")

#'
#'
#' # Manipulação
#' ## Importar imagens
## ----collapse = TRUE, message=FALSE, warning=FALSE-----------------------------------------------------------
library(pliman)
img <- image_import("grains.jpg")


#'
#'
#'
#' Para importar uma lista de imagens, use um vetor de nomes de imagens, ou o argumento `pattern`. Neste último, todas as imagens que correspondem ao nome do padrão são importadas para uma lista.
#'
## ----import2-------------------------------------------------------------------------------------------------
img_list1 <- image_import(c("grains.jpg", "green.jpg"))
img_list2 <- image_import(pattern = "maize_")
str(img_list1)

#'
#'
#' ## Exibindo imagens
#' Imagens individuais são exibidas com `plot()`. Para combinar imagens, a função `image_combine()` é usada. Os usuários podem informar uma lista de objetos separados por vírgulas ou uma lista de objetos da classe `Image`.
#'
## ----display1, fig.width = 10, fig.height=6------------------------------------------------------------------
# Imagens individuais
plot(img)


#'
#'
#'
## ----display2, fig.width = 10, fig.height=5------------------------------------------------------------------
# Combine imagens
image_combine(img_list1)

#'
#'
#'
#'
#' `pliman` fornece um conjunto de funções `image_*()` para realizar a manipulação de imagens e transformação de imagens exclusivas ou uma lista de imagens baseada no [pacote EBImage](https://www.bioconductor.org/packages/release/bioc/vignettes/EBImage/inst/doc/EBImage-Introduction.html).
#'
#' ## Redimensionar uma imagem
#' Às vezes, o redimensionamento de imagens de alta resolução é necessário para reduzir o esforço computacional e tempo de processamento. A função `image_resize()` é usada para redimensionar uma imagem. O argumento `rel_size` pode ser usado para redimensionar a imagem por tamanho relativo. Por exemplo, definindo `rel_size = 50` para uma imagem de largura 1280 x 720, a nova imagem terá um tamanho de 640 x 360.
#'
## ----manipulate1---------------------------------------------------------------------------------------------
image_dimension(img)
img_resized <- image_resize(img, rel_size = 50)
image_dimension(img_resized)

#'
#'
#' ## Cortar uma imagem
#' Cortar imagens é útil para remover ruídos da borda da imagem, bem como para reduzir o tamanho das imagens antes do processamento. Para recortar uma imagem, a função `image_crop()` é usada. Os usuários precisam informar um vetor numérico indicando a faixa de pixels (`width` e `height`) que será mantida na imagem recortada.
#'
## ------------------------------------------------------------------------------------------------------------
crop1 <-
  image_crop(img,
             width = 171:1088,
             height = 115:855,
             plot = TRUE)

#'
#' Se apenas `width` ou `height` forem informados, a imagem será recortada verticalmente ou horizontalmente.
#'
## ------------------------------------------------------------------------------------------------------------
crop2 <-
  image_crop(img,
             height = 115:855,
             plot = TRUE)

#'
#' Se `width` e `height` não forem declarados, um processo iterativo de corte da imagem é executado.
#'
## ----eval = FALSE--------------------------------------------------------------------------------------------
## # executa apenas em uma seção iterativa
## image_crop(img)

#'
#'
#' Além disso, um processo de corte automatizado pode ser executado. Nesse caso, a imagem será cortada automaticamente na área de objetos com uma borda de cinco pixels por padrão.
#'
## ------------------------------------------------------------------------------------------------------------
auto_crop <- image_autocrop(img, plot = TRUE)

# um exemplo de corte em lote
imgs_crop <- image_import(pattern = "crop_", plot = TRUE)
cropped <- image_autocrop(imgs_crop)
image_combine(cropped)

# somente na versão de desenvolvimento
image_export(cropped, prefix = "c_", subfolder = "cropped")

#'
#'
#' A função `image_trim()` é usada para cortar pixels das bordas da imagem.
#'
#'
## ----manipulate2, fig.width = 10-----------------------------------------------------------------------------
# apara 100 pixels de todas as bordas
img_trim <- image_trim(img, edge = 50, plot = TRUE)

# O mesmo é alcançado com
img_trim2 <-
  image_trim(img,
             top = 50,
             bottom = 50,
             left = 50,
             right = 50,
             plot = TRUE)

# apara 100 pixels da parte superior e 50 da inferior
img_trim3 <-
  image_trim(img,
             top = 100,
             bottom = 50,
             plot = TRUE)



#'
#'
#'
#'
#' ## Resolução da imagem (DPI) {#dpi}
#' A função `dpi()` executa uma função interativa para calcular a resolução da imagem dada uma distância conhecida informada pelo usuário. Para calcular a resolução da imagem(dpi), o usuário deve usar o botão esquerdo do mouse para criar uma linha de distância conhecida. Isso pode ser feito, por exemplo, usando um modelo com distância conhecida na imagem(por exemplo, `leaves.JPG`).
#'
## ----eval = FALSE--------------------------------------------------------------------------------------------
## # executado apenas em uma seção interativa
## rule <- image_import("rule.jpg", plot = TRUE)
## dpi(rule)

#'
#'
#'
#'
#'
#' ## Filtro, desfoque, contraste, dilatação, erosão
#'
## ----manipulate6, fig.width = 10, fig.height = 20------------------------------------------------------------
img_filter <- image_filter(img)
img_blur <- image_blur(img)
img_contrast <- image_contrast(img)
img_dilatation <- image_dilate(img)
img_erosion <- image_erode(img)
img_opening <- image_opening(img)
img_closing <- image_closing(img)
image_combine(img,
              img_filter,
              img_blur,
              img_contrast,
              img_dilatation,
              img_erosion,
              img_opening,
              img_closing,
              ncol = 4)

#'
#'
#' ## Exportando imagens
#' Para exportar imagens para o diretório atual, use a função `image_export()`. Se uma lista de imagens for exportada, as imagens serão salvas considerando o nome e a extensão presentes na lista. Se nenhuma extensão estiver presente, as imagens serão salvas como arquivos `*.jpg`.
#'
## ----export, eval=FALSE--------------------------------------------------------------------------------------
## image_export(img, "img_exported.jpg")
##
## # ou para uma subpasta
## image_export(img, "test/img_exported.jpg")

#'
#'
#'
## ---- echo=FALSE, eval=TRUE----------------------------------------------------------------------------------

#'
#'
#' # Segmentação
#' ## Diretório das imagens
## ----eval=FALSE----------------------------------------------------------------------------------------------
## # mudar de acordo com a pasta em seu computador
## setwd("E:/Desktop/tiagoolivoto/static/tutorials/pliman_lca/imgs")

#'
#'
#' ## Importar imagens
## ----collapse = TRUE, message=FALSE, warning=FALSE-----------------------------------------------------------
library(pliman)
img <- image_import("grains.jpg")
img <- image_resize(img, rel_size = 50, plot = TRUE)


#'
#'
#' ## Segmentação de imagem
#'
#' No `pliman`, as seguintes funções podem ser usadas para segmentar uma imagem.
#'
#' * `image_binary()` para produzir uma imagem binária(preto e branco)
#' * `image_segment()` para produzir uma imagem segmentada(objetos de imagem e um fundo branco).
#' * `image_segment_iter()` para segmentar uma imagem iterativamente.
#'
#' Ambas as funções segmentam a imagem com base no valor de algum índice de imagem, que pode ser uma das bandas RGB ou qualquer operação com essas bandas. Internamente, essas funções chamam `image_index()` para calcular esses índices.
#'
#' Aqui, usamos o argumento `index" `para testar a segmentação com base no RGB e seus valores normalizados. Os usuários também podem fornecer seu índice com o argumento` my_index`.
#'
## ----segmentação2, fig.width = 10, fig.height = 5------------------------------------------------------------
# Calcule os índices
indexes <- image_index(img, index = c("R, G, B, NR, NG, NB"))

# Crie um gráfico raster com os valores RGB
plot(indexes)

# Crie um histograma com os valores RGB
plot(indexes, type = "density")

#'
#' Os dois picos representam a folha (pico menor) e o fundo (pico maior). Quanto mais clara for a diferença entre esses picos, melhor será a segmentação da imagem.
#'
#' A função `image_segment()` é usada para segmentar imagens usando índices de imagem. Em nosso exemplo, usaremos os mesmos índices calculados abaixo para ver como a imagem é segmentada. A saída desta função pode ser usada como entrada na função `analyze_objects()`.
#'
## ----segmentação3, fig.width = 10, fig.height = 5------------------------------------------------------------
segmented <- image_segment(img, index = c("R, G, B, NR, NG, NB"))


#'
#' Parece que o índice `"B"` e `"NB"` proporcionaram melhor segmentação.
#'
#'
#'
#' ## Produzindo uma imagem binária
#'
#' Também podemos produzir uma imagem binária com `image_binary()`. A título de curiosidade, usaremos os índices `"B"` (azul). Por padrão, `image_binary()` redimensiona a imagem para 30% do tamanho da imagem original para acelerar o tempo de computação. Use o argumento `resize = FALSE` para produzir uma imagem binária com o tamanho original.
#'
## ----binary1, fig.width = 10, fig.height = 5-----------------------------------------------------------------
binary <- image_binary(img)

# tamanho de imagem original
image_binary(img,
             index = "B",
             resize = FALSE)

# inverte a binarização
image_binary(img,
             index = "B",
             resize = FALSE,
             invert = TRUE)

#'
#'
#'
#' # Análise de objetos
#'
#' ## Diretório das imagens
## ----eval=FALSE----------------------------------------------------------------------------------------------
## # mudar de acordo com a pasta em seu computador
## setwd("E:/Desktop/tiagoolivoto/static/tutorials/pliman_lca/imgs")

#'
#' A função `analyze_objects()` pode ser usada para contar objetos em uma imagem. Vamos começar com um exemplo simples com a imagem `object_300dpi.png` disponível na [página GitHub](https://github.com/TiagoOlivoto/pliman/tree/master/inst/tmp_images). Para facilitar a importação de imagens desta pasta, uma função auxiliar `image_pliman()` é usada.
#'
#'
## ----collapse=TRUE-------------------------------------------------------------------------------------------
# gerar tabelas html
print_tbl <- function(table,  digits = 3, ...){
  knitr::kable(table, booktabs = TRUE, digits = digits, ...)
}
library(pliman)
library(tidyverse)
library(patchwork)

img <- image_pliman("objects_300dpi.jpg", plot = TRUE)


#'
#'
#'
#' A imagem acima foi produzida com o Microsoft PowerPoint. Tem uma resolução conhecida de 300 dpi(pontos por polegada) e mostra quatro objetos
#'
#' - Quadrado maior: 10 x 10 cm (100 cm$^2$)
#' - Quadrado menor: 5 x 5 cm(25 cm$^2$)
#' - Retângulo: 4 x 2 cm(8 cm$^2$)
#' - Círculo: 3 cm de diâmetro(~7,07 cm$^2$)
#'
#'
#' Para contar os objetos na imagem usamos `analyze_objects()` e informamos a imagem (o único argumento obrigatório). Primeiro, usamos `image_binary()` para ver o índice mais adequado para segmentar os objetos do fundo. Por padrão, R, G, B e seus valores normalizados.
#'
#'
## ----fig.width = 10, fig.height = 5--------------------------------------------------------------------------
image_binary(img)


#'
#'
#'
#' ## Analizar objetos
#'
## ---- fig.width = 10, fig.height = 5-------------------------------------------------------------------------
img_res <- analyze_objects(img, marker = "id")

#'
#'
#'
#' ### Ajustando as medidas do objeto
#'
#' Os resultados foram armazenados em `img_res`. Como não há escala declarada no
#'  exemplo acima, não temos ideia sobre a área real dos objetos em cm$^2$,
#'   apenas em pixels. Neste caso, usamos `get_measures()` para ajustar as
#'   medidas de pixels para unidades métricas.
#'
#' Existem duas formas principais de ajustar as medidas do objeto (de pixels a
#'  cm, por exemplo). O primeiro é declarar a área, perímetro ou raio conhecido
#'   de um determinado objeto.
#'   A medida para os outros objetos será então calculada por uma regra de três
#'   simples. A segunda é declarando uma resolução de imagem conhecida em dpi
#'   (pontos por polegada).
#'   Neste caso, perímetro, área e raio serão ajustados pelo dpi informado.
#'
#' #### Declarando um valor conhecido
#'
#' Como conhecemos a área do quadrado maior (objeto 1),
#'  vamos ajustar a área dos outros objetos na imagem usando isso.
#'
#'
## ------------------------------------------------------------------------------------------------------------
get_measures(img_res,
             id = 1,
             area ~ 100)


#'
#'
#'
#' O mesmo pode ser usado para ajustar as medidas com base no perímetro ou raio.
#' Vamos ajustar o perímetro dos objetos pelo perímetro do objeto 2(20 cm).
#'
#'
#' #### Declarando a resolução da imagem
#'
#' Se a resolução da imagem for conhecida, todas as medidas serão ajustadas de acordo com esta resolução. Vamos ver um exemplo numérico com `pixels_to_cm()`. Esta função converte o número de pixels (*px*) em cm, considerando a resolução da imagem em `dpi`, da seguinte forma: $cm = px \times(2,54 / dpi)$. Como sabemos o número de pixels do quadrado maior, seu perímetro em cm é dado por
#'
#'
#'
## ------------------------------------------------------------------------------------------------------------
# número de pixels para o perímetro do quadrado maior

ls_px <- img_res$results$perimeter[1]
pixels_to_cm(px = ls_px, dpi = 300)


#'
#' O perímetro do objeto 1 ajustado pela resolução da imagem é muito próximo do verdadeiro (40 cm). Abaixo, os valores de todas as medidas são ajustados declarando o argumento `dpi` em` get_measures()`.
#'
## ------------------------------------------------------------------------------------------------------------
img_res_cor <- get_measures(img_res, dpi = 300)
print_tbl(t(img_res_cor))


#'
#'
#' ### Entendendo as medidas
#'
## ------------------------------------------------------------------------------------------------------------
object_contour(img) %>%  # obtém o contorno dos objetos
  poly_mass() %>%        # computa o centro de massa e raios mínimo e máximo
  plot_mass()            # plota as medidas

#'
#' * Quadrado maior:
#' - O diâmetro mínimo (a = 9,97) pode ser considerado como o lado do quadrado
#'
#' - O diâmetro máximo, dado por $a \sqrt{2}$ pode ser considerado a diagonal do quadrado ($9,97 \sqrt{2} = 14.099$
## ------------------------------------------------------------------------------------------------------------
t(img_res_cor)

#'
#'
#'
#'
#' ### Objetos médios
#'
#' Aqui, contaremos os grãos na imagem `soybean_touch.jpg`. Esta imagem tem um fundo ciano e contém 30 grãos de soja que se tocam. A função `analyze_objects()` segmenta a imagem usando como padrão o índice azul normalizado, como segue $NB =(B /(R + G + B))$, onde *R*, *G* e *B* são as faixas vermelha, verde e azul. Os objetos são contados e os objetos segmentados são coloridos com permutações aleatórias.
#'
#'
#'
## ---- fig.width = 12, fig.height = 6-------------------------------------------------------------------------
soy <- image_pliman("soybean_touch.jpg")

count <- analyze_objects(soy)

count$statistics %>%
  print_tbl()

#'
#'
#'
#' Os usuários podem definir `show_contour = FALSE` para remover a linha de contorno e identificar os objetos (neste exemplo, os grãos) usando os argumentos `marker = "id"`. A cor do fundo também pode ser alterada com `col_background`.
#'
#'
#'
## ---- fig.width = 12, fig.height = 6-------------------------------------------------------------------------
count2 <-
  analyze_objects(soy,
                  show_contour = FALSE,
                  marker = "id",
                  show_segmentation = FALSE,
                  col_background = "white") # padrão


#'
#'
#'
## ------------------------------------------------------------------------------------------------------------
# Obtenha as medidas do objeto

medidas <- get_measures(count)
medidas %>%
  print_tbl()

#'
#'
#'
#' No exemplo a seguir, selecionaremos objetos com uma área acima da média de todos os objetos usando `lower_size = 2057,36`. Além disso, usaremos o argumento `show_original = FALSE` para mostrar os resultados como uma máscara.
#'
## ---- fig.width = 12, fig.height = 6-------------------------------------------------------------------------

analyze_objects(soy,
                marker = "id",
                show_original = FALSE,
                lower_size = 2057.36)

#'
#'
#'
#' Os usuários também podem usar os argumentos `topn_*` para selecionar os  `n` objetos com base nas menores ou maiores áreas. Vamos ver como selecionar os 5 grãos com a menor área, mostrando os grãos originais em um fundo azul. Também usaremos o argumento `my_index` para escolher um índice personalizado para segmentar a imagem. Apenas para comparação, iremos configurar explicitamente o índice azul normalizado chamando `my_index = "B/(R + G + B)"`.
#'
#'
#'
## ---- fig.width = 12, fig.height = 6-------------------------------------------------------------------------
analyze_objects(soy,
                marker = "id",
                topn_lower = 5,
                col_background = "black",
                my_index = "B /(R + G + B)")

#'
#' ### Objetos grandes
#'
## ------------------------------------------------------------------------------------------------------------
cob <- image_import("cob.jpg")

# segmentação normal
analyze_objects(cob, marker = "id")

# ajustar o parâmetro object_size
cob_res <-
  analyze_objects(cob,
                  object_size = "large",
                  marker = "id")



#'
#'
#'
#' ### Objetos pequenos
## ------------------------------------------------------------------------------------------------------------
wheat <- image_import("wheat.jpg")
analyze_objects(wheat)

vicia <- image_import("vicia2.jpg")
analyze_objects(vicia,
                index = "R",
                marker = "point",
                marker_col = "red",
                show_contour = FALSE)

#'
#'
#' ## Coordenadas de objetos
#'
#' Os usuários podem obter as coordenadas para todos os objetos desejados com `object_coord()`. Quando o argumento `id` é definido como `NULL` (padrão), um retângulo delimitador é desenhado incluindo todos os objetos. Use `id = "all"` para obter as coordenadas de todos os objetos na imagem ou use um vetor numérico para indicar os objetos para calcular as coordenadas. Note que o argumento `watershed = FALSE` é usado para
#'
#'
## ----objec2--------------------------------------------------------------------------------------------------
folhas <- image_import(image = "leaves.jpg", plot = TRUE)

# obter o id de cada objeto
object_id(folhas,  watershed = FALSE)

# Obtenha as coordenadas de um retângulo delimitador em torno de todos os objetos
object_coord(folhas, watershed = FALSE)

# Obtenha as coordenadas para todos os objetos
object_coord(folhas,
             id = "all",
             watershed = FALSE)

# Obtenha as coordenadas dos objetos 1 e 3
object_coord(folhas,
             id = c(2, 4),
             watershed = FALSE)

#'
#'
#'
#' ## Isolando objetos
#'
#' Para isolar objetos, a função `object_isolate()` é usada. No exemplo a seguir, irei isolar o objeto 32 e definir uma borda de 5 pixels ao redor do objeto.
#'
## ----objec3--------------------------------------------------------------------------------------------------
id1 <-
  object_isolate(folhas,
                 watershed = FALSE,
                 id = 32,
                 edge = 5)
plot(id1)

#'
#'
#'
#' ## Processamento em lote
#'
#' Na análise de imagens, frequentemente é necessário processar mais de uma imagem. Por exemplo, no melhoramento de plantas, o número de grãos por planta (por exemplo, trigo) é frequentemente usado na seleção indireta de plantas de alto rendimento. No `pliman`, o processamento em lote pode ser feito quando o usuário declara o argumento `pattern`.
#'
#'
#' Para acelerar o tempo de processamento, especialmente para um grande número de imagens, o argumento `parallel = TRUE` pode ser usado. Nesse caso, as imagens são processadas de forma assíncrona(em paralelo) em sessões `R` separadas rodando em segundo plano na mesma máquina. O número de seções é configurado para 50% dos núcleos disponíveis. Este número pode ser controlado explicitamente com o argumento `trabalhadores`.
#'
#'
#'
## ------------------------------------------------------------------------------------------------------------
system.time(
  list_res <- analyze_objects(pattern = "img_sb")
)

# procesamento paralelo
# três múltiplas seções
system.time(
  list_res <-
    analyze_objects(pattern = "img_sb",
                    show_image = FALSE,
                    parallel = TRUE,
                    workers = 3)
)

list_res$count %>%
  head() %>%
  print_tbl()
list_res$results %>%
  head() %>%
  print_tbl()

#'
#'
#'
#' ## Forma de objetos
#'
#'
#' A função `analyze_objects()` calcula uma gama de medidas que podem ser utilizadas para estudar a forma dos objetos, como por exemplo, folhas. Como exemplo, usarei a imagem `potato_leaves.png`, que foi coletada de [Gupta et al.(2020)](https://doi.org/10.1111/nph.16286)
#'
#'
## ----batata, fig.width = 10----------------------------------------------------------------------------------
batata <- image_pliman("potato_leaves.jpg", plot = TRUE)

pot_meas <-
  analyze_objects(batata,
                  watershed = FALSE,
                  marker = "id",
                  show_chull = TRUE) # mostra o casco convex
pot_meas$results %>%
  print_tbl()


#'
#'
#'
#' As três medidas principais (em unidades de pixel) são:
#'
#' 1. `area` a área do objeto.
#' 2. `area_ch` a área do casco convexo.
#' 3. `perímetro` o perímetro do objeto.
#'
#' Usando essas medidas, a circularidade e a solidez são calculadas conforme mostrado em (Gupta et al, 2020).
#'
#' $$ circularidade = 4 \pi(area / perimeter ^ 2) $$
#'
#'
#'
#'
#'
#' $$ solidez = area / area \\\_ch$$
#'
#'
#'
#' A circularidade é influenciada por serrilhas e saliências. A solidez é sensível a folhas com lóbulos profundos ou com pecíolo distinto e pode ser usada para distinguir folhas sem tais estruturas. Ao contrário da circularidade, não é muito sensível a serrilhas e saliências menores, uma vez que o casco convexo permanece praticamente inalterado.
#'
#' ### Contorno do objeto
#'
#' Os usuários também podem obter o contorno do objeto e o casco convexo da seguinte forma:
#'
#'
#'
## ----cont, fig.width = 10------------------------------------------------------------------------------------
cont <-
  object_contour(batata,
                 watershed = FALSE,
                 show_image = FALSE)

plot(batata)
plot_contour(cont, col = "red", lwd = 3)


#'
#'
#' ### Casco convexo
#'
#' A função `object_contour()` retorna uma lista com os pontos de coordenadas para cada contorno do objeto que pode ser usado posteriormente para obter o casco convexo com `conv_hull()`.
#'
## ----conv, fig.width = 10------------------------------------------------------------------------------------
conv <- conv_hull(cont)
plot(batata)
plot_contour(conv, col = "black", lwd = 3)
plot_measures(pot_meas, measure = "solidity")

#'
#' ### Área do casco convexo
#'
#' Então, a área do casco convexo pode ser obtida com `poly_area()`.
#'
## ----polyarea------------------------------------------------------------------------------------------------
area <- poly_area(conv)
area


#'
#'
#'
#'
#'
#' ### Folhas como `ggplot2`
#'
#'
#'
## ----maskpoly, fig.width = 8, fig.height=3, warning=FALSE, message=FALSE-------------------------------------

# criar um quadro de dados para contorno e casco convexo
library(tidyverse)

df_cont <- bind_rows(cont, .id = "objeto")
df_conv <- bind_rows(conv, .id = "objeto")

ggplot(df_cont, aes(X1, X2, group = objeto)) +
  geom_polygon(aes(fill = objeto)) +
  geom_polygon(data = df_conv,
               aes(x, y, fill = objeto),
               alpha = 0.3) +
  theme_void() +
  theme(legend.position = "bottom")

#'
#'
#'
#' ### Comprimento e largura
#' No exemplo a seguir, mostro como calcular o contorno do objeto, o centro de massa e os raios máximo e mínimo (em unidades de pixel). Nesse caso, o diâmetro mínimo e máximo (calculado com `analyze_objects()`) pode ser usado como uma medida para aproximar a largura e o comprimento do grão do feijão, respectivamente.
#'
#'
## ------------------------------------------------------------------------------------------------------------
bean <- image_import("bean.jpg", plot = TRUE)

bean_meas <-
  analyze_objects(bean,
                  index = "G",
                  fill_hull = TRUE,
                  watershed = FALSE,
                  show_contour = FALSE,
                  col_background = "black",
                  marker = "id")
bean_meas_cor <- get_measures(bean_meas, dpi = 300)
bean_meas_cor[, c("id", "diam_min", "diam_max")]


# contorno
cont <-
  object_contour(bean,
                 index = "G",
                 watershed = FALSE,
                 show_image = FALSE)

plot_contour(cont, col = "white", lwd = 2)

# centro de massa
cm <- poly_mass(cont)
plot_mass(cm,
          col = "white",
          arrow = TRUE)

# plota a largura e comprimento
plot_measures(bean_meas_cor, measure = "diam_min", vjust = 120)
plot_measures(bean_meas_cor, measure = "diam_max", hjust = 180)

#'
#'
#' ## Comprimento de raiz
#' No exemplo a seguir, mostro como medir o comprimento da raiz de mudas de soja. As imagens foram coletadas de Silva et al. 2019^[Silva LJ da, Medeiros AD de, Oliveira AMS (2019) SeedCalc, a new automated R software tool for germination and seedling length data processing. J Seed Sci 41:250–257. https://doi.org/10.1590/2317-1545V42N2217267︎].
#'
#'
## ------------------------------------------------------------------------------------------------------------
roots <- image_import("root.jpg", plot = TRUE)

r1_meas <-
  analyze_objects(roots,
                  index = "B",
                  marker = "id",
                  invert = TRUE)

#'
#'
#' Observe que a segmentação *"watershed"* segmentou os objetos conectados em vários objetos pequenos. Podemos melhorar esta segmentação usando o argumento `tolerance` (algumas tentativas serão necessárias para encontrar um valor adequado).
#'
## ------------------------------------------------------------------------------------------------------------
r1_meas <-
  analyze_objects(roots,
                  index = "B",
                  marker = "id",
                  invert = TRUE,
                  tolerance = 3.5)

#'
#' Muito melhor, mas ainda não é o que procuramos. Observe que as raízes e os cotilédones foram selecionados. Podemos, no entanto, usar uma restrição na seleção de objetos que, neste caso, pode ser a excentricidade do objeto. Usando os argumentos `lower_eccent` os objetos podem ser selecionados em relação à sua excentricidade.
#'
## ------------------------------------------------------------------------------------------------------------
r1_meas <-
  analyze_objects(roots,
                  index = "B",
                  marker = "id",
                  invert = TRUE,
                  tolerance = 3,
                  lower_eccent = 0.95)
r1_meas_cor <- get_measures(r1_meas, dpi = 150)
# calcula a metade do perímetro
r1_meas_cor$metade_perimetro <- r1_meas_cor$perimeter / 2

# plota as medidas
plot(roots)
plot_measures(r1_meas_cor,
              measure = "metade_perimetro",
              hjust = 30,
              col = "red")
plot_measures(r1_meas_cor,
              measure = "diam_max",
              hjust = -30)

#'
#'
#'
#' ## Valores RGB para cada objeto
#'
#' Para obter a intensidade RGB de cada objeto de imagem, usamos o argumento `object_rgb = TRUE` na função `analyze_objects() `. Neste exemplo,
#'
## ----rgb1, fig.width = 10, fig.height = 10-------------------------------------------------------------------
img <- image_import("green.jpg", plot = TRUE)
# identifica o índice que melhor segmenta a imagem
image_binary(img, index = "all")


#'
#'
#' O índice `NB` (padrão) foi escolhido para segmentar os grãos do fundo. A média dos valores da banda verde será calculada declarando `object_index = "G"`.
#'
## ----rgb2, fig.width = 10, fig.height = 10-------------------------------------------------------------------
soy_green <-
  analyze_objects(img,
                  object_index = "G",
                  marker_col = "black",
                  col_background = "white",
                  show_contour = FALSE)
plot_measures(soy_green,
              measure = "G",
              col = "black")

#'
#'
#' Parece que grãos com valores médios de verde (G) inferiores a 0.5 podem ser consideradas sementes esverdeadas. Os usuários podem então trabalhar com esse recurso e adaptá-lo ao seu caso.
#'
## ----rgb4----------------------------------------------------------------------------------------------------
report <- summary_index(soy_green, index = "G", cut_point = 0.5)
ids <- report$ids

plot(img)
plot_measures(soy_green,
              id = ids,
              measure = "G",
              col = "black")
cont <- object_contour(img, show_image = FALSE)
plot_contour(cont, id = ids, col = "red")

#'
#'
#'
#' ### Grande número de objetos
#' Quando existem muitos objetos, o argumento `parallel = TRUE` irá acelerar a extração dos valores RGB. No exemplo a seguir, uma imagem com 1343 grãos de *Vicia cracca* é analisada. Os índices `"R"` e `"R/G"` são computados. Os grãos com um valor médio de vermelho superior a 0,25 são destacados.
#'
## ----rgb5, fig.width = 12, fig.height=10---------------------------------------------------------------------
img2 <- image_import("vicia.jpg")
vicia <-
  analyze_objects(img2,
                  index = "B",
                  object_index = pliman_indexes_eq(),
                  show_image = FALSE,
                  parallel = TRUE)

head(vicia$object_index) %>%
  print_tbl()

cont2 <-
  object_contour(img2,
                 index = "B",
                 show_image = FALSE)

ids2 <- which(vicia$object_index$R > 0.25)
plot(img2)
plot_contour(cont2, id = ids2, col = "red")


# cria gráfico de densidade dos valores RGB para as duas classes de grãos
rgbs <-
  vicia$object_rgb %>%
  mutate(type = ifelse(id %in% ids2, "Destacado", "Não destacado")) %>%
  select(-id) %>%
  pivot_longer(-type) %>%
  subset(name == "G")

ggplot(rgbs, aes(x = value)) +
  geom_density(fill = "green", alpha = 0.5) +
  facet_wrap(~type)

#'
#'
#'
#' ## Área foliar
#' ### Uma imagem
## ------------------------------------------------------------------------------------------------------------
folhas <- image_import(image = "leaves.jpg", plot = TRUE)
af <-
  analyze_objects(folhas,
                  watershed = FALSE,
                  lower_eccent = 0.3,
                  show_contour = FALSE,
                  col_background = "black")
af_cor <- get_measures(af, dpi = 50.8)
plot_measures(af_cor, measure = "area")

#'
#'
#' ### Preenchendo 'buracos'
#' Um aspecto importante a se considerar é quando há a presença de 'buracos' nas folhas. Isto pode ocorrer, por exemplo, pelo ataque de pragas. Neste caso, a área teria que ser considerada, pois ela estava lá!
#'
## ----fig.width=10, fig.height=6------------------------------------------------------------------------------
holes <- image_import("holes.jpg", plot = TRUE)

af <-
  analyze_objects(holes,
                  watershed = FALSE,
                  col_background = "white",
                  marker = "area",
                  marker_col = "red",
                  marker_size = 3,
                  show_image = FALSE,
                  save_image = TRUE,
                  dir_processed = tempdir(),
                  contour_size = 5)

af2 <-
  analyze_objects(holes,
                  fill_hull = TRUE, # preenche 'buracos'
                  watershed = FALSE,
                  col_background = "white",
                  marker = "area",
                  marker_col = "red",
                  marker_size = 3,
                  show_image = FALSE,
                  save_image = TRUE,
                  prefix = "proc2_",
                  dir_processed = tempdir(),
                  contour_size = 5)

imgs <- image_import(pattern = "proc", path = tempdir())
image_combine(imgs)

#'
#'
#' ### Várias imagens da mesma amostra
#'
#' Se os usuários precisarem analisar várias imagens da mesma amostra, as imagens da mesma amostra devem compartilhar o mesmo prefixo de nome de arquivo, que é definido como a parte do nome do arquivo que precede o primeiro hífen (`-`) ou underscore (`_`). Então, ao usar `get_measures()`, as medidas das imagens de folhas chamadas, por exemplo, `F1-1.jpeg`,` F1_2.jpeg` e `F1-3.jpeg` serão combinadas em uma única imagem (`F1`), mostrado no objeto `merge`. Isso é útil, por exemplo, para analisar folhas grandes que precisam ser divididas em várias imagens ou várias folhas pertencentes à mesma amostra que não podem ser digitalizadas em uma imagem única.
#'
#' No exemplo a seguir, cinco imagens serão usadas como exemplos. Cada imagem possui folhas de diferentes espécies. As imagens foram divididas em imagens diferentes que compartilham o mesmo prefixo (por exemplo, L1_\*, L2_\* e assim por diante). Observe que para garantir que todas as imagens sejam processadas, todas as imagens devem compartilhar um padrão comum, neste caso ("L"). Os três pontos no canto inferior direito têm uma distância conhecida de 5 cm entre eles, que pode ser usada para extrair o dpi da imagem com `dpi()`. Apenas para fins didáticos, considerarei que todas as imagens têm resolução de 100 dpi.
#'
#'
## ----merge0, fig.width = 10, fig.height = 10-----------------------------------------------------------------
# imagens inteiras
imgs <-
  image_import(pattern = "leaf",
               plot = TRUE,
               ncol = 2)

# imagens da mesma amostra
sample_imgs <-
  image_import(pattern = "L",
               plot = TRUE,
               ncol = 5)

#'
#' Aqui, usarei o `pattern =" L "` para indicar que todas as imagens com este nome de padrão devem ser analisadas. O índice verde (`" G "`) é usado para segmentar as folhas e `divisor de águas = FALSO` é usado para omitir o algoritmo de segmentação de divisor de águas.
#'
#'
## ----merge1--------------------------------------------------------------------------------------------------
merged <-
  analyze_objects(pattern = "L",
                  index = "B",
                  watershed = FALSE)

#'
#' Usando a função `get_measures()` é possível converter as medidas de unidades de pixel em unidades métricas (cm$^ 2$).
#'
## ----merge2--------------------------------------------------------------------------------------------------
merged_cor <- get_measures(merged, dpi = 100)

#'
#' Observe que o `merged_cor` é uma lista com três objetos:
#'
#' * `results`: um data frame que contém as medidas de cada objeto individual (neste caso, folha) de cada imagem analisada.
#'
## ----merge3--------------------------------------------------------------------------------------------------
merged_cor$results %>%
  print_tbl()

#'
#' * `summary`: um data frame que contém o resumo dos resultados, contendo o número de objetos em cada imagem (`n`) a soma, média e desvio padrão da área de cada imagem, bem como o valor médio para todas as outras medidas (perímetro, raio, etc.)
#'
#'
## ----merge4--------------------------------------------------------------------------------------------------
merged_cor$summary %>%
  print_tbl()

#'
#' * `merge`: um data frame que contém os resultados mesclados pelo prefixo da imagem. Observe que, neste caso, os resultados são apresentados por L1, L2, L3, L4 e L5.
#'
## ----merge5--------------------------------------------------------------------------------------------------
merged_cor$merge %>%
  print_tbl()

#'
#' O `area_sum` de img` L1` é a soma das duas folhas (uma em cada imagem)
#'
## ----merge6--------------------------------------------------------------------------------------------------
sum(merged_cor$results$area[1:2])

#'
#'
#'
#'
## ----merge9, fig.width=10, fig.height=5----------------------------------------------------------------------
df_leaf <-
  merged_cor$results %>%
  separate(img, into = c("img", "code"))

# leaf area of the different species
p1 <-
  ggplot(df_leaf, aes(x = img, y = area)) +
  geom_boxplot() +
  geom_jitter(color = "red") +
  labs(x = "Imagem", y = expression(Área~(cm^2)))

p2 <-
  ggplot(df_leaf, aes(x = img, y = area)) +
  stat_summary(fun = sum,
               geom = "bar",
               col = "black") +
  labs(x = "Imagem", y = expression(Área~total~(cm^2)))


# solidity of the different species
p3 <-
  ggplot(df_leaf, aes(x = img, y = solidity)) +
  geom_boxplot() +
  geom_jitter(color = "red") +
  labs(x = "Imagem", y = "Solidez")

p1 + p2 + p3 +
  plot_layout(ncol = 3)

#'
#'
#'
#' # Fitopatometria
#' ## Severidade de doenças
#' ### Utilizando paletas
#'
## ----doença1, fig.width = 12, fig.height = 3, collapse=TRUE--------------------------------------------------
# gerar tabelas html
print_tbl <- function(table,  digits = 3, ...){
  knitr::kable(table, booktabs = TRUE, digits = digits, ...)
}
library(pliman)
library(tidyverse)

img <- image_import("img_1.jpeg")
h <- image_import("h_img1.png")
d <- image_import("d_img1.png")
b <- image_import("b_img1.png")
image_combine(img, h, d, b, ncol = 4)

#'
#' ### Gerando paletas
## ----eval=FALSE, fig.width=10--------------------------------------------------------------------------------
## h2 <- pick_palette(img)
## d2 <- pick_palette(img)
## b2 <- pick_palette(img)
## image_combine(h2, d2, b2, ncol = 3)

#'
#'
#' #### Padrão da função
## ------------------------------------------------------------------------------------------------------------
sev <-
  measure_disease(img = img,
                  img_healthy = h,
                  img_symptoms = d,
                  img_background = b)

#'
#'
#' #### Mostrando preenchimento das lesões
## ------------------------------------------------------------------------------------------------------------
sev <-
  measure_disease(img = img,
                  img_healthy = h,
                  img_symptoms = d,
                  img_background = b,
                  show_contour = FALSE)

#'
#'
#' #### Mostrando uma máscara
## ------------------------------------------------------------------------------------------------------------
sev <-
  measure_disease(img = img,
                  img_healthy = h,
                  img_symptoms = d,
                  img_background = b,
                  show_contour = FALSE,
                  show_original = FALSE)

#'
#'
#' #### Segmentando e analizando lesões
## ------------------------------------------------------------------------------------------------------------
sev <-
  measure_disease(img = img,
                  img_healthy = h,
                  img_symptoms = d,
                  img_background = b,
                  watershed = TRUE,
                  show_contour = FALSE, # não mostra os contornos
                  show_features = TRUE, # computa características das lesões
                  show_segmentation = TRUE) # mostra as segmentações
sev$severity

sev$statistics %>%
  print_tbl()
sev$shape[1:10, ] %>%
  print_tbl()

#'
#'
#'
#' ### Utilizando índices RGB
#' Para identificar o melhor índice para segmentar a imagem do fundo e após as lesões da folha sadia, pode-se utilizar a função `image_segment_iter`. (OBS. somente funcionará em uma seção iterativa).
#'
#'
## ----eval=FALSE----------------------------------------------------------------------------------------------
## img %>%
##   image_resize(50) %>%
##   image_segment_iter(nseg = 2)
##

#'
#' Após escolhidos os índices, podemos utilizar os argumentos `index_lb` e `index_dh` para segmentação da folha e fundo | lesão e sadio, respectivamente.
#'
## ------------------------------------------------------------------------------------------------------------
# após escolhidos os índices, utiliza
sev_index <-
  measure_disease(img,
                  index_lb = "G",
                  index_dh = "NGRDI",
                  threshold = c("Otsu", -0.05),
                  show_image = TRUE)

#'
#'
#'
#' ### Processamento em lote
#' Para analisar diversas imagens de um diretório, utiliza-se o argumento `pattern`, para declarar um padrão de nomes de arquivos. Serão utilizadas 20 folhas de soja disponíveis no repositório  https://osf.io/4hbr6, um banco de dados de imagens de anotação de severidade de doenças de plantas. Obrigado a [Emerson M. Del Ponte](https://osf.io/jb6yd/) e seus colaboradores por manter este projeto disponível publicamente.
#'
## ------------------------------------------------------------------------------------------------------------
system.time(
  sev_lote <-
    measure_disease(pattern = "soy",
                    img_healthy = "healthy",
                    img_symptoms = "disease",
                    img_background = "back",
                    save_image = TRUE,
                    show_original = FALSE,
                    dir_processed = "processed",
                    show_image = FALSE)
)
sev_lote$severity %>%
  print_tbl()

#'
#' ### Diagramas de área padrão
#'
#'
#' Os diagramas de área padrão (SAD) têm sido usados há muito tempo como uma ferramenta para auxiliar na estimativa da severidade de doenças de plantas, servindo como um modelo de referência padrão antes ou durante as avaliações.
#'
#' Dado um objeto calculado com `measure_disease()`, um SAD com `n` imagens contendo os respectivos valores de severidade é obtido com `sad()`.
#'
#' As folhas com menor e maior severidade sempre estarão no SAD. Se `n = 1`, a folha com a menor severidade será retornada. As outras são amostradas sequencialmente para obter as `n` imagens após a severidade ter sido ordenada em ordem crescente. Por exemplo, se houver 30 folhas e `n` for definido como 3, as folhas amostradas serão a 1ª, 15ª e 30ª com os menores valores de severidade.
#'
#' O SAD só pode ser calculado se um nome de padrão de imagem for usado no argumento `pattern` da função `measure_disease()`. Se as imagens forem salvas, as `n` imagens serão recuperadas do diretório `dir_processed` (diretório padrão por default). Caso contrário, a severidade será calculada novamente para gerar as imagens. Um SAD com 8 imagens do exemplo acima pode ser obtido facilmente com:
#'
## ------------------------------------------------------------------------------------------------------------
sad(sev_lote, n = 4, ncol = 4)

#'
#'
#' ### Processamento paralelo
## ------------------------------------------------------------------------------------------------------------
system.time(
  sev_lote <-
    measure_disease(pattern = "soy",
                    img_healthy = "healthy",
                    img_symptoms = "disease",
                    img_background = "back",
                    show_image = FALSE,
                    parallel = TRUE)
)

#'
#'
#' ### Imagens processadas
## ----fig.width=10, fig.height=10-----------------------------------------------------------------------------
imgs <-
  image_import(pattern = "proc_",
               path = "processed",
               plot = TRUE,
               ncol = 5)

#'
#'
#'
#'
#' ### Um exemplo a mais
## ------------------------------------------------------------------------------------------------------------
# criar paletas
img <- image_import( "multiplas_02.jpeg")
plot(img)
back <- pick_palette(img)
l <- pick_palette(img)
d <- pick_palette(img)

# usar as paletas na estimação de severidade
sev <-
  measure_disease(pattern = "multip",
                  img_healthy = l,
                  img_symptoms = d,
                  img_background = back,
                  col_lesions = "red")

#'
#'
#' ## Número de ovos
#' O seguinte exemplo demonstra como contar o número de ovos em uma folha. A imagem foi obtida do pacote [ExpImage](https://rdrr.io/cran/ExpImage/f/vignettes/Contagem_de_objetos.Rmd). Para identificar os melhores índices para segmentação da folha/fundo e ovos/folha, a função `image_segment_iter()` é usada.
#'
#'
## ------------------------------------------------------------------------------------------------------------
ovos <- image_import("ovos.jpg", plot = TRUE)

#'
## ----eval=FALSE----------------------------------------------------------------------------------------------
## # funciona apenas em uma seção iterativa
## image_segment_iter(img, nseg = 2)
##

#'
#'
#' Após conhecer os índices, o número de ovos é computado com a função `measure_disease()`, indicando os índices para segmentação.
#'
## ------------------------------------------------------------------------------------------------------------
ovos_cont <-
  measure_disease(ovos,
                  index_lb = "HUE2",
                  index_dh = "GRAY",
                  invert = c(FALSE, TRUE),
                  threshold = c("Otsu", 0.7),
                  show_features = TRUE,
                  show_segmentation = TRUE,
                  show_contour = FALSE)
ovos_cont$statistics


ovos_cont <-
  measure_disease(ovos,
                  index_lb = "HUE2",
                  index_dh = "GRAY",
                  invert = c(FALSE, TRUE),
                  threshold = c("Otsu", 0.7),
                  show_features = TRUE,
                  show_contour = FALSE,
                  col_lesions = "blue",
                  col_background = "black")

#'
#'
## ----eval=FALSE----------------------------------------------------------------------------------------------
## # apenas na versão de desenvolvimento
## pick_count(ovos)

#'
#' ## Mensuração iterativa
#'
#' A função `measure_disease_iter()` fornece uma seção iterativa para `measure_disease()`, onde o usuário extrai amostras na imagem para criar as paletas de cores necessárias. `measure_disease_iter()` executa apenas em uma seção interativa. Nesta função, os usuários serão capazes extrair amostras de imagens para criar, iterativamente, as paletas de cores necessárias. Este processo chama `pick_palette()` internamente. Se `has_background` for `TRUE` (padrão), a paleta de cores do fundo é criada primeiro. A amostra de cores é realizada a cada clique com o botão esquerdo do mouse e continua até que o usuário pressione Esc. Em seguida, um novo processo de amostragem é realizado para amostrar a cor dos tecidos saudáveis e, em seguida, dos tecidos doentes. As paletas geradas são então passadas para `measure_disease()`. Todos os argumentos de tal função podem ser passados para `measure_disease()` usando `...` (três pontos).
#'
## ----eval=FALSE----------------------------------------------------------------------------------------------
## # somente roda em uma seção interativa
## img <- image_pliman("sev_leaf.jpg", plot = TRUE)
## measure_disease_iter(img)
##

#'
#'
#'
#' ## Desafios
#'
## ------------------------------------------------------------------------------------------------------------

img <- image_import("maize_1.png", plot = TRUE)
image_segment(img, index = "all")



img <- image_import("maize_2.png", plot = TRUE)
image_segment(img, index = "all")



img2 <- image_crop(img,
                   width = 959:32,
                   height = 163:557,
                   plot = TRUE)


image_segment_iter(img2,
                   nseg = 2, # define o número de segmentações
                   index = c("NR", "GLI"), # índices para primeira e segunda
                   invert = c(T, F), # inverter a segmentação? (passa um vetor)
                   ncol = 3) # número de colunas no plot


## ---- echo=FALSE, eval=TRUE----------------------------------------------------------------------------------

