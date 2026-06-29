library(tidyverse)
library(palmerpenguins)
library(ggthemes)
library(ggplot2)

demo1.1 <- function () {
  ggplot(data=penguins)
}

# demo1.1 ()
# ggsave(filename = "ch1/demo1.1.svg")

demo1.2 <- function () {
  ggplot(data=penguins, mapping = aes (x = flipper_length_mm, y = body_mass_g))
}

# demo1.2 ()
# ggsave(filename = "ch1/demo1.2.svg")

demo1.3 <- function () {
  ggplot(data=penguins, mapping = aes (x = flipper_length_mm, y = body_mass_g)) +
  geom_point()
}

# demo1.3 ()
# ggsave(filename = "ch1/demo1.3.svg")

demo1.4 <- function () {
  ggplot(data=penguins, mapping = aes (x = flipper_length_mm, y = body_mass_g, color=species)) +
  geom_point()
}

# demo1.4 ()
# ggsave(filename = "ch1/demo1.4.svg")

demo1.5 <- function () {
  ggplot(data=penguins, mapping = aes (x = flipper_length_mm, y = body_mass_g, color=species)) +
  geom_point() +
  geom_smooth(method = "lm")
}

# demo1.5 ()
# ggsave(filename = "ch1/demo1.5.svg")

