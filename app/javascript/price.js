function price() {
  const price_input = document.getElementById("item-price");
  const add_tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  price_input.addEventListener("input", function () {
    const value = price_input.value;

    let fee = value * 0.1;
    let gains = value - fee;
    add_tax.innerHTML = fee;
    profit.innerHTML = gains;
  });
}

window.addEventListener("load", price);
