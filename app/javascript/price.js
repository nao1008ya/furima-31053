function price (){
  const priceText  = document.getElementById("item-price");
  priceText.addEventListener("keyup", () => {
    const price = priceText.value;
    const addTaxPrice  = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = `${price * 0.1}`;
    const Profit  = document.getElementById("profit");
    Profit.innerHTML = `${price-(price * 0.1)}`;
  });
}

window.addEventListener('load', price);