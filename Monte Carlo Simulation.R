set.seed(123)

# Monte Carlo Implementation


# Parameters
theta <- 1
n_grid <- c(5, 10, 20, 50, 100)
M <- 10000


# Exact quantities
exact_bias <- function(n, theta) { -theta/(n+1) }
exact_var <- function(n, theta) { theta^2 * (n/(n+2) - n^2/(n+1)^2) }
exact_mse <- function(n, theta) { exact_var(n, theta) + exact_bias(n, theta)^2 }


results <- lapply(n_grid, function(n) {
  ymax <- replicate(M, max(runif(n, 0, theta)))
  bias_mc <- mean(ymax) - theta
  var_mc <- var(ymax)
  mse_mc <- mean((ymax - theta)^2)
  se_bias <- sd(ymax)/sqrt(M)
  se_var <- sd((ymax - mean(ymax))^2)/sqrt(M)
  se_mse <- sd((ymax - theta)^2)/sqrt(M)
  data.frame(
    n = n,
    bias_mc = bias_mc,
    var_mc = var_mc,
    mse_mc = mse_mc,
    bias_exact = exact_bias(n, theta),
    var_exact = exact_var(n, theta),
    mse_exact = exact_mse(n, theta),
    se_bias = se_bias,
    se_var = se_var,
    se_mse = se_mse,
    ymax = I(list(ymax))
  )
})


results <- do.call(rbind, results)

# Boxplot

boxplot_list <- lapply(seq_along(n_grid), function(i) {
  results$ymax[[i]] - theta
})


boxplot(boxplot_list, names = n_grid,
        main = "Monte Carlo Bias Distribution",
        xlab = "Sample size n",
        ylab = "Bias")


points(seq_along(n_grid), results$bias_exact, col = "red", pch = 19)


# Difference between Monte Carlo and exact bias

diff_bias <- results$bias_mc - results$bias_exact


plot(n_grid, diff_bias, type = "b",
     ylim = range(diff_bias + 2*results$se_bias, diff_bias - 2*results$se_bias),
     xlab = "n", ylab = "MC bias − exact bias",
     main = "Bias difference with simulation error")


arrows(n_grid,
       diff_bias - 2*results$se_bias,
       n_grid,
       diff_bias + 2*results$se_bias,
       angle = 90, code = 3, length = 0.05)


# Difference between Monte Carlo and exact variance

diff_var <- results$var_mc - results$var_exact


plot(n_grid, diff_var, type = "b",
     xlab = "n", ylab = "MC variance − exact variance",
     main = "Variance difference with simulation error")


arrows(n_grid,
       diff_var - 2*results$se_var,
       n_grid,
       diff_var + 2*results$se_var,
       angle = 90, code = 3, length = 0.05)


# Difference between Monte Carlo and exact MSE

diff_mse <- results$mse_mc - results$mse_exact


plot(n_grid, diff_mse, type = "b",
     xlab = "n", ylab = "MC MSE − exact MSE",
     main = "MSE difference with simulation error")


arrows(n_grid,
       diff_mse - 2*results$se_mse,
       n_grid,
       diff_mse + 2*results$se_mse,
       angle = 90, code = 3, length = 0.05)

