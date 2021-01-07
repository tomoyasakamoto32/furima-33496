function price () {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const Tax = itemPrice.value * 0.1;
    const TaxPrice = Math.floor(Tax);
    const addTaxPrice = document.getElementById("add-tax-price");
    const Profit = document.getElementById("profit");
    const customerProfit = itemPrice.value - TaxPrice
    addTaxPrice.innerHTML = `${TaxPrice}`
    Profit.innerHTML = `${customerProfit}`
  });
}

window.addEventListener('load', price);