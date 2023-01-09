function pullDown() {
  const itemPrice = document.getElementById("item-price")
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  itemPrice.addEventListener("input", ()=> {
    addTaxPrice.textContent = Math.floor(itemPrice.value * 0.1);
    profit.textContent = (itemPrice.value - addTaxPrice.textContent);
  });
}
window.addEventListener('load', pullDown)