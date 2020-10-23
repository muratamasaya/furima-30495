window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price")
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = (priceInput.value / 10)

    const add = document.getElementById("profit");
    add.innerHTML = (priceInput.value - [priceInput.value / 10])
  })
})
