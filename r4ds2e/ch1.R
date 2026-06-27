library(tidyverse)
library(palmerpenguins)
library(ggthemes)
library(ggplot2)

demo1.1 <- function () {
  ggplot(data=penguins)
}

demo1.2 <- function () {
  ggplot(data=penguins, mapping = aes (x = flipper_length_mm, y = body_mass_g))
}

demo1.3 <- function () {
  ggplot(data=penguins, mapping = aes (x = flipper_length_mm, y = body_mass_g)) +
  geom_point()
}

demo1.4 <- function () {
  ggplot(data=penguins, mapping = aes (x = flipper_length_mm, y = body_mass_g, color=species)) +
  geom_point()
}

demo1.5 <- function () {
  ggplot(data=penguins, mapping = aes (x = flipper_length_mm, y = body_mass_g, color=species)) +
  geom_point() +
  geom_smooth(method = "lm")
}

demo1.6 <- function () {
  ggplot(data=penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(mapping = aes(color=species)) +
  geom_smooth(method = "lm")
}

demo1.7 <- function () {
  ggplot(data=penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(mapping = aes(color=species, shape=species)) +
  geom_smooth(method = "lm")
}

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

ex1.2.5.4 <- function () {
  ggplot(data=penguins, mapping = aes(x = species, y = bill_depth_mm)) +
  geom_bar() +
  geom_smooth(method = "lm") +
  labs(
    title = "Species and bill depth",
    subtitle = "Dimension for Adelie, Chinstrap and Gentoo",
    x = "Species",
    y = "Bill depth (mm)",
  ) +
  scale_color_colorblind()
}

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

# ex1.2.5.8()
