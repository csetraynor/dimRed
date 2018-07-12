
context("UMAP")

skip_if_no_umap_learn <- function() {
  if (!reticulate::py_module_available("umap"))
    skip("umap-learn not available, install with `pip install umap-learn`")
}

test_that("UMAP python", {
  skip_if_no_umap_learn()
  res <- embed(iris[1:4], "UMAP")
  expect_s4_class(res, "dimRedResult")
  expect_equal(res@method, "UMAP")
  expect_equal(res@pars$d, "euclidean")
  expect_equal(res@pars$knn, 15)
  expect_equal(res@pars$method, "python")
  expect_equal(res@pars$ndim, 2)
})

test_that("UMAP R", {
  res <- embed(iris[1:4], "UMAP", method = "naive")
  expect_s4_class(res, "dimRedResult")
  expect_equal(res@method, "UMAP")
  expect_equal(res@pars$d, "euclidean")
  expect_equal(res@pars$knn, 15)
  expect_equal(res@pars$method, "naive")
  expect_equal(res@pars$ndim, 2)
})