library(ggplot2)

serialization_quadrant_plot <- function() {
  # Create a conceptual quadrant plot for API request strategies
  ggplot() +
    # Add quadrant background rectangles
    annotate(
      "rect",
      xmin = 0,
      xmax = 0.5,
      ymin = 0.5,
      ymax = 1,
      fill = "#d4edda",
      alpha = 0.3
    ) + # Top-left: Best
    annotate(
      "rect",
      xmin = 0.5,
      xmax = 1,
      ymin = 0.5,
      ymax = 1,
      fill = "#fff3cd",
      alpha = 0.3
    ) + # Top-right: Minimal
    annotate(
      "rect",
      xmin = 0,
      xmax = 0.5,
      ymin = 0,
      ymax = 0.5,
      fill = "#fff3cd",
      alpha = 0.3
    ) + # Bottom-left: Minimal
    annotate(
      "rect",
      xmin = 0.5,
      xmax = 1,
      ymin = 0,
      ymax = 0.5,
      fill = "#f8d7da",
      alpha = 0.3
    ) + # Bottom-right: Worst

    # Add quadrant labels
    annotate(
      "text",
      x = 0.25,
      y = 0.75,
      label = "Okay",
      size = 8,
      fontface = "bold",
      color = "#155724"
    ) +
    annotate(
      "text",
      x = 0.75,
      y = 0.75,
      label = "Best",
      size = 8,
      fontface = "bold",
      color = "#856404"
    ) +
    annotate(
      "text",
      x = 0.25,
      y = 0.25,
      label = "Nah",
      size = 8,
      fontface = "bold",
      color = "#856404"
    ) +
    annotate(
      "text",
      x = 0.75,
      y = 0.25,
      label = "Okay",
      size = 8,
      fontface = "bold",
      color = "#721c24"
    ) +

    # Add dividing lines
    geom_hline(
      yintercept = 0.5,
      linetype = "dashed",
      linewidth = 1,
      color = "gray40"
    ) +
    geom_vline(
      xintercept = 0.5,
      linetype = "dashed",
      linewidth = 1,
      color = "gray40"
    ) +

    # Set axis labels and theme
    scale_x_continuous(limits = c(0, 1), expand = c(0, 0)) +
    scale_y_continuous(limits = c(0, 1), expand = c(0, 0)) +
    labs(
      x = "Request Volume →",
      y = "Payload Size →",
      title = "The benefit of optimizing serialization depends on\npayload size and request volume"
    ) +
    theme_minimal(base_size = 14) +
    theme(
      plot.title = element_text(hjust = 0.5, face = "bold", size = 16),
      plot.margin = margin(t = 20, r = 10, b = 10, l = 10),
      axis.title.x = element_text(margin = margin(t = 10)),
      axis.title.y = element_text(margin = margin(r = 10)),
      axis.text = element_blank(),
      panel.grid = element_blank(),
      panel.border = element_rect(color = "gray40", fill = NA, linewidth = 1)
    )
}
