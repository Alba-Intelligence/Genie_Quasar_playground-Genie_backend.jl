
#
# Run `start_rest.jl` first
#


# RUN









nothing





using WebIO
display(plot_contour)

PlotlyBase.(x, y, f, st = :contourf)


# NOT USEFUL ANYMORE

using Plots
# gr()
# plotly()
plotlyjs()

x = range(-3, 3, length = 30)
surface(
    x,
    x,
    (x, y) -> exp(-x^2 - y^2),
    c = :viridis,
    legend = :none,
    nx = 50,
    ny = 50,
    display_option = Plots.GR.OPTION_SHADED_MESH,  # <-- series[:extra_kwargs]
)


using LaTeXStrings
plotlyjs()
plot(
    1:4,
    [[1, 4, 9, 16] * 10000, [0.5, 2, 4.5, 8]],
    labels = [
        L"\alpha_{1c} = 352 \pm 11 \text{ km s}^{-1}"
        L"\beta_{1c} = 25 \pm 11 \text{ km s}^{-1}"
    ] |> permutedims,
    xlabel = L"\sqrt{(n_\text{c}(t|{T_\text{early}}))}",
    ylabel = L"d, r \text{ (solar radius)}",
    yformatter = :plain,
    extra_plot_kwargs = KW(
        :include_mathjax => "cdn",
        :yaxis => KW(:automargin => true),
        :xaxis => KW(:domain => "auto"),
    ),
)
