window.addEventListener('load', function() {
const priceInput = document.getElementById("item-price")
  priceInput.addEventListener("input", () => {

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(priceInput.value / 10)

    const add = document.getElementById("profit");
    add.innerHTML = Math.floor(priceInput.value - [priceInput.value / 10])
  })
})