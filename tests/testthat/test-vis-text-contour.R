library(ggplot2)
library(vdiffr)

skip_on_travis()
context("text_contour")
data(geopotential)
geo <- subset(geopotential, date == date[1])

test_that("contour_text wokrs", {

    expect_doppelganger("text_contour base",
                        ggplot(geo, aes(lon, lat)) +
                            geom_contour(aes(z = gh)) +
                            geom_text_contour(aes(z = gh))
    )

    expect_doppelganger("text_contour norotate",
                        ggplot(geo, aes(lon, lat)) +
                            geom_contour(aes(z = gh)) +
                            geom_text_contour(aes(z = gh), rotate = FALSE)
    )



    expect_doppelganger("placement_fraction",
                        ggplot(geo, aes(lon, lat)) +
                            geom_contour(aes(z = gh)) +
                            geom_text_contour(aes(z = gh),
                                              label.placement = label_placement_fraction(c(0.25, 0.75)))
    )

    expect_doppelganger("placement_minmax-vertical",
                        ggplot(geo, aes(lon, lat)) +
                            geom_contour(aes(z = gh)) +
                            geom_text_contour(aes(z = gh),
                                              label.placement = label_placement_minmax())
    )

    expect_doppelganger("placement_minmax-horizontal",
                        ggplot(geo, aes(lon, lat)) +
                            geom_contour(aes(z = gh)) +
                            geom_text_contour(aes(z = gh),
                                              label.placement = label_placement_minmax("horizontal"))
    )


    expect_doppelganger("placement_n",
                        ggplot(geo, aes(lon, lat)) +
                            geom_contour(aes(z = gh)) +
                            geom_text_contour(aes(z = gh),
                                              label.placement = label_placement_n(2))
    )


    expect_doppelganger("minsize",
                        ggplot(geo, aes(lon, lat)) +
                            geom_contour(aes(z = gh)) +
                            geom_text_contour(aes(z = gh), skip = 0, min.size = 30)
    )



})