demo1.6 <- function () {
  ggplot(data=penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(mapping = aes(color=species)) +
  geom_smooth(method = "lm")
}

# demo1.6 ()
# ggsave(filename = "ch1/demo1.6.svg")

demo1.7 <- function () {
  ggplot(data=penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(mapping = aes(color=species, shape=species)) +
  geom_smooth(method = "lm")
}

# demo1.7 ()
# ggsave(filename = "ch1/demo1.7.svg")

demo1.8 <- function () {
  ggplot(data=penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(mapping = aes(color=species, shape=species)) +
  geom_smooth(method = "lm") +
  labs(
    title = "Body mass and flipper length",
    subtitle = "Dimension for Adelie, Chinstrap and Gentoo",
    x = "Flipper lenght (mm)",
    y = "Body mass (g)",
    color = "Species",
    shape = "Species"
  )
}

# demo1.8 ()
# ggsave(filename = "ch1/demo1.8.svg")

demo1.F <- function () {
  ggplot(data=penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(mapping = aes(color=species, shape=species)) +
  geom_smooth(method = "lm") +
  labs(
    title = "Body mass and flipper length",
    subtitle = "Dimension for Adelie, Chinstrap and Gentoo",
    x = "Flipper lenght (mm)",
    y = "Body mass (g)",
    color = "Species",
    shape = "Species"
  ) +
  scale_color_colorblind()
}

# demo1.F ()
# ggsave(filename = "ch1/demo1.F.svg")

ex1.2.5.3 <- function () {
  ggplot(data=penguins, mapping = aes(x = bill_depth_mm, y = bill_length_mm)) +
  geom_point(mapping = aes(color=species, shape=species)) +
  geom_smooth(method = "lm") +
  labs(
    title = "Bill depth and bill length",
    subtitle = "Dimension for Adelie, Chinstrap and Gentoo",
    x = "Bill depth (mm)",
    y = "Bill length (mm)",
    color = "Species",
    shape = "Species"
  ) +
  scale_color_colorblind()
}

# ex1.2.5.3 ()
# ggsave(filename = "ch1/ex1.2.5.3.svg")

ex1.2.5.4 <- function () {
  ggplot(penguins, aes(x = species, y = bill_depth_mm)) +
  geom_bar(color = species) +
  geom_smooth(method = "lm") +
  labs(
    title = "Species and bill depth",
    subtitle = "Dimension for Adelie, Chinstrap and Gentoo",
    x = "Species",
    y = "Bill depth (mm)",
  ) +
  scale_color_colorblind()
}

# ex1.2.5.4 ()
# ggsave(filename = "ch1/ex1.2.5.4.svg")

ex1.2.5.8 <- function () {
  # df1 <- penguins
  # df1$clr <- ave(df1$bill_depth_mm, FUN = function(x) { (x - min_depth) / max(x, na.rm = TRUE) })

  min_depth <- min(penguins$bill_depth_mm, na.rm = TRUE)
  ggplot(data=penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(mapping = aes(color=ave(penguins$bill_depth_mm, FUN = function(x) { (x - min_depth) / max(x, na.rm = TRUE) })), na.rm = TRUE) +
  scale_colour_gradient(low = "#333333", high = "#77AAFF") +
  geom_smooth(method = "gam", se = TRUE)
  # geom_smooth(method = "lm") +
}

# ex1.2.5.8 ()
# ggsave(filename = "ch1/ex1.2.5.8.svg")

ex1.4.3.1 <- function () {
  ggplot(penguins, aes(y = species)) +
  geom_bar()
}

# ex1.4.3.1 ()
# ggsave(filename = "ch1/ex1.4.3.1.svg")

demo1.5.1.a <- function () {
  ggplot(penguins, aes(x = species, y = body_mass_g)) +
  geom_boxplot()
}

# demo1.5.1.a ()
# ggsave(filename = "ch1/demo1.5.1.a.svg")

demo1.5.1.b <- function () {
  ggplot(penguins, aes(x = body_mass_g, color = species)) +
  geom_density(linewidth = 0.75)
}

# demo1.5.1.b ()
# ggsave(filename = "ch1/demo1.5.1.b.svg")

demo1.5.1.c <- function () {
  ggplot(penguins, aes(x = body_mass_g, color = species, fill=species)) +
  geom_density(alpha= 0.5)
}

# demo1.5.1.c ()
# ggsave(filename = "ch1/demo1.5.1.c.svg")

demo1.5.2.a <- function () {
  ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar()
}

# demo1.5.2.a ()
# ggsave(filename = "ch1/demo1.5.2.a.svg")

demo1.5.2.b <- function () {
  ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar(position = "fill")
}

# demo1.5.2.b ()
# ggsave(filename = "ch1/demo1.5.2.b.svg")

demo1.5.2.c <- function () {
  ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar(position = "fill") +
  labs(y = "proportion")
}

# demo1.5.2.c ()
# ggsave(filename = "ch1/demo1.5.2.c.svg")

demo1.5.2.d <- function () {
  ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point()
}

# demo1.5.2.d ()
# ggsave(filename = "ch1/demo1.5.2.d.svg")

demo1.5.2.e <- function () {
  ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(aes(color = species, shape = island))
}

# demo1.5.2.e ()
# ggsave(filename = "ch1/demo1.5.2.e.svg")

demo1.5.2.f <- function () {
  ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(aes(color = species, shape = species)) +
  facet_wrap(~island)
}

# demo1.5.2.f ()
# ggsave(filename = "ch1/demo1.5.2.f.svg")

ex1.5.5.2a <- function () {
  ggplot(mpg, aes(x = hwy, y = displ)) +
  geom_point()
}

# ex1.5.5.2a ()
# ggsave(filename = "ch1/ex1.5.5.2a.svg")

ex1.5.5.2b <- function () {
  ggplot(mpg, aes(x = hwy, y = displ, color = drv)) +
  geom_point()
}

# ex1.5.5.2b ()
# ggsave(filename = "ch1/ex1.5.5.2b.svg")

ex1.5.5.2c <- function () {
  ggplot(mpg, aes(x = hwy, y = displ, size = drv)) +
  geom_point()
}

# ex1.5.5.2c ()
# ggsave(filename = "ch1/ex1.5.5.2c.svg")

ex1.5.5.2d <- function () {
  ggplot(mpg, aes(x = hwy, y = displ, color = fl, shape = drv)) +
  geom_point()

# ex1.5.5.2d ()
# ggsave(filename = "ch1/ex1.5.5.2d.svg")
}

ex1.5.5.3 <- function () {
  ggplot(mpg, aes(x = hwy, y = displ, color = cty, shape = drv)) +
  geom_point(size = 3)
}

# ex1.5.5.3 ()
# ggsave(filename = "ch1/ex1.5.5.3.svg")

ex1.5.5.4 <- function () {
  ggplot(mpg, aes(x = hwy, y = displ, color = cty, shape = drv)) +
  geom_point(aes(size = cty))
}

# ex1.5.5.4 ()
# ggsave(filename = "ch1/ex1.5.5.4.svg")

ex1.5.5.5 <- function () {
  ggplot(penguins, aes(x = bill_depth_mm, y = bill_length_mm, color = species)) +
  geom_point(aes(size = body_mass_g, shape = island)) +
  labs(
    title = "Bill Length x Bill Depth",
    subtitle = "Colored by species and body mass reflected in the sizes, and the island in the shapes",
    x = "Bill Length (mm)",
    y = "Bill Depth (mm)",
    color = "Species",
    size = "Body Mass(g)",
    shape = "Island",
    caption = "Demonstrating how to develop a pretty graph with ggplot"
  ) +
  scale_color_colorblind()
}

# ex1.5.5.5 ()
# ggsave(filename = "ch1/ex1.5.5.5.svg")
